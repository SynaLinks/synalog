WITH t_1_W AS (SELECT * FROM VALUES
  (1, "apple"),
  (2, "Apple"),
  (3, "banana"),
  (4, "Zebra"),
  (5, "zebra"),
  (6, "éclair"),
  (7, "Eclair"),
  (8, "10"),
  (9, "9"),
  (10, "a b"),
  (11, "a-b"),
  (12, "a_b"),
  (13, ""),
  (14, "ä"),
  (15, "z")
AS UNUSED_TABLE_NAME(id, w))
SELECT
  t_0_W.w AS w,
  t_0_W.id AS id
FROM
  t_1_W AS t_0_W ORDER BY w desc, id desc;