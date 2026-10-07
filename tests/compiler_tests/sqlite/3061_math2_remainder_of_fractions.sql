SELECT
  (((7.5) - (2) * CAST((7.5) / NULLIF(2, 0) AS INTEGER))) AS a,
  - (((7.5) - (2) * CAST((7.5) / NULLIF(2, 0) AS INTEGER))) AS b,
  (((5.5) - (2.5) * CAST((5.5) / NULLIF(2.5, 0) AS INTEGER))) AS c;