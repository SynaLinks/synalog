SELECT
  CAST(element_at(transform(filter(ARRAY[42], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1) AS BIGINT) AS v;
