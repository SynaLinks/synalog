# Statistics over any values: apply them with Total(Src: YourValues).
# Expect: valid
Src(x: 0);
Total(t? += x) distinct :- Src(x:);
Count(n? += 1) distinct :- Src(x:);
Largest(m? Max= x) distinct :- Src(x:);
