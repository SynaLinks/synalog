# Test: Zero-padding to two digits. (from tests/programs/udf/06_pad2.l)

Pad2(x) = (if x < 10 then "0" ++ ToString(x) else ToString(x));
S(a: Pad2(5), b: Pad2(12));
