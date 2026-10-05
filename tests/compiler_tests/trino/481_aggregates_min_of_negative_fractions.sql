SELECT
  MIN(x_2) AS m
FROM
  UNNEST(ARRAY[-1.5E0, -2.5E0, 0.5E0]) as pushkin(x_2);