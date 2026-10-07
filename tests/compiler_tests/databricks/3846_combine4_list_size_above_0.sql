WITH t_1_O AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "ann", 12),
  (3, "bob", 50),
  (4, "cid", 7),
  (5, "cid", 7),
  (6, "cid", 40),
  (7, "bob", 5)
AS UNUSED_TABLE_NAME(id, c, amt)),
t_2_C AS (SELECT * FROM VALUES
  ("ann"),
  ("bob"),
  ("cid"),
  ("dee")
AS UNUSED_TABLE_NAME(c))
SELECT
  t_0_C.c AS c,
  ARRAY_SIZE((SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(O.amt AS v)), s -> s.v) END) AS logica_value
FROM
  t_1_O AS O
WHERE
  (O.amt > 0) AND
  (O.c = t_0_C.c))) AS n
FROM
  t_2_C AS t_0_C ORDER BY c NULLS LAST;