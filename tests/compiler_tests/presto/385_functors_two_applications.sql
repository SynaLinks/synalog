SELECT
  SUM(x_2) AS t
FROM
  UNNEST(ARRAY[10, 20]) as pushkin(x_2);