WITH t_0_P AS (SELECT * FROM VALUES
  (1, "ann"),
  (2, "bob")
AS UNUSED_TABLE_NAME(id, name)),
t_1_O AS (SELECT * FROM VALUES
  (1, 10),
  (1, 20),
  (2, 5)
AS UNUSED_TABLE_NAME(pid, amount))
SELECT
  P.name AS name,
  SUM(O.amount) AS total
FROM
  t_0_P AS P, t_1_O AS O
WHERE
  (O.pid = P.id)
GROUP BY 1 ORDER BY name NULLS LAST;