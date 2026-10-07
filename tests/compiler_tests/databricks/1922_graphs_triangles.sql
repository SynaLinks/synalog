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
GROUP BY 1, 2)
SELECT
  U.a AS a,
  U.b AS b,
  t_0_U.b AS c
FROM
  t_2_U AS U, t_2_U AS t_0_U, t_2_U AS t_1_U
WHERE
  (U.a < U.b) AND
  (U.b < t_0_U.b) AND
  (t_0_U.a = U.b) AND
  (t_1_U.a = t_0_U.b) AND
  (t_1_U.b = U.a)
GROUP BY 1, 2, 3 ORDER BY a NULLS LAST, b NULLS LAST, c NULLS LAST;
