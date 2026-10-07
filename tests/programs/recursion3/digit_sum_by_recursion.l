# The sum of the digits of 98765, one digit at a time.
# Expect: rows Q = [(35,)]
@Recursive(S, -1);
S(rest: 98765, sum: 0) distinct;
S(rest: Div(rest, 10), sum: sum + rest % 10) distinct :- S(rest:, sum:), rest > 0;
Q(s:) :- S(rest: 0, sum: s);
