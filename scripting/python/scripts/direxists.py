import os

if os.path.isdir("/home/prakash/testdir/test/test/test"):

	#os.mkdir("/home/prakash/testdir")
	print "dir already exists"
else:
	os.makedirs("/home/prakash/testdir/test/test/test")
