SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp() AS timestamp) AS Now
WHERE
  (CAST(ROUND(SUBSTR(CAST(Now.timestamp AS STRING), 12, 2)) AS BIGINT) >= 0) AND
  (CAST(ROUND(SUBSTR(CAST(Now.timestamp AS STRING), 12, 2)) AS BIGINT) <= 23);
