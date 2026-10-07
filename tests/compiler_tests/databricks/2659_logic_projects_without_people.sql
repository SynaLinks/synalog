WITH t_0_Proj AS (SELECT * FROM VALUES
  (10, "red", 300),
  (11, "red", 1200),
  (12, "blue", 800),
  (13, "green", 50),
  (14, "blue", 90)
AS UNUSED_TABLE_NAME(pid, team, budget)),
t_1_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours))
SELECT
  Proj.pid AS pid
FROM
  t_0_Proj AS Proj
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_A AS A
  WHERE
    (A.pid = Proj.pid)) IS NULL);