WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y,
      1 AS id
   UNION ALL
  
    SELECT
      1 AS x,
      3 AS y,
      2 AS id
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.id AS id
FROM
  t_0_A AS A
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (A.x = 1) AND
    (A.y = 2)) IS NULL);