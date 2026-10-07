WITH t_0_O AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "ann", 12),
  (3, "bob", 50),
  (4, "cid", 7),
  (5, "cid", 7),
  (6, "cid", 40),
  (7, "bob", 5)
AS UNUSED_TABLE_NAME(id, c, amt)),
t_1_Vip AS (SELECT * FROM VALUES
  ("ann"),
  ("bob")
AS UNUSED_TABLE_NAME(c))
SELECT
  (SELECT
  SUM(O.amt) AS logica_value
FROM
  t_0_O AS O, t_1_Vip AS Vip
WHERE
  (Vip.c = O.c)) AS t;