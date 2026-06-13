WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      5 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Filtered AS (SELECT
  Data.a AS a,
  Data.b AS b
FROM
  t_1_Data AS Data
WHERE
  (Data.a >= Data.b) ORDER BY a)
SELECT
  Filtered.a AS a,
  Filtered.b AS b
FROM
  t_0_Filtered AS Filtered ORDER BY a;