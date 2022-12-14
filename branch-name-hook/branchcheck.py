import subprocess
 
# Using system() method to
# execute shell commands
process = subprocess.Popen('git rev-parse --abbrev-ref HEAD', shell=True, stdout=subprocess.PIPE)
local_branch = process.stdout.read().decode('utf-8').strip()

print(local_branch)