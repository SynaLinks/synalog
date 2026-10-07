SELECT
  (((7) - (3) * CAST((7) / NULLIF(3, 0) AS INTEGER))) AS a,
  (((9) - (3) * CAST((9) / NULLIF(3, 0) AS INTEGER))) AS b,
  (((2) - (5) * CAST((2) / NULLIF(5, 0) AS INTEGER))) AS c;