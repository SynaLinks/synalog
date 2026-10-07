# Numbers whose 16th significant digit is a 5 as written: rounded up, as the text shows them.
# Expect: rows Q = [(0, '342547.084325037'), (1, '178363692780.05'), (2, '35538.7803957438'), (3, '-127676.266745141')]
V(k: 0, x: 342547.0843250365);
V(k: 1, x: 178363692780.0495);
V(k: 2, x: 35538.78039574375);
V(k: 3, x: -127676.26674514147);
@OrderBy(Q, "k");
Q(k:, t: ToString(x)) :- V(k:, x:);
