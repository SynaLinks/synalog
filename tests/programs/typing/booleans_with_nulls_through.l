# A boolean column with a null, passed on and tested.
# Expect: rows Q = [(2,)]
V(k: 1, b: null);
V(k: 2, b: true);
V(k: 3, b: false);
W(k:, b:) :- V(k:, b:);
Q(k:) :- W(k:, b:), b;
