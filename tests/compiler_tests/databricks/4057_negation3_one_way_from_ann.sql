WITH t_0_F AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("bob", "cid"),
  ("cid", "dee"),
  ("dee", "cid"),
  ("eve", "ann"),
  ("fay", "fay"),
  ("ann", "cid")
AS UNUSED_TABLE_NAME(a, b))
SELECT
  F.b AS v
FROM
  t_0_F AS F
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_F AS t_1_F
  WHERE
    (t_1_F.a = F.b) AND
    (t_1_F.b = "ann")) IS NULL) AND
  (F.a = "ann") ORDER BY v NULLS LAST;