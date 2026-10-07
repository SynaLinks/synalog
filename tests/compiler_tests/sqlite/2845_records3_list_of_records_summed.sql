WITH t_1_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(JSON_OBJECT('n', 'a', 'v', 1), JSON_OBJECT('n', 'b', 'v', 2)) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY(JSON_OBJECT('n', 'c', 'v', 3)) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_T.k AS k,
  SUM(JSON_EXTRACT(x_3.value, "$.v")) AS t
FROM
  t_1_T AS t_0_T, JSON_EACH(t_0_T.l) as x_3
GROUP BY t_0_T.k ORDER BY k NULLS LAST;