# Now's text is "YYYY-MM-DD HH:MM:SS..." on every engine: a space between
# the date and the time.
# Expect: rows Q = [(" ", "-", ":")]
Q(sep: Substr(t, 11, 1), d: Substr(t, 8, 1), c: Substr(t, 14, 1)) :- Now(timestamp:), t == ToString(timestamp);
