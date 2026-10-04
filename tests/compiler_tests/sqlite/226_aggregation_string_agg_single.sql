SELECT
  GROUP_CONCAT('only') AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;