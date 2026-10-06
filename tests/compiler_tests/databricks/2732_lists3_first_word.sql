WITH t_1_W AS (SELECT * FROM VALUES
  (1, "red green blue"),
  (2, "red red"),
  (3, "blue"),
  (4, "")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  t_0_W.id AS id,
  ELEMENT_AT(SPLIT(t_0_W.s, REGEXP_REPLACE(" ", '([^a-zA-Z0-9])', '\\\\$1')), 0 + 1) AS w
FROM
  t_1_W AS t_0_W ORDER BY id NULLS LAST, w NULLS LAST;