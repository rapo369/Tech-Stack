import subprocess
from subprocess import CalledProcessError
import shlex

try:
    #outp=subprocess.call(['ls','-l'])
    #subprocess.check_call(['false'])
    #subprocess.check_output(['ls','-l'])
    outp=subprocess.check_output(['ls' ,'-v' ,'.'])
    print "output is"
    print outp
    
except CalledProcessError:
    print "false output"

print "============================================"

proc = subprocess.Popen(['ls', '-v', '.'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

(second_op , second_err) = proc.communicate()

print "output is :" + second_op + "error is :" + second_err


print "============================================="

import subprocess
#process = subprocess.Popen(['ls', '-l'], stdout=subprocess.PIPE)
process = subprocess.Popen(shlex.split("ls -v ."), stdout=subprocess.PIPE)
while True:
        output = process.stdout.readline()
        if output == '' and process.poll() is not None:
            break
        if output:
            print output.strip()
#    rc = process.poll()











