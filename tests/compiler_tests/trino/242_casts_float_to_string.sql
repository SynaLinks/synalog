SELECT
  element_at(transform(filter(ARRAY[1.5E0], v -> v IS NOT NULL), v -> format('%s', v)), 1) AS s;