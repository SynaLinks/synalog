SELECT
  SUM(x_2) AS t
FROM
  UNNEST(ARRAY[0.1E0, 0.2E0, 0.3E0]) as pushkin(x_2);