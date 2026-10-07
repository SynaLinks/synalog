WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      E.a AS v
    FROM
      t_0_E AS E
   UNION ALL
  
    SELECT
      E.b AS v
    FROM
      t_0_E AS E
  
) AS UNUSED_TABLE_NAME  ORDER BY v ;