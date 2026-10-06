WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(JSON_OBJECT('n', 'a')) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  JSON_ARRAY_LENGTH(T.l) AS s
FROM
  t_0_T AS T ORDER BY k;