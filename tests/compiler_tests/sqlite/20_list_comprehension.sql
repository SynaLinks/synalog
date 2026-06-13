WITH t_0_Squares AS (SELECT
  ArgMin(((x_9.value) * (x_9.value)), x_9.value, null) AS logica_value
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 5) select n from t) where n < 5)) as x_9),
t_2_EvenSquares AS (SELECT
  ArgMin(((x_28.value) * (x_28.value)), x_28.value, null) AS logica_value
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_28
WHERE
  (((x_28.value) % (2)) = 0))
SELECT
  Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_0_Squares AS Squares, t_2_EvenSquares AS EvenSquares;