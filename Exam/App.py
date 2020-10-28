from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)

#MySqlConnection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'zombie'
mysql = MySQL(app)

#Settings
app.secret_key = "mysecretkey"

@app.route('/')
def Index():
	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM zombies")
	data = cur.fetchall()
	print(data)
	return render_template('index.html', contacts = data)

@app.route('/add_contact', methods=['POST'])
def add_contact():
	if request.method == 'POST':
		fullname = request.form['fullname']
		status = request.form['status']
		#email = request.form['email']
		cur = mysql.connection.cursor()
		cur.execute("INSERT INTO zombies (nombre, date_n, status) VALUES (%s, CURRENT_TIMESTAMP(), %s)", (fullname,status))
		mysql.connection.commit()
		flash('Zombie Agregado con Exito')
		return redirect(url_for('Index'))

@app.route('/edit/<id>')
def get_contact(id):
	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM zombies WHERE id = %s", (id))
	data = cur.fetchall()
	return render_template('edit-contact.html', contact = data[0])

@app.route('/update/<id>', methods = ['POST'])
def update_contact(id):
	if request.method == 'POST':
		fullname = request.form['fullname']
		status = request.form['status']
		#email = request.form['email']
		cur = mysql.connection.cursor()
		cur.execute("INSERT INTO zombies (nombre, date_n, status) VALUES (%s, CURRENT_TIMESTAMP(), %s)", (fullname,status))
		mysql.connection.commit()
		flash('Zombie Actualizado con Exito')
		return redirect(url_for('Index'))

@app.route('/delete/<string:id>')
def delete_contact(id):
	cur = mysql.connection.cursor()
	cur.execute("DELETE FROM zombies WHERE id = {0}".format(id))
	mysql.connection.commit()
	flash('Zombie Eliminado con Exito')
	return redirect(url_for('Index'))

if __name__ == '__main__':
	app.run(port = 3000, debug = True)