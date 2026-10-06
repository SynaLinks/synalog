WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_OBJECT('a', 'x', 'b', 1) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('a', null, 'b', 2) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_OBJECT('a', 'z', 'b', null) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(JSON_EXTRACT(N.r, "$.b")) AS t
FROM
  t_0_N AS N;