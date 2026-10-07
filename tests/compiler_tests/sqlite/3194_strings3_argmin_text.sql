WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'b' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'B' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'c' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMin(V.id, V.w, 1), '$[' || 0 || ']') END) AS id
FROM
  t_1_V AS V;