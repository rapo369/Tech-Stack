import os

#os.system('ls.sh;export PATH=$PATH:/home/prakash;ls.sh') ## this variable is valid for only one command

#os.putnev('ENV_VAR1', '123')  ## this variable is valid for only one command
#print ENV_VAR1


print(os.environ['HOME'])

# from jenkins

print(os.environ['py_param1'])
print(os.environ['py_param2'])


