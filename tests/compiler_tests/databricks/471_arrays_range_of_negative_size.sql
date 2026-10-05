SELECT
  SIZE(FILTER(SEQUENCE(0, 0), x -> x < 0)) AS a,
  SIZE(FILTER(SEQUENCE(0, -2), x -> x < -2)) AS b,
  SIZE(FILTER(SEQUENCE(0, 3), x -> x < 3)) AS c;