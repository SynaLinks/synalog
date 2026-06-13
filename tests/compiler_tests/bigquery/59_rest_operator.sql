WITH t_1_Record AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c
  
) AS UNUSED_TABLE_NAME  ),
t_0_CopyAll AS (SELECT
  Record.*
FROM
  t_1_Record AS Record ORDER BY a)
SELECT
  CopyAll.a AS a,
  CopyAll.b AS b,
  CopyAll.c AS c
FROM
  t_0_CopyAll AS CopyAll ORDER BY a;