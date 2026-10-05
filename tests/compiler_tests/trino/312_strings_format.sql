SELECT
  'a' || '-' || element_at(transform(filter(ARRAY[3], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS s;
