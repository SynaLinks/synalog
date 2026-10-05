SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp AS timestamp) AS Now
WHERE
  (CAST(SUBSTR(CAST(Now.timestamp AS VARCHAR), 12, 2) AS BIGINT) >= 0) AND
  (CAST(SUBSTR(CAST(Now.timestamp AS VARCHAR), 12, 2) AS BIGINT) <= 23);
