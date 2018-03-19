import os
import datetime
import time
import MySQLdb
import shutil


os.chdir('/apps')
dateNow = datetime.datetime.now().strftime("%y-%m-%d-%H%M%S")

print dateNow

dirPath = "/apps/testdbbkps/" + dateNow

print "Directory is : " + dirPath

if os.path.isdir(dirPath):

        print "dir already exists"
else:
        os.makedirs(dirPath)
        os.chdir(dirPath)

# get databases list
# loop through databases abd dump in particular folder
# zip the dump files
# find and remove backups older than seven days
# sync to s3 bucket

dbUser = "root"
dbPass = ""
dbHost = "localhost"
#filetimestamp = time.strftime('%Y-%m-%d-%I:%M:%S')

db = MySQLdb.connect(dbHost,dbUser,dbPass)
cursor = db.cursor()

dbList = "show databases"

cursor.execute(dbList)

for database in cursor:

    dbName = database[0]

    if dbName not in ['sys','mysql','performance_schema','information_schema']:
        print database[0]
        print "taking dump:"
        os.system("mysqldump -u %s -p%s -h %s -e --opt -c %s | gzip -c > %s.gz" % (dbUser,dbPass,dbHost,dbName,dbName))


db.close()

path="/apps/testdbbkps"
os.chdir(path)
now = time.time()
old = now - 604800

directories = os.listdir(path)

for eachDir in  directories:

    dirName = eachDir
    if os.path.getmtime(dirName) < old:

        print dirName
        print os.path.getmtime(dirName)
        shutil.rmtree(dirName)




