SELECT
  (CONCAT('n=', element_at(transform(filter(ARRAY[42], v -> v IS NOT NULL), v -> format('%s', v)), 1))) AS s;