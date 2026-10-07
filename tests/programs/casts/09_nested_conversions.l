# Conversions nested several deep.
# Expect: rows C = [(3,)]
C(n: ToInt64(ToString(ToInt64(ToString(ToInt64(ToString(ToInt64(ToString(ToInt64(2.5))))))))));
