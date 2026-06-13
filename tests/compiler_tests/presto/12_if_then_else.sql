SELECT
  x_8 AS score,
  CASE WHEN (x_8 >= 12) THEN 'A' WHEN (x_8 >= 9) THEN 'B' WHEN (x_8 >= 6) THEN 'C' WHEN (x_8 >= 3) THEN 'D' ELSE 'F' END AS letter
FROM
  UNNEST(SEQUENCE(0, 15 - 1)) as pushkin(x_8) ORDER BY score;