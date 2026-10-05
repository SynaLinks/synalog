SELECT
  x_8 AS col0,
  element_at(transform(filter(ARRAY[x_8], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS col1
FROM
  UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_8) ORDER BY col0;
