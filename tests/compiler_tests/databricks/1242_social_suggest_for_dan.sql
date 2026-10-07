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
  t_0_Follows.b AS c
FROM
  t_1_Follows AS Follows, t_1_Follows AS t_0_Follows
WHERE
  (t_0_Follows.b != "dan") AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Follows AS t_2_Follows
  WHERE
    (t_2_Follows.a = "dan") AND
    (t_2_Follows.b = t_0_Follows.b)) IS NULL) AND
  (Follows.a = "dan") AND
  (t_0_Follows.a = Follows.b)
GROUP BY 1 ORDER BY c NULLS LAST;
