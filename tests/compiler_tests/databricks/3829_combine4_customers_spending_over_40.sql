WITH t_1_C AS (SELECT * FROM VALUES
  ("ann"),
  ("bob"),
  ("cid"),
  ("dee")
AS UNUSED_TABLE_NAME(c)),
t_2_O AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "ann", 12),
  (3, "bob", 50),
  (4, "cid", 7),
  (5, "cid", 7),
  (6, "cid", 40),
  (7, "bob", 5)
AS UNUSED_TABLE_NAME(id, c, amt))
SELECT
  t_0_C.c AS c
FROM
  t_1_C AS t_0_C
WHERE
  ((SELECT
    SUM(O.amt) AS logica_value
  FROM
    t_2_O AS O
  WHERE
    (O.c = t_0_C.c)) > 40) ORDER BY c NULLS LAST;