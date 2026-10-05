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
  (CONCAT((CONCAT("[", t_0_W.w)), "]")) AS s
FROM
  t_1_W AS t_0_W ORDER BY id NULLS LAST, s NULLS LAST;
