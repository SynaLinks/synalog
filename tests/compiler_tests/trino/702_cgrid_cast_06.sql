SELECT
  LENGTH(element_at(transform(filter(ARRAY[1000], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1)) AS v;
