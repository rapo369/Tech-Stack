import sys
import fileinput

## replace strings in file


#with fileinput.FileInput(fileToSearch, inplace=True, backup='.bak') as file:
#    for line in file:
#        print(line.replace(textToSearch, textToReplace), end='')

## replace entire line if line starts with specified pattern

for line in fileinput.input('input.txt', inplace=True):
    if line.strip().startswith('old'):
        line = 'new\n'
    sys.stdout.write(line)

## Run Database changes

#
#

## tar and backup code directory

#     with tarfile.open(output_filename, "w:gz") as tar:
#        tar.add(source_dir, arcname=os.path.basename(source_dir))
