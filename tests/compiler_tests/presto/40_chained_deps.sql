DROP TABLE IF EXISTS logica_test.Filtered;
CREATE TABLE logica_test.Filtered AS WITH t_0_RawData AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      10 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      20 AS col1
   UNION ALL
  
    SELECT
      3 AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      4 AS col0,
      40 AS col1
   UNION ALL
  
    SELECT
      5 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  RawData.col0 AS col0,
  RawData.col1 AS col1
FROM
  t_0_RawData AS RawData
WHERE
  (RawData.col1 > 15);

-- Interacting with table logica_test.Filtered

DROP TABLE IF EXISTS logica_test.Aggregated;
CREATE TABLE logica_test.Aggregated AS SELECT
  SUM(((Filtered.col1) * (2))) AS total,
  SUM(1) AS count
FROM
  logica_test.Filtered AS Filtered;

-- Interacting with table logica_test.Aggregated

SELECT
  Aggregated.total AS total,
  Aggregated.count AS count,
  (CAST(Aggregated.total AS DOUBLE) / NULLIF(Aggregated.count, 0)) AS avg
FROM
  logica_test.Aggregated AS Aggregated ORDER BY total;