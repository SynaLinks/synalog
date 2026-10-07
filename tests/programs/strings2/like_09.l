# Like with the pattern 'A%': % any text, _ one character, a backslash escapes.
# Expect: rows Q = [('Ab',)]
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
Q(w:) :- W(w:), Like(w, "A%");
