SELECT
  SUM(1) AS n
FROM
  (SELECT datetime('now') AS timestamp) AS Now, (SELECT date('now') AS date) AS Today
WHERE
  (SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10) = Today.date);
