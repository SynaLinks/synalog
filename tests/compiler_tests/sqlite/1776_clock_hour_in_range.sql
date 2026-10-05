SELECT
  SUM(1) AS n
FROM
  (SELECT datetime('now') AS timestamp) AS Now
WHERE
  (CAST(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 2) AS INTEGER) >= 0) AND
  (CAST(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 2) AS INTEGER) <= 23);
