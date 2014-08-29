from flask import Flask, url_for, request, render_template, redirect
from flask.ext.sqlalchemy import SQLAlchemy
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
db = SQLAlchemy(app)

class Link(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	longurl = db.Column(db.String(255))
	
	def __init__(self, longurl):
		self.longurl = longurl
	
	def __repr__(self):
		return 'ShortURL %r' % self.id

# Each of these route blocks are referred to as 'Views'
@app.route("/")
def home():
	return render_template('home.html',
		title = "Home")

# API to return id as text
@app.route("/api/<path:longurl>")
def api(longurl):
	# add record to db
	link_record = Link(longurl)
	db.session.add(link_record)
	db.session.commit()
	# return short url
	return str(link_record.id)

# Redirect an integer to the longurl
@app.route("/<int:url_id>")
def redir_route(url_id):
	# get longurl from db
	link_record = Link.query.get(url_id)
	# redirect to longurl
	return redirect(link_record.longurl)

if __name__ == "__main__":
	app.run(debug=True,host='0.0.0.0')
