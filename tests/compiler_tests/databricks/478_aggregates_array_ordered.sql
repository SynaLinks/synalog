WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      "c" AS v
   UNION ALL
  
    SELECT
      1 AS k,
      "a" AS v
   UNION ALL
  
    SELECT
      2 AS k,
      "b" AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(t_0_V.k AS arg, t_0_V.v AS value))), s -> s.value) AS l
FROM
  t_2_V AS t_0_V;