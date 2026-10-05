SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp() AS timestamp) AS Now, (SELECT CAST(current_date() AS STRING) AS date) AS Today
WHERE
  (SUBSTR(CAST(Now.timestamp AS STRING), 1, 10) = Today.date);
