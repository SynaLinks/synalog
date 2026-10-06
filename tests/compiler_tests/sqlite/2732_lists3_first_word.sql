WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red green blue' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'red red' AS s
   UNION ALL
  
    SELECT
      3 AS id,
      'blue' AS s
   UNION ALL
  
    SELECT
      4 AS id,
      '' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.id AS id,
  JSON_EXTRACT(SPLIT(t_0_W.s, ' '), '$[' || 0 || ']') AS w
FROM
  t_1_W AS t_0_W ORDER BY id NULLS LAST, w NULLS LAST;