WITH t_1_Person AS (SELECT * FROM VALUES
  (1, "Ann", "red", 34, true),
  (2, "Bob", "red", null, false),
  (3, "Cid", "blue", 52, true),
  (4, "Dee", "blue", 23, false),
  (5, "Eve", "green", 41, null),
  (6, "Fay", "red", 19, true),
  (7, "Gus", "gold", 60, false)
AS UNUSED_TABLE_NAME(id, name, team, age, active)),
t_2_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours)),
t_3_Proj AS (SELECT * FROM VALUES
  (10, "red", 300),
  (11, "red", 1200),
  (12, "blue", 800),
  (13, "green", 50),
  (14, "blue", 90)
AS UNUSED_TABLE_NAME(pid, team, budget)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Person.id AS id
    FROM
      t_1_Person AS Person
    WHERE
      Person.active
   UNION ALL
  
    SELECT
      A.id AS id
    FROM
      t_2_A AS A, t_3_Proj AS Proj
    WHERE
      (Proj.budget > 100) AND
      (Proj.pid = A.pid)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.id AS id
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY id NULLS LAST;