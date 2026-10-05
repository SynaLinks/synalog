WITH t_1_L AS (SELECT
  ARRAY_AGG(x_8) AS l
FROM
  UNNEST(ARRAY[3, 5]) as x_8)
SELECT
  x_3 AS x
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_3, UNNEST(ARRAY[1, 3]) as x_5
WHERE
  (x_5 = x_3);