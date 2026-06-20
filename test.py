import os
import subprocess
from threading import Thread
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, World!"

def run_flask():
    app.run(port=8000, host='0.0.0.0')

def run_test():
    _setup = str(os.getenv('SETUP_CMD') or "").replace("\r", "")
    _cmd = subprocess.run(_setup, shell=True)
    print(f"Setup command: {_cmd.stdout}")

t1 = Thread(target=run_test)
t1.start()
