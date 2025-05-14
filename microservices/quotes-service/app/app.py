from flask import Flask, jsonify
import random
from quotes import QUOTES

app = Flask(__name__)

@app.route("/quote", methods=["GET"])
def get_quote():
    quote = random.choice(QUOTES)
    return jsonify({"quote": quote})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)

