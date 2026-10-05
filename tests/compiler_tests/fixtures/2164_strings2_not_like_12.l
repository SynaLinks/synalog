# Test: Words not like '%'. (from tests/programs/strings2/not_like_12.l)

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
Q(w:) :- W(w:), Like(w, "%") == false;
