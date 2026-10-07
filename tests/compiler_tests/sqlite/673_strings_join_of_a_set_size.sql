WITH t_0_C AS (SELECT
  DistinctListAgg(x_3.value) AS s
FROM
  JSON_EACH(SPLIT('a b a', ' ')) as x_3)
SELECT
  JSON_ARRAY_LENGTH(C.s) AS n
FROM
  t_0_C AS C;