WITH t_1_E AS (SELECT * FROM VALUES
  (1, "a", 10),
  (2, "a", 20),
  (3, "b", null),
  (4, null, 5)
AS UNUSED_TABLE_NAME(id, g, v)),
t_2_F AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2),
  (null, 3)
AS UNUSED_TABLE_NAME(g, w)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.id AS id
    FROM
      t_1_E AS E, t_2_F AS F
    WHERE
      (E.g = F.g)
   UNION ALL
  
    SELECT
      t_3_E.id AS id
    FROM
      t_1_E AS t_3_E, t_2_F AS t_4_F
    WHERE
      (t_3_E.id = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.id AS id
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY id NULLS LAST;