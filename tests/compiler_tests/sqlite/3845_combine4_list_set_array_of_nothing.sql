SELECT
  (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE JSON_GROUP_ARRAY(MagicalEntangle(1, x_5.value)) END) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_5
WHERE
  (1 > 5)) AS l,
  (SELECT
  DistinctListAgg(MagicalEntangle(1, x_8.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_8
WHERE
  (1 > 5)) AS s,
  (SELECT
  ArgMin(JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', 1, 'value', 1), x_13.value), "$.value"), JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', 1, 'value', 1), x_13.value), "$.arg"), null) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_13
WHERE
  (1 > 5)) AS a;