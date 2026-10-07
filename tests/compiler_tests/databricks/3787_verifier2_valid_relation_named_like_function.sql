WITH t_0_Rank AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(r))
SELECT
  Rank.r AS r
FROM
  t_0_Rank AS Rank
WHERE
  (Rank.r > 1);