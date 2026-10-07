WITH t_2_Follows AS (SELECT * FROM VALUES
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
  Follows.b AS b,
  t_0_Follows.b AS c
FROM
  t_2_Follows AS Follows, t_2_Follows AS t_0_Follows, t_2_Follows AS t_1_Follows
WHERE
  (Follows.a < Follows.b) AND
  (Follows.a < t_0_Follows.b) AND
  (t_0_Follows.a = Follows.b) AND
  (t_1_Follows.a = t_0_Follows.b) AND
  (t_1_Follows.b = Follows.a)
GROUP BY 1, 2, 3;
