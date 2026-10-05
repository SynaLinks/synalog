# Words containing 'o w'.
# Expect: rows Q = [('hello world',)]
W(w: "a_c");
W(w: "abc");
W(w: "50%");
W(w: "500");
W(w: "x\y");
W(w: "");
W(w: "Ab");
W(w: "a%c");
W(w: "aXc");
W(w: "ac");
W(w: "hello world");
W(w: "_x");
Q(w:) :- W(w:), Like(w, "%o w%");
