WITH t_1_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS name,
      5 AS qty
   UNION ALL
  
    SELECT
      'pear' AS name,
      2 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_0_Labels AS (SELECT
  Items.name AS name,
  Items.name || ' x' || element_at(transform(ARRAY[Items.qty], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) < 1 THEN rtrim(rtrim(CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,35)), 15) AS DECIMAL(38,35)) AS VARCHAR), '0'), '.') WHEN ABS(synalog_v) < 1e18 THEN rtrim(rtrim(CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)), CAST(15 - LENGTH(CAST(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20)))) AS BIGINT) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,20)) AS VARCHAR), '0'), '.') ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0)), CAST(15 - LENGTH(CAST(ABS(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,0))) AS VARCHAR)) AS INTEGER)) AS DECIMAL(38,0)) AS VARCHAR) END)), 1) AS label
FROM
  t_1_Items AS Items ORDER BY name)
SELECT
  Labels.name AS name,
  Labels.label AS label
FROM
  t_0_Labels AS Labels ORDER BY name;