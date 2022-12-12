#!/usr/bin/python3
'''creating subpaths in flask
'''
from flask import Flask
from markupsafe import escape


app = Flask(__name__)


@app.route('/', strict_slashes=False)
def index():
    '''Function to the root page
    '''
    return "Hello HBNB!"


@app.route('/hbnh', strict_slashes=False)
def hbnb():
    '''Function to route location hbnb
    '''
    return "HBNB"


@app.route('/c/<text>', strict_slashes=False)
def index_c(text):
    return "C {}".format(escape(text.replace('_', ' ')))


@app.route('/python/', strict_slashes=False)
def index_pys():
    return "Python is cool"


@app.route('/python/<text>', strict_slashes=False)
def index_pyts(text):
    return "Python {}".format(escape(text.replace('_', ' ')))


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
