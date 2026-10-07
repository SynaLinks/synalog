WITH t_0_B AS (SELECT * FROM VALUES
  ("b"),
  ("c")
AS UNUSED_TABLE_NAME(t))
SELECT * FROM (
  
    SELECT
      "a" AS s
   UNION ALL
  
    SELECT
      B.t AS s
    FROM
      t_0_B AS B
  
) AS UNUSED_TABLE_NAME  ORDER BY s NULLS LAST ;