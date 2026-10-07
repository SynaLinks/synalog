SELECT
  LENGTH(SUBSTR(CAST(Now.timestamp AS VARCHAR), 12, 8)) AS n,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS VARCHAR), 12, 8), 3, 1) AS a,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS VARCHAR), 12, 8), 6, 1) AS b
FROM
  (SELECT CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) AS timestamp) AS Now;
