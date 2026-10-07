SELECT
  ((2) + (((3) * (4)))) AS a,
  ((((2) + (3))) * (4)) AS b,
  (((7) - (3) * CAST((7) / NULLIF(3, 0) AS INTEGER))) AS c;