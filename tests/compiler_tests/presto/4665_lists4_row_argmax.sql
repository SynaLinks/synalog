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
   UNION ALL
  
    SELECT
      5 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  ELEMENT_AT(TRANSFORM(ARRAY[TRANSFORM(COALESCE(FILTER(SEQUENCE(0, CARDINALITY(t_0_L.l)), x -> x < CARDINALITY(t_0_L.l)), ARRAY[]), synalog_u0 -> synalog_u0)], synalog_a -> ELEMENT_AT(TRANSFORM(ARRAY[TRANSFORM(COALESCE(FILTER(SEQUENCE(0, CARDINALITY(t_0_L.l)), x -> x < CARDINALITY(t_0_L.l)), ARRAY[]), synalog_u0 -> (CASE WHEN synalog_u0 < 0 THEN NULL ELSE ELEMENT_AT(t_0_L.l, synalog_u0 + 1) END))], synalog_b -> IF(CARDINALITY(synalog_a) = 0, NULL, ELEMENT_AT(synalog_a, ELEMENT_AT(ARRAY_SORT(SEQUENCE(1, CARDINALITY(synalog_b)), (synalog_i, synalog_j) -> IF(ELEMENT_AT(synalog_b, synalog_i) IS NULL AND ELEMENT_AT(synalog_b, synalog_j) IS NULL, 0, IF(ELEMENT_AT(synalog_b, synalog_i) IS NULL, 1, IF(ELEMENT_AT(synalog_b, synalog_j) IS NULL, -1, IF(ELEMENT_AT(synalog_b, synalog_i) > ELEMENT_AT(synalog_b, synalog_j), -1, IF(ELEMENT_AT(synalog_b, synalog_i) < ELEMENT_AT(synalog_b, synalog_j), 1, 0)))))), 1)))), 1)), 1) AS v
FROM
  t_1_L AS t_0_L ORDER BY k;