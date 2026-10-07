SELECT
  SUM(1) AS n
FROM
  (SELECT to_utc_timestamp(current_timestamp(), current_timezone()) AS timestamp) AS Now, (SELECT CAST(to_date(to_utc_timestamp(current_timestamp(), current_timezone())) AS STRING) AS date) AS Today
WHERE
  (SUBSTR(CAST(Now.timestamp AS STRING), 1, 10) = Today.date);
