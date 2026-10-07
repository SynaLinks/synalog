# Test: 0.1 + 0.2 compared with a tolerance. (from tests/programs/execution/74_float_comparison.l)

R(x: 1) :- Abs(0.1 + 0.2 - 0.3) < 0.000001;
