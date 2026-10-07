WITH t_1_V AS (SELECT * FROM (
  
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
  t_0_V.k AS k,
  CASE WHEN (t_0_V.x > 0) THEN (('+') || (SYNALOG_NUMBER_TEXT(t_0_V.x))) ELSE SYNALOG_NUMBER_TEXT(t_0_V.x) END AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;