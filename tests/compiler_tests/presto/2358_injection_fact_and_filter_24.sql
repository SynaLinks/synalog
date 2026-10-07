WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '''+(SELECT 1)+''' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'plain' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (V.s = '''+(SELECT 1)+''');