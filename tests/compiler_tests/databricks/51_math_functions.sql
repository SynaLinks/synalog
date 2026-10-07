WITH t_1_Numbers AS (SELECT * FROM VALUES
  (1),
  (2),
  (3)
AS UNUSED_TABLE_NAME(x)),
t_0_Computed AS (SELECT
  Numbers.x AS x,
  EXP(CAST(Numbers.x AS DOUBLE)) AS e,
  LOG(CAST(Numbers.x AS DOUBLE)) AS l,
  SIN(CAST(Numbers.x AS DOUBLE)) AS s,
  COS(CAST(Numbers.x AS DOUBLE)) AS c,
  POW(Numbers.x, 2) AS p
FROM
  t_1_Numbers AS Numbers ORDER BY x NULLS LAST)
SELECT
  Computed.x AS x,
  Computed.e AS e,
  Computed.l AS l,
  Computed.s AS s,
  Computed.c AS c,
  Computed.p AS p
FROM
  t_0_Computed AS Computed ORDER BY x NULLS LAST;