SELECT
  LENGTH(Today.date) AS n,
  SUBSTR(Today.date, 5, 1) AS a,
  SUBSTR(Today.date, 8, 1) AS b
FROM
  (SELECT CAST(CAST(current_timestamp AT TIME ZONE 'UTC' AS DATE) AS VARCHAR) AS date) AS Today;
