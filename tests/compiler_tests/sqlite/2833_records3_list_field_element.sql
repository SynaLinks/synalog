WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_OBJECT('name', 'a', 'xs', JSON_ARRAY(1, 2, 3)) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('name', 'b', 'xs', JSON_ARRAY(4)) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_OBJECT('name', 'c', 'xs', JSON_ARRAY()) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  (CASE WHEN 1 < 0 THEN NULL ELSE JSON_EXTRACT(JSON_EXTRACT(S.r, "$.xs"), '$[' || 1 || ']') END) AS e
FROM
  t_0_S AS S ORDER BY k NULLS LAST;