# A string may hold `${...}` with no flag of that name.
# Expect: rows Q = [("costs ${amount}",)]
Q(s: "costs ${amount}");
