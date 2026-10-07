# Test: Words not like 'a_%'. (from tests/programs/strings2/not_like_13.l)

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
Q(w:) :- W(w:), Like(w, "a_%") == false;
