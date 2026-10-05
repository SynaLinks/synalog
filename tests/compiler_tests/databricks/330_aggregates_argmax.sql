WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      3 AS s
   UNION ALL
  
    SELECT
      "b" AS n,
      5 AS s
   UNION ALL
  
    SELECT
      "c" AS n,
      1 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(V.s AS value, V.n AS arg)), false)[0].arg AS w
FROM
  t_1_V AS V;