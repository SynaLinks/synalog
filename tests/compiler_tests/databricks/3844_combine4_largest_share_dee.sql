WITH t_1_O AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "ann", 12),
  (3, "bob", 50),
  (4, "cid", 7),
  (5, "cid", 7),
  (6, "cid", 40),
  (7, "bob", 5)
AS UNUSED_TABLE_NAME(id, c, amt))
SELECT
  MAX(((O.amt) / NULLIF((SELECT
  SUM(t_0_O.amt) AS logica_value
FROM
  t_1_O AS t_0_O
WHERE
  (t_0_O.c = "dee")), 0))) AS s
FROM
  t_1_O AS O
WHERE
  (O.c = "dee");