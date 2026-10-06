# A grounded table is copied to no file.
# Expect: error copy_to_file is not supported
@Ground(Q, copy_to_file: "/tmp/synalog_x.json");
Q(x: 1);
