WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      0.1 AS x
   UNION ALL
  
    SELECT
      0.2 AS x
   UNION ALL
  
    SELECT
      0.3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_T AS (SELECT
  SUM(V.x) AS t
FROM
  t_2_V AS V)
SELECT
  SYNALOG_NUMBER_TEXT(t_0_T.t) AS s
FROM
  t_1_T AS t_0_T;