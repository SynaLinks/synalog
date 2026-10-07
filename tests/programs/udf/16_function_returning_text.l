# A function building text.
# Expect: rows S = [("<b>",)]
Tag(x) = "<" ++ x ++ ">";
S(v: Tag("b"));
