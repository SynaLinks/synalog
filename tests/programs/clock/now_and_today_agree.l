# Now's date is Today, in any time zone.
# Expect: rows Q = [(1,)]
Q(n? += 1) distinct :- Now(timestamp:), Today(date:), Substr(ToString(timestamp), 1, 10) == date;
