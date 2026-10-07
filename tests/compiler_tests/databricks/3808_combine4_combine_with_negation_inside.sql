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
  (SELECT
  SUM(O.amt) AS logica_value
FROM
  t_0_O AS O
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (O.c = "ann")) IS NULL)) AS t;