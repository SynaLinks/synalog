WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS s,
      1 AS n
   UNION ALL
  
    SELECT
      'b' AS s,
      2 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CONCAT((CONCAT(V.s, '-')), element_at(transform(filter(ARRAY[V.n], v -> v IS NOT NULL), v -> format('%s', v)), 1))) AS t
FROM
  t_0_V AS V ORDER BY t;