SELECT
  x_3 AS d,
  SUBSTR(x_3, 6, 2) AS p
FROM
  UNNEST(ARRAY['2024-03-09', '2023-11-30', '2024-01-15']) as pushkin(x_3) ORDER BY d;