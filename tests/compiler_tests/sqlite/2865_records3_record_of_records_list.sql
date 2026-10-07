SELECT
  JSON_EXTRACT(JSON_EXTRACT(x_1.value, "$.p"), "$.n") AS n,
  JSON_EXTRACT(JSON_EXTRACT(x_1.value, "$.p"), "$.v") AS v
FROM
  JSON_EACH(JSON_ARRAY(JSON_OBJECT('p', JSON_OBJECT('n', 'x', 'v', 1)), JSON_OBJECT('p', JSON_OBJECT('n', 'y', 'v', 2)))) as x_1 ORDER BY n;