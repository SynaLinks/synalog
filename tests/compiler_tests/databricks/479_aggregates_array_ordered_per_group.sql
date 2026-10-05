WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      "x" AS g,
      2 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      "x" AS g,
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      "y" AS g,
      5 AS k,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(t_0_V.k AS arg, t_0_V.v AS value))), s -> s.value) AS l
FROM
  t_2_V AS t_0_V
GROUP BY 1 ORDER BY g NULLS LAST;