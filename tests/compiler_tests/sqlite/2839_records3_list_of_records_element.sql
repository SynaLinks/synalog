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
  JSON_EXTRACT((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(T.l, '$[' || 0 || ']') END), "$.n") AS n
FROM
  t_0_T AS T ORDER BY k NULLS LAST;