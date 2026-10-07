SELECT
  ((7) / NULLIF(2, 0)) AS a,
  - ((7) / NULLIF(2, 0)) AS b,
  ((6) / NULLIF(3, 0)) AS c;