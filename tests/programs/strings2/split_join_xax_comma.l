# Splitting then joining ',a,' gives it back.
# Expect: rows Q = [(',a,',)]
Q(s: Join(Split(",a,", ","), ","));
