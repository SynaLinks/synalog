WITH t_2_W AS (SELECT * FROM VALUES
  (1, "it's"),
  (2, "say \"hi\""),
  (3, "café"),
  (4, "naïve"),
  (5, "a\\b"),
  (6, "50%"),
  (7, "o'neil"),
  (8, "x_y")
AS UNUSED_TABLE_NAME(id, w)),
t_3_Kind AS (SELECT * FROM VALUES
  ("it's", "apostrophe"),
  ("o'neil", "apostrophe")
AS UNUSED_TABLE_NAME(w, kind))
SELECT
  t_0_W.id AS id,
  t_1_Kind.kind AS kind
FROM
  t_2_W AS t_0_W, t_3_Kind AS t_1_Kind
WHERE
  (t_1_Kind.w = t_0_W.w) ORDER BY id NULLS LAST, kind NULLS LAST;
