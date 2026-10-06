SELECT
  - (((7) - (3) * CAST((7) / NULLIF(3, 0) AS INTEGER))) AS a,
  (((7) - (-3) * CAST((7) / NULLIF(-3, 0) AS INTEGER))) AS b;