WITH t_1_Squares AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_7 AS arg, ((x_7) * (x_7)) AS value))), s -> s.value) AS logica_value
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 5), x -> x < 5)) AS x_7) AS pushkin),
t_3_EvenSquares AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_14 AS arg, ((x_14) * (x_14)) AS value))), s -> s.value) AS logica_value
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_14) AS pushkin
WHERE
  ((MOD(x_14, 2)) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_3_EvenSquares AS EvenSquares;