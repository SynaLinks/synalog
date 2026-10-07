WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -3 AS x,
      null AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      'c' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'd' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'f' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_V AS t_1_V
  WHERE
    (CASE WHEN (t_1_V.x > 0) THEN true ELSE false END = true) AND
    (V.k = t_1_V.k)) IS NULL) ORDER BY k;