WITH t_1_Values AS (SELECT * FROM (
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Values.a AS a,
  Values.b AS b,
  ((((Values.a) * (Values.a))) + (((Values.b) * (Values.b)))) AS result
FROM
  t_1_Values AS Values ORDER BY a;