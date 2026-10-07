# ToString and ToInt64.
# Expect: rows C = [("12", 13)]
C(s: ToString(12), n: ToInt64("12") + 1);
