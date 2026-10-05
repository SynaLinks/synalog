WITH t_0_Line AS (SELECT * FROM VALUES
  (2, 5),
  (3, 6)
AS UNUSED_TABLE_NAME(qty, price))
SELECT
  SUM(((Line.qty) * (Line.price))) AS t
FROM
  t_0_Line AS Line;