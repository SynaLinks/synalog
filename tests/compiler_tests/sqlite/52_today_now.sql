SELECT
  1 AS n
FROM
  (SELECT date('now') AS date) AS Today, (SELECT datetime('now') AS timestamp) AS Now
WHERE
  (SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10) = Today.date) ORDER BY n;