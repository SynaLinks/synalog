# Test: An integer keeps every digit below 10^18. (from tests/programs/numtext/exact_big_integer.l)

Q(s: ToString(ToInt64(9007199254740993) + 0));
