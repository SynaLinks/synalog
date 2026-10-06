WITH t_1_V AS (SELECT * FROM (
  
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
  ((((((CAST(SUBSTR(V.d, 1, 4) AS INTEGER)) - (4) * CAST((CAST(SUBSTR(V.d, 1, 4) AS INTEGER)) / NULLIF(4, 0) AS INTEGER))) = 0) AND ((((CAST(SUBSTR(V.d, 1, 4) AS INTEGER)) - (100) * CAST((CAST(SUBSTR(V.d, 1, 4) AS INTEGER)) / NULLIF(100, 0) AS INTEGER))) != 0)) OR ((((CAST(SUBSTR(V.d, 1, 4) AS INTEGER)) - (400) * CAST((CAST(SUBSTR(V.d, 1, 4) AS INTEGER)) / NULLIF(400, 0) AS INTEGER))) = 0)) AS leap
FROM
  t_1_V AS V ORDER BY id NULLS LAST;