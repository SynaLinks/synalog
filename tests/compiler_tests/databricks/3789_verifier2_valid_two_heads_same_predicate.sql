WITH t_0_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b))
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
  
) AS UNUSED_TABLE_NAME  ORDER BY v NULLS LAST ;