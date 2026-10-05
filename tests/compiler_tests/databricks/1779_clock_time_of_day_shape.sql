SELECT
  LENGTH(SUBSTR(CAST(Now.timestamp AS STRING), 12, 8)) AS n,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS STRING), 12, 8), 3, 1) AS a,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS STRING), 12, 8), 6, 1) AS b
FROM
  (SELECT to_utc_timestamp(current_timestamp(), current_timezone()) AS timestamp) AS Now;
