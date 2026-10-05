WITH t_0_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2)
AS UNUSED_TABLE_NAME(g, x))
SELECT
  V.g AS g,
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (V.g = "a") AND
    (V.x = 1)) IS NULL);