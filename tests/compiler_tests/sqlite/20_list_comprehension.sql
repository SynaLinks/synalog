WITH t_1_Squares AS (SELECT
  ArgMin(((x_7.value) * (x_7.value)), x_7.value, null) AS logica_value
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 5) select n from t) where n < 5)) as x_7),
t_3_EvenSquares AS (SELECT
  ArgMin(((x_14.value) * (x_14.value)), x_14.value, null) AS logica_value
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_14
WHERE
  (((x_14.value) % (2)) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_3_EvenSquares AS EvenSquares;