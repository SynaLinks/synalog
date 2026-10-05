WITH t_1_Numbers AS (SELECT * FROM VALUES
  (4),
  (9),
  (16),
  (25)
AS UNUSED_TABLE_NAME(x)),
t_0_Computed AS (SELECT
  Numbers.x AS x,
  SQRT(Numbers.x) AS sqrt_x,
  ABS(- ((1) * (Numbers.x))) AS abs_neg,
  ((Numbers.x) * (2)) AS doubled
FROM
  t_1_Numbers AS Numbers ORDER BY x NULLS LAST)
SELECT
  Computed.x AS x,
  Computed.sqrt_x AS sqrt_x,
  Computed.abs_neg AS abs_neg,
  Computed.doubled AS doubled
FROM
  t_0_Computed AS Computed ORDER BY x NULLS LAST;