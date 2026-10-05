WITH t_1_Squares AS (SELECT
  ARRAY_AGG(((x_7) * (x_7)) order by x_7) AS logica_value
FROM
  UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_7)),
t_3_EvenSquares AS (SELECT
  ARRAY_AGG(((x_14) * (x_14)) order by x_14) AS logica_value
FROM
  UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_14)
WHERE
  ((MOD(x_14, 2)) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_3_EvenSquares AS EvenSquares;