WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      10 AS id,
      1 AS s
   UNION ALL
  
    SELECT
      30 AS id,
      9 AS s
   UNION ALL
  
    SELECT
      20 AS id,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(V.s AS value, V.id AS arg)), false)[0].arg AS w
FROM
  t_1_V AS V;