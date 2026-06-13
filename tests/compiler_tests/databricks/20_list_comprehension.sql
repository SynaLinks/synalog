WITH t_0_Squares AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_7 AS arg, ((x_7) * (x_7)) AS value))), s -> s.value) AS logica_value
FROM
  explode(SEQUENCE(0, 5 - 1)) AS pushkin(x_7)),
t_2_EvenSquares AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_14 AS arg, ((x_14) * (x_14)) AS value))), s -> s.value) AS logica_value
FROM
  explode(SEQUENCE(0, 10 - 1)) AS pushkin(x_14)
WHERE
  ((MOD(x_14, 2)) = 0))
SELECT
  Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_0_Squares AS Squares, t_2_EvenSquares AS EvenSquares;