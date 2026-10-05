WITH t_1_W AS (SELECT * FROM VALUES
  (1, "it's"),
  (2, "say \"hi\""),
  (3, "café"),
  (4, "naïve"),
  (5, "a\\b"),
  (6, "50%"),
  (7, "o'neil"),
  (8, "x_y")
AS UNUSED_TABLE_NAME(id, w))
SELECT
  t_0_W.id AS id
FROM
  t_1_W AS t_0_W
WHERE
  (CAST(t_0_W.w AS STRING) LIKE "%'%") ORDER BY id NULLS LAST;
