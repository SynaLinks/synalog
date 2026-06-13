SELECT
  1 AS n
FROM
  (SELECT CAST(current_date() AS STRING) AS date) AS Today, (SELECT current_timestamp() AS timestamp) AS Now
WHERE
  (SUBSTR(CAST(Now.timestamp AS STRING), 1, 10) = Today.date) ORDER BY n;