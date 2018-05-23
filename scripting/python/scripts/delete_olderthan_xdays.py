import os
import time
import shutil

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



