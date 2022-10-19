from flask import request, Flask
import json, time, os

app = Flask(__name__)
agent = os.environ.get('HOSTNAME')

@app.route('/')

def hello_world():
    return 'Hello from instance no: ' + str(agent)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')