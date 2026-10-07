WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "a" AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      "a" AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      "b" AS g,
      null AS v
   UNION ALL
  
    SELECT
      4 AS id,
      null AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_F AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      1 AS w
   UNION ALL
  
    SELECT
      "b" AS g,
      2 AS w
   UNION ALL
  
    SELECT
      null AS g,
      3 AS w
  
) AS UNUSED_TABLE_NAME  ),
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
GROUP BY id ORDER BY id;