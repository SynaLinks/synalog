WITH t_1_S AS (SELECT * FROM (
  
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
  t_0_S.k AS k,
  (CASE WHEN t_0_S.l IS NULL OR '+' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(value, '+') FROM (SELECT value FROM JSON_EACH(t_0_S.l) WHERE value IS NOT NULL ORDER BY key)), '') END) AS s
FROM
  t_1_S AS t_0_S ORDER BY k NULLS LAST;