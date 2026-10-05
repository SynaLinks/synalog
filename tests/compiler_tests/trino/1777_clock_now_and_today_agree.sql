SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp AS timestamp) AS Now, (SELECT CAST(current_date AS VARCHAR) AS date) AS Today
WHERE
  (SUBSTR(element_at(transform(filter(ARRAY[Now.timestamp], v -> v IS NOT NULL), v -> format('%s', v)), 1), 1, 10) = Today.date);
