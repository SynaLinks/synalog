WITH t_0_R AS (SELECT * FROM VALUES
  (1),
  (null)
AS UNUSED_TABLE_NAME(x))
SELECT
  R.x AS x
FROM
  t_0_R AS R
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (R.x IS NULL)) IS NULL);