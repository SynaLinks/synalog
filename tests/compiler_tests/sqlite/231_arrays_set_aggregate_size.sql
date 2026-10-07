WITH t_1_L AS (SELECT
  DistinctListAgg(x_3.value) AS l
FROM
  JSON_EACH(JSON_ARRAY(1, 1, 2)) as x_3)
SELECT
  JSON_ARRAY_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;