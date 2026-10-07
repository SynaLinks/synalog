WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_3_Rate AS (SELECT * FROM (
  
    SELECT
      'ab' AS s,
      2 AS r
   UNION ALL
  
    SELECT
      'hello' AS s,
      5 AS r
   UNION ALL
  
    SELECT
      'x' AS s,
      10 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  V.s AS s,
  t_1_Rate.r AS r
FROM
  t_2_V AS V, t_3_Rate AS Rate, t_3_Rate AS t_1_Rate
WHERE
  (Rate.r IS NOT null) AND
  (V.s = Rate.s) AND
  (V.s = t_1_Rate.s) ORDER BY k;