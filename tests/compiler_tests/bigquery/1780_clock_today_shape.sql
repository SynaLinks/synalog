SELECT
  LENGTH(Today.date) AS n,
  SUBSTR(Today.date, 5, 1) AS a,
  SUBSTR(Today.date, 8, 1) AS b
FROM
  (SELECT CAST(CURRENT_DATE() AS STRING) AS date) AS Today;
