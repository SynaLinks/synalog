# Nor a configuration value.
# Expect: rows Q = [("x${hiveconf:hive.metastore.uris}y",)]
Q(s: "x${hiveconf:hive.metastore.uris}y");
