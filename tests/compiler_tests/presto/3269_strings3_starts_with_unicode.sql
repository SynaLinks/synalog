SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  starts_with(CAST('éclair' AS VARCHAR), CAST('éc' AS VARCHAR));