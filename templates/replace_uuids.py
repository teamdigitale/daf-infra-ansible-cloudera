'''
Script for automatic UUID replacement in Altus Director's JSON templates
'''

import os, sys
import re
import uuid

if len(sys.argv) != 2:
    print "Usage: python " + sys.argv[0] + " <file>"
    sys.exit(1)

file_path = os.path.abspath(sys.argv[1])
tmp_path = file_path + "_tmp"

source_file = open(file_path, "r")
dest_file = open(tmp_path,"w")

for line in source_file:
    dest_file.write(re.sub(r'([a-z0-9]{8})-([a-z0-9]{4})-([a-z0-9]{4})-([a-z0-9]{4})-([a-z0-9]{12})', str(uuid.uuid4()), line))

source_file.close()
dest_file.close()
os.remove(file_path)
os.rename(tmp_path, file_path)
