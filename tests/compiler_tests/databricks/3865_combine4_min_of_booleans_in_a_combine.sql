WITH t_1_U AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(u))
SELECT
  t_0_U.u AS u,
  (SELECT
  MIN(false) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (t_0_U.u = 1)) AS l
FROM
  t_1_U AS t_0_U ORDER BY u NULLS LAST;