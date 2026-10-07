WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'ba' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  REGEXP_LIKE(V.s, 'b$');