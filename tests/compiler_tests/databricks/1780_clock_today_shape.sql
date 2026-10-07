SELECT
  LENGTH(Today.date) AS n,
  SUBSTR(Today.date, 5, 1) AS a,
  SUBSTR(Today.date, 8, 1) AS b
FROM
  (SELECT CAST(to_date(to_utc_timestamp(current_timestamp(), current_timezone())) AS STRING) AS date) AS Today;
