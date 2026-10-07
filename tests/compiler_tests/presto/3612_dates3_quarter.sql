WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      2 AS id,
      '2024-02-28' AS d
   UNION ALL
  
    SELECT
      3 AS id,
      '2024-02-29' AS d
   UNION ALL
  
    SELECT
      4 AS id,
      '2023-03-01' AS d
   UNION ALL
  
    SELECT
      5 AS id,
      '2000-12-31' AS d
   UNION ALL
  
    SELECT
      6 AS id,
      '1999-07-15' AS d
   UNION ALL
  
    SELECT
      7 AS id,
      '2026-10-06' AS d
   UNION ALL
  
    SELECT
      8 AS id,
      '1970-01-01' AS d
   UNION ALL
  
    SELECT
      9 AS id,
      '2100-02-28' AS d
   UNION ALL
  
    SELECT
      10 AS id,
      '2004-08-09' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id,
  ((CAST((CASE WHEN ((((CAST(SUBSTR(V.d, 6, 2) AS BIGINT)) - (1))) < 0) <> ((3) < 0) THEN CEIL(CAST(((CAST(SUBSTR(V.d, 6, 2) AS BIGINT)) - (1)) AS DOUBLE) / NULLIF(3, 0)) ELSE FLOOR(CAST(((CAST(SUBSTR(V.d, 6, 2) AS BIGINT)) - (1)) AS DOUBLE) / NULLIF(3, 0)) END) AS BIGINT)) + (1)) AS q
FROM
  t_0_V AS V ORDER BY id;