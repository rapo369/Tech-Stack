import MySQLdb

# you should have installed MySQLdb module using pip, before using it.

# pip install MySQL-python


# open a connection

#db = MySQLdb.connect("localhost","root","Formac@2016!","test")
db = MySQLdb.connect("localhost","root","Formac@2016!")

# prepare a cursor object using cursor() method

cursor = db.cursor()

# execute SQL query using execute() method.

cursor.execute("SELECT VERSION()")

# Fetch a single row using fetchone() method.

data = cursor.fetchone()

print "Database version : %s" % data

# close connection

db.close()


