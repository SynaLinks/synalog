WITH t_0_W AS (SELECT * FROM VALUES
  (1, "red green blue"),
  (2, "red red"),
  (3, "blue"),
  (4, "")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  W.id AS id,
  ARRAY_SIZE(SPLIT(W.s, REGEXP_REPLACE(" ", '([^a-zA-Z0-9])', '\\\\$1'))) AS n
FROM
  t_0_W AS W ORDER BY id NULLS LAST, n NULLS LAST;