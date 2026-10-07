# Test: Its length counts its characters. (from tests/programs/injection/length_16.l)

Q(n: Length("' || (SELECT 1) || '"));
