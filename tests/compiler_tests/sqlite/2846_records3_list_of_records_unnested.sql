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
  JSON_EXTRACT(x_3.value, "$.n") AS n,
  JSON_EXTRACT(x_3.value, "$.v") AS v
FROM
  t_0_T AS T, JSON_EACH(T.l) as x_3 ORDER BY k, n;