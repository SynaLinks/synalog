WITH t_0_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours)),
t_1_Proj AS (SELECT * FROM VALUES
  (10, "red", 300),
  (11, "red", 1200),
  (12, "blue", 800),
  (13, "green", 50),
  (14, "blue", 90)
AS UNUSED_TABLE_NAME(pid, team, budget))
SELECT
  A.id AS id,
  SUM(CASE WHEN (Proj.budget > 100) THEN A.hours ELSE 0 END) AS h
FROM
  t_0_A AS A, t_1_Proj AS Proj
WHERE
  (Proj.pid = A.pid)
GROUP BY 1 ORDER BY id NULLS LAST, h NULLS LAST;