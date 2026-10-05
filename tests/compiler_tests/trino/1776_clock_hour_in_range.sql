SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp AS timestamp) AS Now
WHERE
  (CAST(SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> format('%s', v)), 1), 12, 2) AS BIGINT) >= 0) AND
  (CAST(SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> format('%s', v)), 1), 12, 2) AS BIGINT) <= 23);
