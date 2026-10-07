# A program reads no file: ReadFile is no function.
# Expect: error Undefined function 'ReadFile'
Q(v: ReadFile("/etc/hosts"));
