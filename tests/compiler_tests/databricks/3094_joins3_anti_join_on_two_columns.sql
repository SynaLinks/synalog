WITH t_0_A AS (SELECT * FROM VALUES
  (1, 2, 1),
  (1, 3, 2)
AS UNUSED_TABLE_NAME(x, y, id))
SELECT
  A.id AS id
FROM
  t_0_A AS A
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (A.x = 1) AND
    (A.y = 2)) IS NULL);