WITH t_0_Want AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Want.a AS a,
  Want.b AS b
FROM
  t_0_Want AS Want
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (Want.a = 1) AND
    (Want.b = 3)) IS NULL);