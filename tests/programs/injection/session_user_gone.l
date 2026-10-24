# SessionUser is not a built-in: a program cannot read the database identity.
# Expect: error Undefined function 'SessionUser'
Q(x:) :- x == SessionUser();
