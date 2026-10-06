WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(JSON_OBJECT('n', 'a', 'v', 1), JSON_OBJECT('n', 'b', 'v', 2)) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY(JSON_OBJECT('n', 'c', 'v', 3)) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  JSON_EXTRACT(JSON_EXTRACT(T.l, '$[' || 0 || ']'), "$.n") AS n
FROM
  t_0_T AS T ORDER BY k;