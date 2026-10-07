SELECT
  "1" AS a,
  "A" AS b,
  "a" AS c
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ("1" < "A") AND
  ("A" < "a");