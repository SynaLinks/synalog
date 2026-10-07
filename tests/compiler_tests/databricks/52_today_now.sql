SELECT
  1 AS n
FROM
  (SELECT CAST(to_date(to_utc_timestamp(current_timestamp(), current_timezone())) AS STRING) AS date) AS Today, (SELECT to_utc_timestamp(current_timestamp(), current_timezone()) AS timestamp) AS Now
WHERE
  (SUBSTR(CAST(Now.timestamp AS STRING), 1, 10) = Today.date) ORDER BY n NULLS LAST;
