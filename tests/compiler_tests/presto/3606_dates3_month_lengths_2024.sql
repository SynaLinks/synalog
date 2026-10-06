SELECT
  x_3 AS m,
  CASE WHEN (x_3 = 2) THEN CASE WHEN ((((MOD(2024, NULLIF(4, 0))) = 0) AND ((MOD(2024, NULLIF(100, 0))) != 0)) OR ((MOD(2024, NULLIF(400, 0))) = 0)) THEN 29 ELSE 28 END ELSE ELEMENT_AT(ARRAY[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], ((x_3) - (1)) + 1) END AS n
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 13), x -> x < 13), synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 > 0) ORDER BY m;