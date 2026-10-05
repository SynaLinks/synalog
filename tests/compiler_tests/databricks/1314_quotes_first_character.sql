WITH t_1_W AS (SELECT * FROM VALUES
  (1, "it's"),
  (2, "say \u0022hi\u0022"),
  (3, "café"),
  (4, "naïve"),
  (5, "a\\b"),
  (6, "50%"),
  (7, "o'neil"),
  (8, "x_y")
AS UNUSED_TABLE_NAME(id, w))
SELECT
  t_0_W.id AS id,
  SUBSTR(t_0_W.w, 1, 1) AS c
FROM
  t_1_W AS t_0_W ORDER BY id NULLS LAST, c NULLS LAST;
