WITH t_0_P AS (SELECT * FROM VALUES
  (1, 1),
  (1, 2)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  P.a AS a,
  P.b AS b
FROM
  t_0_P AS P
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (P.a = 1) AND
    (P.b = 1)) IS NULL);