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
AS UNUSED_TABLE_NAME(a, b)),
t_1_In AS (SELECT
  Follows.b AS u,
  SUM(1) AS n
FROM
  t_2_Follows AS Follows
GROUP BY 1)
SELECT
  t_0_In.u AS u
FROM
  t_1_In AS t_0_In
WHERE
  (t_0_In.n >= 4);
