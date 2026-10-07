WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_OBJECT('a', null, 'b', 1) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('a', 'y', 'b', 2) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.k AS k,
  JSON_EXTRACT(N.r, "$.a") AS a
FROM
  t_0_N AS N ORDER BY k;