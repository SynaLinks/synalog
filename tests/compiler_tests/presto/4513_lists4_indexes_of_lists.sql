WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      ARRAY[5, 5, 9, 1] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  x_4 AS i
FROM
  t_1_L AS t_0_L, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, CARDINALITY(t_0_L.l)), x -> x < CARDINALITY(t_0_L.l)), synalog_e -> ROW(synalog_e))) as pushkin(x_4) ORDER BY k, i;