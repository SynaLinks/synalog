# Words not like '50\\%'.
# Expect: rows Q = [('',), ('500',), ('Ab',), ('_x',), ('a%c',), ('aXc',), ('a_c',), ('abc',), ('ac',), ('hello world',), ('x\\y',)]
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
@OrderBy(Q, "w");
Q(w:) :- W(w:), Like(w, "50\%") == false;
