WITH t_1_L AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.id AS id,
  CARDINALITY(t_0_L.l || ARRAY[0]) AS n
FROM
  t_1_L AS t_0_L ORDER BY id, n;
