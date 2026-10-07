WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_OBJECT('a', 'x', 'l', JSON_ARRAY(1)) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('a', null, 'l', JSON_ARRAY()) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  JSON_EXTRACT(t_0_R.r, "$.a") AS a,
  JSON_ARRAY_LENGTH(JSON_EXTRACT(t_0_R.r, "$.l")) AS n
FROM
  t_1_R AS t_0_R ORDER BY k NULLS LAST;