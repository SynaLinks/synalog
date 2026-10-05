SELECT
  1 AS n
FROM
  (SELECT CAST(current_date AS VARCHAR) AS date) AS Today, (SELECT current_timestamp AS timestamp) AS Now
WHERE
  (SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> format('%s', v)), 1), 1, 10) = Today.date) ORDER BY n;