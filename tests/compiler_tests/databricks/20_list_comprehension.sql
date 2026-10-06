WITH t_1_Squares AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_8 AS arg, ((x_8) * (x_8)) AS value))), s -> s.value) AS logica_value
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 5), x -> x < 5)) AS x_8) AS pushkin),
t_4_EvenSquares AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_19 AS arg, ((x_19) * (x_19)) AS value))), s -> s.value) AS logica_value
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_19) AS pushkin
WHERE
  ((MOD(x_19, NULLIF(2, 0))) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_4_EvenSquares AS EvenSquares;