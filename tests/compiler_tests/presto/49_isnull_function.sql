WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      10 AS value
   UNION ALL
  
    SELECT
      2 AS id,
      null AS value
   UNION ALL
  
    SELECT
      3 AS id,
      30 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_Flags AS (SELECT
  Data.id AS id,
  (Data.value IS NULL) AS missing
FROM
  t_1_Data AS Data ORDER BY id)
SELECT
  Flags.id AS id,
  Flags.missing AS missing
FROM
  t_0_Flags AS Flags ORDER BY id;