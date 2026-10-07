WITH t_1_L AS (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE JSON_GROUP_ARRAY(x_8.value) END) AS l
FROM
  JSON_EACH(JSON_ARRAY(3, 5)) as x_8)
SELECT
  x_3.value AS x
FROM
  t_1_L AS t_0_L, JSON_EACH(t_0_L.l) as x_3, JSON_EACH(JSON_ARRAY(1, 3)) as x_5
WHERE
  (x_5.value = x_3.value);