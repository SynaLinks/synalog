WITH t_0_V AS (SELECT * FROM VALUES
  (1, "ann", 90, 2.5E0, true),
  (2, "bob", 75, null, false),
  (3, "cid", 90, 3.0E0, true),
  (4, "dee", null, 1.25E0, false),
  (5, "eve", 60, 10.0E0, true),
  (6, "fay", 75, 0.5E0, null),
  (7, "gus", 88, 2.5E0, false),
  (8, "hal", null, null, true),
  (9, "ida", 100, 7.75E0, false),
  (10, "jon", 60, 12.0E0, true)
AS UNUSED_TABLE_NAME(id, name, score, x, ok))
SELECT
  V.id AS id,
  V.name AS name,
  V.score AS score,
  V.x AS x
FROM
  t_0_V AS V ORDER BY score NULLS LAST, id NULLS LAST;