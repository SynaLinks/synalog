SELECT
  x_1 AS `order`
FROM
  UNNEST(ARRAY[2, 3, 1]) as x_1 ORDER BY `order` DESC;