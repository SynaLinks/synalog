WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'Hello' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      ' a ' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      'aaa' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      'hello world' AS s
   UNION ALL
  
    SELECT
      7 AS k,
      'naïve' AS s
   UNION ALL
  
    SELECT
      8 AS k,
      'lol' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  (CASE WHEN LENGTH(W.s) >= 0 THEN SUBSTR(W.s, 1, 0) ELSE W.s || SUBSTR(REPLACE(HEX(ZEROBLOB(0)), '00', 'ab'), 1, 0 - LENGTH(W.s)) END) AS v
FROM
  t_0_W AS W ORDER BY k NULLS LAST;