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
  O.id AS id,
  ((1) + (COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_1_O AS t_0_O
WHERE
  (t_0_O.amt > O.amt) AND
  (t_0_O.c = O.c)), 0))) AS r
FROM
  t_1_O AS O ORDER BY id NULLS LAST;