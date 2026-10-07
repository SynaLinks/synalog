WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_C AS (SELECT
  DistinctListAgg(V.x) AS l
FROM
  t_1_V AS V)
SELECT
  JSON_ARRAY_LENGTH(C.l) AS n
FROM
  t_0_C AS C;