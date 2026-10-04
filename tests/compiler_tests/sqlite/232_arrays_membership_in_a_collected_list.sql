WITH t_0_L AS (SELECT
  JSON_GROUP_ARRAY(x_8.value) AS l
FROM
  JSON_EACH(JSON_ARRAY(1, 3)) as x_8)
SELECT
  x_3.value AS x
FROM
  t_0_L AS L, JSON_EACH(L.l) as x_3, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_5
WHERE
  (x_5.value = x_3.value) ORDER BY x;