WITH t_0_O AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "ann", 12),
  (3, "bob", 50),
  (4, "cid", 7),
  (5, "cid", 7),
  (6, "cid", 40),
  (7, "bob", 5)
AS UNUSED_TABLE_NAME(id, c, amt))
SELECT
  O.c AS c,
  SUM(1) AS n
FROM
  t_0_O AS O
WHERE
  (O.amt > (SELECT
    AVG(t_1_O.amt) AS logica_value
  FROM
    t_0_O AS t_1_O
  WHERE
    (t_1_O.c = O.c)))
GROUP BY 1 ORDER BY c NULLS LAST;