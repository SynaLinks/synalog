WITH t_0_Want AS (SELECT * FROM VALUES
  (1, 2),
  (1, 3)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  Want.a AS a,
  Want.b AS b
FROM
  t_0_Want AS Want
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (Want.a = 1) AND
    (Want.b = 3)) IS NULL);