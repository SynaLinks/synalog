WITH t_1_Squares AS (SELECT
  ARRAY_AGG(((x_8) * (x_8)) order by x_8) AS synalog_value
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 5), x -> x < 5), synalog_e -> ROW(synalog_e))) as pushkin(x_8)),
t_4_EvenSquares AS (SELECT
  ARRAY_AGG(((x_19) * (x_19)) order by x_19) AS synalog_value
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 10), x -> x < 10), synalog_e -> ROW(synalog_e))) as pushkin(x_19)
WHERE
  ((MOD(x_19, NULLIF(2, 0))) = 0))
SELECT
  t_0_Squares.synalog_value AS squares,
  EvenSquares.synalog_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_4_EvenSquares AS EvenSquares;