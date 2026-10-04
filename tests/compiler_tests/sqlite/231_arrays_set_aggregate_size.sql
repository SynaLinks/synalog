WITH t_0_L AS (SELECT
  DistinctListAgg(x_3.value) AS l
FROM
  JSON_EACH(JSON_ARRAY(1, 1, 2)) as x_3)
SELECT
  JSON_ARRAY_LENGTH(L.l) AS n
FROM
  t_0_L AS L;