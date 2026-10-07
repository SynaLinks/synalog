SELECT
  SUBSTR(CAST(Now.timestamp AS VARCHAR), 11, 1) AS sep,
  SUBSTR(CAST(Now.timestamp AS VARCHAR), 8, 1) AS d,
  SUBSTR(CAST(Now.timestamp AS VARCHAR), 14, 1) AS c
FROM
  (SELECT CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) AS timestamp) AS Now;
