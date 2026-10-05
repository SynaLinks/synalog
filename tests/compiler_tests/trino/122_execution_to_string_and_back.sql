SELECT
  element_at(transform(filter(ARRAY[12], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS s,
  ((CAST('12' AS BIGINT)) + (1)) AS n;
