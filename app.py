import os

import flask
from flask import render_template
from flask import request

app = flask.Flask(__name__)


@app.route("/")
def hello():

    return render_template("index.html",request=request)

app.run(port=5000, host="0.0.0.0",debug=True)
