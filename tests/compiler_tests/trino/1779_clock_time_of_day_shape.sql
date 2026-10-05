SELECT
  LENGTH(SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> format('%s', v)), 1), 12, 8)) AS n,
  SUBSTR(SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> format('%s', v)), 1), 12, 8), 3, 1) AS a,
  SUBSTR(SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> format('%s', v)), 1), 12, 8), 6, 1) AS b
FROM
  (SELECT current_timestamp AS timestamp) AS Now;
