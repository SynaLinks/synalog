SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ('a_b' LIKE 'a\_b' ESCAPE '\');