SELECT
  element_at(transform(filter(ARRAY[null], v -> v IS NOT NULL), v -> format('%s', v)), 1) AS s;