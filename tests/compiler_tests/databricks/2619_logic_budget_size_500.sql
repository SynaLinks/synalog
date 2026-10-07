WITH t_0_Proj AS (SELECT * FROM VALUES
  (10, "red", 300),
  (11, "red", 1200),
  (12, "blue", 800),
  (13, "green", 50),
  (14, "blue", 90)
AS UNUSED_TABLE_NAME(pid, team, budget))
SELECT
  Proj.pid AS pid,
  CASE WHEN (Proj.budget > 500) THEN "big" ELSE "small" END AS size
FROM
  t_0_Proj AS Proj ORDER BY pid NULLS LAST, size NULLS LAST;