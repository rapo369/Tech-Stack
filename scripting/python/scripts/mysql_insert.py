import MySQLdb

db = MySQLdb.connect("localhost","root","Formac@2016!","testdb")

cursor = db.cursor()

#cursor.execute("CREATE DATABASE testdb CHARACTER SET utf8 COLLATE utf8_general_ci")

cursor.execute("DROP TABLE IF EXISTS EMPLOYEE")

createTable = """CREATE TABLE EMPLOYEE  (
	FIRST_NAME CHAR(20) NOT NULL,
	LAST_NAME CHAR(20),
	AGE INT,
	SEX CHAR(1),
	INCOME FLOAT )"""

try:
    cursor.execute(createTable)
    db.commit()
except:
    db.rollback()

insertData = """INSERT INTO EMPLOYEE (FIRST_NAME,LAST_NAME,AGE,SEX,INCOME) VALUES ('Howard','Roark',21,'M',20000.00)"""

try:
    cursor.execute(insertData)
    db.commit()
except:
    db.close()

