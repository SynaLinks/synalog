SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ('50%' LIKE '50\%' ESCAPE '\');