SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (SUBSTR("éclair", 1, LENGTH("éc")) = "éc");