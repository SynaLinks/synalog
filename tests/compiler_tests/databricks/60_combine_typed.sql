WITH t_0_Words AS (SELECT * FROM VALUES
  ("apple"),
  ("banana"),
  ("cherry")
AS UNUSED_TABLE_NAME(word))
SELECT
  (SELECT
  MAX(Words.word) AS logica_value
FROM
  t_0_Words AS Words) AS longest ORDER BY longest NULLS LAST;