# Its length counts its characters.
# Expect: rows Q = [(20,)]
Q(n: Length("' || (SELECT 1) || '"));
