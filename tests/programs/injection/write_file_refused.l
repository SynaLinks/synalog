# A program writes no file.
# Expect: error Undefined function 'WriteFile'
Q(v: WriteFile("/tmp/synalog_x", content: "x"));
