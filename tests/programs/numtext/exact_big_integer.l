# An integer keeps every digit below 10^18.
# Expect: rows Q = [('9007199254740993',)]
Q(s: ToString(ToInt64(9007199254740993) + 0));
