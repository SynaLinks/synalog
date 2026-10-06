SELECT
  1 AS a,
  4 AS b,
  (CAST(1 AS REAL) / NULLIF(4, 0)) AS q;