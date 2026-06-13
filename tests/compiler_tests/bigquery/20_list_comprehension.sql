WITH t_0_Squares AS (SELECT
  ARRAY_AGG(((x_9) * (x_9)) order by [x_9][offset(0)]) AS logica_value
FROM
  UNNEST(GENERATE_ARRAY(0, 5 - 1)) as x_9),
t_2_EvenSquares AS (SELECT
  ARRAY_AGG(((x_21) * (x_21)) order by [x_21][offset(0)]) AS logica_value
FROM
  UNNEST(GENERATE_ARRAY(0, 10 - 1)) as x_21
WHERE
  ((MOD(x_21, 2)) = 0))
SELECT
  Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_0_Squares AS Squares, t_2_EvenSquares AS EvenSquares;