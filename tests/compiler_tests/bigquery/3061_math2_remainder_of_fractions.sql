SELECT
  (MOD(7.5, NULLIF(2, 0))) AS a,
  - (MOD(7.5, NULLIF(2, 0))) AS b,
  (MOD(5.5, NULLIF(2.5, 0))) AS c;