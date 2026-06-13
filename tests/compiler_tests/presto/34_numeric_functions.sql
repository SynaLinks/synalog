WITH t_1_Numbers AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
   UNION ALL
  
    SELECT
      16 AS x
   UNION ALL
  
    SELECT
      25 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Computed AS (SELECT
  Numbers.x AS x,
  SQRT(Numbers.x) AS sqrt_x,
  ABS(- ((1) * (Numbers.x))) AS abs_neg,
  ((Numbers.x) * (2)) AS doubled
FROM
  t_1_Numbers AS Numbers ORDER BY x)
SELECT
  Computed.x AS x,
  Computed.sqrt_x AS sqrt_x,
  Computed.abs_neg AS abs_neg,
  Computed.doubled AS doubled
FROM
  t_0_Computed AS Computed ORDER BY x;