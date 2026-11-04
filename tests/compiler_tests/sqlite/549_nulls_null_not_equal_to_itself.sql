SELECT
  SUM(1) AS n
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_1.value)) AS synalog_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_1
  WHERE
    (null = null)) IS NULL);