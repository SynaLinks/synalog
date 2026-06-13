WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c,
      'x' AS d
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c,
      'y' AS d
   UNION ALL
  
    SELECT
      7 AS a,
      8 AS b,
      9 AS c,
      'z' AS d
  
) AS UNUSED_TABLE_NAME  ),
t_0_Subset AS (SELECT
  Data.c AS c,
  Data.d AS d
FROM
  t_1_Data AS Data ORDER BY d)
SELECT
  Subset.c AS c,
  Subset.d AS d
FROM
  t_0_Subset AS Subset ORDER BY d;