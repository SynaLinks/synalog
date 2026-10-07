WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a,b,c' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      'abc' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      ',,' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      'x,' AS s
   UNION ALL
  
    SELECT
      6 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  (CASE WHEN SPLIT(T.s, ',') IS NULL OR '' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(value, '') FROM (SELECT value FROM JSON_EACH(SPLIT(T.s, ',')) WHERE value IS NOT NULL ORDER BY key)), '') END) AS v
FROM
  t_0_T AS T ORDER BY k NULLS LAST;