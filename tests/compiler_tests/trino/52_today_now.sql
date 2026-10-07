SELECT
  1 AS n
FROM
  (SELECT CAST(CAST(current_timestamp AT TIME ZONE 'UTC' AS DATE) AS VARCHAR) AS date) AS Today, (SELECT CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) AS timestamp) AS Now
WHERE
  (SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1), 1, 10) = Today.date) ORDER BY n;
