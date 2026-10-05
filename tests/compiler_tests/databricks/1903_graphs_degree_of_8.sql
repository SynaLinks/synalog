WITH t_2_E AS (SELECT * FROM VALUES
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
t_1_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_2_E AS E
   UNION ALL
  
    SELECT
      t_3_E.b AS a,
      t_3_E.a AS b
    FROM
      t_2_E AS t_3_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_1_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  SUM(1) AS d
FROM
  t_0_U AS U
WHERE
  (U.a = 8);
