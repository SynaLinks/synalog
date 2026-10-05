# Test: Now's date is Today, in any time zone. (from tests/programs/clock/now_and_today_agree.l)

Q(n? += 1) distinct :- Now(timestamp:), Today(date:), Substr(ToString(timestamp), 1, 10) == date;
