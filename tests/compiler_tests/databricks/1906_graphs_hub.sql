WITH t_4_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_3_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_4_E AS E
   UNION ALL
  
    SELECT
      t_5_E.b AS a,
      t_5_E.a AS b
    FROM
      t_4_E AS t_5_E
  
) AS UNUSED_TABLE_NAME  ),
t_2_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_3_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_D AS (SELECT
  U.a AS n,
  SUM(1) AS d
FROM
  t_2_U AS U
GROUP BY 1)
SELECT
  t_0_D.n AS n,
  t_0_D.d AS d
FROM
  t_1_D AS t_0_D ORDER BY d desc, n NULLS LAST LIMIT 1;
