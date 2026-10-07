# A program opens no database file.
# Expect: error @AttachDatabase is not supported
@AttachDatabase(other, "/tmp/synalog_x.db");
Q(x: 1);
