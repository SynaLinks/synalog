WITH t_3_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ARRAY[3, 1, 2] AS l
   UNION ALL
  
    SELECT
      2 AS id,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS id,
      ARRAY[5] AS l
   UNION ALL
  
    SELECT
      4 AS id,
      ARRAY[7, 7, 8, 9] AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT
  ARRAY_AGG(DISTINCT x_2) AS xs
FROM
  t_3_L AS t_2_L, UNNEST(TRANSFORM(t_2_L.l, synalog_e -> ROW(synalog_e))) as pushkin(x_2))
SELECT
  CARDINALITY(t_0_All.xs) AS n
FROM
  t_1_All AS t_0_All;