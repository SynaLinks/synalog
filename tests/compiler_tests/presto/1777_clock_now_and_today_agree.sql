SELECT
  SUM(1) AS n
FROM
  (SELECT CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) AS timestamp) AS Now, (SELECT CAST(CAST(current_timestamp AT TIME ZONE 'UTC' AS DATE) AS VARCHAR) AS date) AS Today
WHERE
  (SUBSTR(CAST(Now.timestamp AS VARCHAR), 1, 10) = Today.date);
