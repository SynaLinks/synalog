WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s)),
t_1_L AS (SELECT * FROM VALUES
  (1, "pos"),
  (-1, "neg"),
  (0, "zero")
AS UNUSED_TABLE_NAME(g, name))
SELECT
  V.k AS k,
  L.name AS name
FROM
  t_0_V AS V, t_1_L AS L
WHERE
  (V.x IS NOT null) AND
  (L.g = CASE WHEN (V.x > 0) THEN 1 WHEN (V.x < 0) THEN -1 ELSE 0 END) ORDER BY k NULLS LAST;