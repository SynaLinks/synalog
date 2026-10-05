WITH t_2_NotA AS (SELECT
  x_13 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_13) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_13 = 1)) IS NULL)),
t_0_NotNotA AS (SELECT
  x_8 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_8) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_NotA AS NotA
  WHERE
    (NotA.x = x_8)) IS NULL))
SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_NotNotA AS NotNotA
  WHERE
    (NotNotA.x = x_3)) IS NULL);