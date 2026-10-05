SELECT
  SUM(1) AS n
FROM
  (SELECT CAST(current_date() AS STRING) AS date) AS Today
WHERE
  (CAST(ROUND(SUBSTR(Today.date, 1, 4)) AS BIGINT) > 2025);
