WITH t_1_Follows AS (SELECT * FROM VALUES
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
  t_1_Follows AS Follows, t_1_Follows AS t_0_Follows
WHERE
  (t_0_Follows.a = Follows.b) AND
  (t_0_Follows.b = Follows.a) ORDER BY a NULLS LAST, b NULLS LAST;
