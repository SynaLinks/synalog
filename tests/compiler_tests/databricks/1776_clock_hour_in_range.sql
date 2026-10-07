SELECT
  SUM(1) AS n
FROM
  (SELECT to_utc_timestamp(current_timestamp(), current_timezone()) AS timestamp) AS Now
WHERE
  (CAST(ROUND(SUBSTR(CAST(Now.timestamp AS STRING), 12, 2)) AS BIGINT) >= 0) AND
  (CAST(ROUND(SUBSTR(CAST(Now.timestamp AS STRING), 12, 2)) AS BIGINT) <= 23);
