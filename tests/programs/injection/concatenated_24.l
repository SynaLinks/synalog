# The string concatenated around.
# Expect: rows Q = [("['+(SELECT 1)+']",)]
Q(s: "[" ++ "'+(SELECT 1)+'" ++ "]");
