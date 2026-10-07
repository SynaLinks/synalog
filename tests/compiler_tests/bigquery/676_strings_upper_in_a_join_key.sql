SELECT
  "Paris" AS c,
  "FR" AS k
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (UPPER("Paris") = "PARIS");