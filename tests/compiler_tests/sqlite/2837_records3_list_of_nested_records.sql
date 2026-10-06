SELECT
  JSON_EXTRACT(JSON_EXTRACT(x_1.value, "$.a"), "$.n") AS n,
  JSON_EXTRACT(JSON_EXTRACT(x_1.value, "$.a"), "$.v") AS v
FROM
  JSON_EACH(JSON_ARRAY(JSON_OBJECT('a', JSON_OBJECT('n', 'p', 'v', 1)), JSON_OBJECT('a', JSON_OBJECT('n', 'q', 'v', 2)))) as x_1 ORDER BY n;