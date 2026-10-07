SELECT
  SUBSTR(CAST(Now.timestamp AS TEXT), 11, 1) AS sep,
  SUBSTR(CAST(Now.timestamp AS TEXT), 8, 1) AS d,
  SUBSTR(CAST(Now.timestamp AS TEXT), 14, 1) AS c
FROM
  (SELECT datetime('now') AS timestamp) AS Now;
