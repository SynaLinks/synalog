SELECT
  x_3 AS x,
  element_at(transform(filter(ARRAY[(x_3 > 2)], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS t
FROM
  UNNEST(ARRAY[1, 3]) as pushkin(x_3) ORDER BY x;
