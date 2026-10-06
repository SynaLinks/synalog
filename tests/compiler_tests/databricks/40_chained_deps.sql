WITH t_1_RawData AS (SELECT * FROM VALUES
  (1, 10),
  (2, 20),
  (3, 30),
  (4, 40),
  (5, 50)
AS UNUSED_TABLE_NAME(col0, col1)),
t_0_Aggregated AS (SELECT
  SUM(((RawData.col1) * (2))) AS total,
  SUM(1) AS count
FROM
  t_1_RawData AS RawData
WHERE
  (RawData.col1 > 15))
SELECT
  Aggregated.total AS total,
  Aggregated.count AS count,
  ((Aggregated.total) / NULLIF(Aggregated.count, 0)) AS avg
FROM
  t_0_Aggregated AS Aggregated ORDER BY total NULLS LAST;