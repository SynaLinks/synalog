WITH t_1_P AS (SELECT * FROM VALUES
  ("a", 100),
  ("b", 20)
AS UNUSED_TABLE_NAME(name, score))
SELECT
  P.name AS name,
  P.score AS score
FROM
  t_1_P AS P ORDER BY score NULLS LAST;
