WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_OBJECT('xs', JSON_ARRAY()) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('xs', JSON_ARRAY('z')) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  JSON_ARRAY_LENGTH(JSON_EXTRACT(t_0_R.r, "$.xs")) AS n
FROM
  t_1_R AS t_0_R ORDER BY k NULLS LAST;