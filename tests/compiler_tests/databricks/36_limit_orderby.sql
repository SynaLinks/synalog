WITH t_0_Scores AS (SELECT * FROM VALUES
  ("Alice", 95),
  ("Bob", 87),
  ("Charlie", 92),
  ("Diana", 88),
  ("Eve", 91),
  ("Frank", 85),
  ("Grace", 93),
  ("Henry", 89)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT
  Scores.col0 AS name,
  Scores.col1 AS score
FROM
  t_0_Scores AS Scores ORDER BY score desc LIMIT 3;