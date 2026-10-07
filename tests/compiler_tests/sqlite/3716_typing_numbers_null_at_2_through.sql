WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(1, 2) AS v
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY(3) AS v
   UNION ALL
  
    SELECT
      3 AS k,
      null AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  JSON_ARRAY_LENGTH(t_0_V.v) AS r
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;