WITH t_1_Score AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 5),
  ("c", 3)
AS UNUSED_TABLE_NAME(name, s))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(Score.s AS value, Score.name AS arg)), false)[0].arg AS name
FROM
  t_1_Score AS Score;