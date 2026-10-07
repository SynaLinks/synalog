WITH t_1_L AS (SELECT * FROM VALUES
  (1, ARRAY(1, 2, 3)),
  (2, ARRAY()),
  (3, ARRAY(7)),
  (4, ARRAY(5, 5, 9, 1)),
  (5, CAST(null AS ARRAY<DOUBLE>))
AS UNUSED_TABLE_NAME(k, l))
SELECT
  t_0_L.k AS k,
  ELEMENT_AT(TRANSFORM(ARRAY(TRANSFORM(COALESCE(t_0_L.l, ARRAY()), synalog_u0 -> synalog_u0)), synalog_a -> ELEMENT_AT(TRANSFORM(ARRAY(TRANSFORM(COALESCE(t_0_L.l, ARRAY()), synalog_u0 -> ABS(((((synalog_u0) * (synalog_u0))) - (20))))), synalog_b -> IF(CARDINALITY(synalog_a) = 0, NULL, ELEMENT_AT(synalog_a, ELEMENT_AT(ARRAY_SORT(SEQUENCE(1, CARDINALITY(synalog_b)), (synalog_i, synalog_j) -> IF(ELEMENT_AT(synalog_b, synalog_i) IS NULL AND ELEMENT_AT(synalog_b, synalog_j) IS NULL, 0, IF(ELEMENT_AT(synalog_b, synalog_i) IS NULL, 1, IF(ELEMENT_AT(synalog_b, synalog_j) IS NULL, -1, IF(ELEMENT_AT(synalog_b, synalog_i) < ELEMENT_AT(synalog_b, synalog_j), -1, IF(ELEMENT_AT(synalog_b, synalog_i) > ELEMENT_AT(synalog_b, synalog_j), 1, 0)))))), 1)))), 1)), 1) AS v
FROM
  t_1_L AS t_0_L ORDER BY k NULLS LAST;