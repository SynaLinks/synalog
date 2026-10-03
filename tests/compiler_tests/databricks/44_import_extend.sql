WITH t_2_Values AS (SELECT * FROM (
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Values.a AS a,
  t_0_Values.b AS b,
  ((((t_0_Values.a) * (t_0_Values.a))) + (((t_0_Values.b) * (t_0_Values.b)))) AS result
FROM
  t_2_Values AS t_0_Values ORDER BY a;