WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY('a', 'b') AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(S.l, '$[' || 0 || ']') END) AS e
FROM
  t_0_S AS S ORDER BY k NULLS LAST;