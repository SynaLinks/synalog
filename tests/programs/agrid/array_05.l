# Join(Split("a-b", "-"), "+").
# Expect: rows A = [("a+b",)]
A(v: Join(Split("a-b", "-"), "+"));
