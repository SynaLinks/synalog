WITH t_1_Data AS (SELECT * FROM VALUES
  (1, 10),
  (2, null),
  (3, 30)
AS UNUSED_TABLE_NAME(id, value)),
t_0_Flags AS (SELECT
  Data.id AS id,
  (Data.value IS NULL) AS missing
FROM
  t_1_Data AS Data ORDER BY id NULLS LAST)
SELECT
  Flags.id AS id,
  Flags.missing AS missing
FROM
  t_0_Flags AS Flags ORDER BY id NULLS LAST;