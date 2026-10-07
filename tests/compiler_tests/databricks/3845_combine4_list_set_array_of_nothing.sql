SELECT
  (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(1 AS v)), s -> s.v) END) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS l,
  (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE ARRAY_DISTINCT(TRANSFORM(COLLECT_LIST(STRUCT(1 AS v)), s -> s.v)) END) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS s,
  (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(1 AS arg, 1 AS value))), s -> s.value) END) AS logica_value
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (1 > 5)) AS a;