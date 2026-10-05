SELECT
  element_at(transform(filter(ARRAY[true], v -> v IS NOT NULL), v -> format('%s', v)), 1) AS a,
  element_at(transform(filter(ARRAY[false], v -> v IS NOT NULL), v -> format('%s', v)), 1) AS b;