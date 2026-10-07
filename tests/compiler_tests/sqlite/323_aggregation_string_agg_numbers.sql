SELECT
  GROUP_CONCAT(7) AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;