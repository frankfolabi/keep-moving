from flask_login import UserMixin

class User(UserMixin):
    def __init__(self, data):
        self.id = data['id']
        self.password = data.get('password')

