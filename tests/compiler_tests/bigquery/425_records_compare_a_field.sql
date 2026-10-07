WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      STRUCT(1 AS k, "a" AS s) AS r
   UNION ALL
  
    SELECT
      STRUCT(2 AS k, "b" AS s) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.r.s AS s
FROM
  t_0_V AS V
WHERE
  (V.r.k > 1);