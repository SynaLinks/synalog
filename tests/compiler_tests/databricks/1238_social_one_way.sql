WITH t_0_Follows AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("ann", "cat"),
  ("cat", "dan"),
  ("dan", "cat"),
  ("bob", "cat"),
  ("eve", "ann"),
  ("eve", "bob"),
  ("eve", "cat"),
  ("dan", "eve"),
  ("fay", "cat")
AS UNUSED_TABLE_NAME(a, b))
SELECT
  Follows.a AS a,
  Follows.b AS b
FROM
  t_0_Follows AS Follows
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_Follows AS t_1_Follows
  WHERE
    (t_1_Follows.a = Follows.b) AND
    (t_1_Follows.b = Follows.a)) IS NULL) ORDER BY a NULLS LAST, b NULLS LAST;
