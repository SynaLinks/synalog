WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY['a', 'b'] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  CARDINALITY(V.l) AS n
FROM
  t_0_V AS V ORDER BY k;