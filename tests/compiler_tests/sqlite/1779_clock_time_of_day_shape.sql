SELECT
  LENGTH(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8)) AS n,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8), 3, 1) AS a,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8), 6, 1) AS b
FROM
  (SELECT datetime('now') AS timestamp) AS Now;
