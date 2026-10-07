SELECT
  SUBSTR(CAST(Now.timestamp AS STRING), 11, 1) AS sep,
  SUBSTR(CAST(Now.timestamp AS STRING), 8, 1) AS d,
  SUBSTR(CAST(Now.timestamp AS STRING), 14, 1) AS c
FROM
  (SELECT CURRENT_TIMESTAMP() AS timestamp) AS Now;
