SELECT
  x_1 AS `group`
FROM
  UNNEST(ARRAY["a", "b"]) as x_1 ORDER BY `group`;