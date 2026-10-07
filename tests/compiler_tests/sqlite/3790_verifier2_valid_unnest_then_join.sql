WITH t_1_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_2.value AS n,
  t_0_N.s AS s
FROM
  t_1_N AS t_0_N, JSON_EACH(JSON_ARRAY(2, 3)) as x_2
WHERE
  (t_0_N.n = x_2.value) ORDER BY n NULLS LAST;