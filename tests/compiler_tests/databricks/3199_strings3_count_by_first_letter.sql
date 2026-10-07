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
  SUBSTR(t_0_W.w, 1, 1) AS c,
  SUM(1) AS n
FROM
  t_1_W AS t_0_W
WHERE
  (LENGTH(t_0_W.w) > 0)
GROUP BY 1 ORDER BY c NULLS LAST, n NULLS LAST;