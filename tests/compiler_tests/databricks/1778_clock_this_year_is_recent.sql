SELECT
  SUM(1) AS n
FROM
  (SELECT CAST(to_date(to_utc_timestamp(current_timestamp(), current_timezone())) AS STRING) AS date) AS Today
WHERE
  (CAST(ROUND(SUBSTR(Today.date, 1, 4)) AS BIGINT) > 2025);
