SELECT
  element_at(transform(filter(ARRAY[x_2], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS s
FROM
  UNNEST(ARRAY[9, 10]) as pushkin(x_2) ORDER BY s;
