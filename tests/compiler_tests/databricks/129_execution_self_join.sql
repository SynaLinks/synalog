WITH t_1_Parent AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(x, y))
SELECT
  Parent.x AS x,
  t_0_Parent.y AS z
FROM
  t_1_Parent AS Parent, t_1_Parent AS t_0_Parent
WHERE
  (t_0_Parent.x = Parent.y);