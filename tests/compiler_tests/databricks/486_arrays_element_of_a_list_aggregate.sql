WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      "b" AS v
   UNION ALL
  
    SELECT
      1 AS k,
      "a" AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(t_2_V.k AS arg, t_2_V.v AS value))), s -> s.value) AS l
FROM
  t_4_V AS t_2_V)
SELECT
  ELEMENT_AT(t_0_L.l, 0 + 1) AS first
FROM
  t_1_L AS t_0_L;