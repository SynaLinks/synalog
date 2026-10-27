SELECT
  1 AS a
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_5.value)) AS synalog_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_5) IS NULL);