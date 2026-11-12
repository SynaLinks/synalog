DROP TABLE IF EXISTS synalog_home.synalog_home.Filtered;
CREATE TABLE synalog_home.synalog_home.Filtered AS WITH t_0_RawData AS (SELECT * FROM (
  
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

-- Interacting with table synalog_home.synalog_home.Filtered

DROP TABLE IF EXISTS synalog_home.synalog_home.Aggregated;
CREATE TABLE synalog_home.synalog_home.Aggregated AS SELECT
  SUM(((Filtered.col1) * (2))) AS total,
  SUM(1) AS count
FROM
  synalog_home.synalog_home.Filtered AS Filtered;

-- Interacting with table synalog_home.synalog_home.Aggregated

SELECT
  Aggregated.total AS total,
  Aggregated.count AS count,
  (CAST(Aggregated.total AS DOUBLE) / NULLIF(Aggregated.count, 0)) AS avg
FROM
  synalog_home.synalog_home.Aggregated AS Aggregated ORDER BY total;