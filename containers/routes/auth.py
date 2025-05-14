from flask import render_template, request, redirect, url_for, flash, session
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
import boto3
from werkzeug.security import generate_password_hash, check_password_hash
from .models import User  # This class interacts with DynamoDB

# Setup Flask-Login
login_manager = LoginManager()
login_manager.login_view = "login"

# DynamoDB setup
dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
user_table = dynamodb.Table('flask_users')  

@login_manager.user_loader
def load_user(user_id):
    response = user_table.get_item(Key={'id': user_id})
    if 'Item' in response:
        return User(response['Item'])
    return None

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # Check if user already exists
        existing_user = user_table.get_item(Key={'id': email})
        if 'Item' in existing_user:
            flash('Email already registered.', 'danger')
            return redirect(url_for('register'))

        hashed_password = generate_password_hash(password)

        user_table.put_item(Item={
            'id': email,
            'password': hashed_password
        })

        flash('Registration successful! You can now log in.', 'success')
        return redirect(url_for('login'))

    return render_template('register.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = user_table.get_item(Key={'id': email})
        if 'Item' in user:
            user_data = user['Item']
            if check_password_hash(user_data['password'], password):
                login_user(User(user_data))
                flash('Logged in successfully.', 'success')
                return redirect(url_for('index'))
            else:
                flash('Invalid credentials.', 'danger')
        else:
            flash('User not found.', 'danger')

    return render_template('login.html')


@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('You have been logged out.', 'info')
    return redirect(url_for('login'))

