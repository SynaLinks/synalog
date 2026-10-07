WITH t_1_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours)),
t_0_Projects AS (SELECT
  A.id AS id,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(A.pid AS v)), s -> s.v) END) AS l
FROM
  t_1_A AS A
GROUP BY 1),
t_2_Proj AS (SELECT * FROM VALUES
  (10, "red", 300),
  (11, "red", 1200),
  (12, "blue", 800),
  (13, "green", 50),
  (14, "blue", 90)
AS UNUSED_TABLE_NAME(pid, team, budget))
SELECT
  Projects.id AS id,
  SUM(1) AS n
FROM
  t_0_Projects AS Projects, t_2_Proj AS Proj, LATERAL (SELECT explode(Projects.l) AS x_4) AS pushkin
WHERE
  (Proj.pid = x_4)
GROUP BY 1 ORDER BY id NULLS LAST, n NULLS LAST;