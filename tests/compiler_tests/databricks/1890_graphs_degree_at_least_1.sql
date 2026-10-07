WITH t_0_Node AS (SELECT * FROM VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10),
  (11),
  (12)
AS UNUSED_TABLE_NAME(n)),
t_3_E AS (SELECT * FROM VALUES
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
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  Node.n AS n
FROM
  t_0_Node AS Node
WHERE
  (COALESCE((SELECT
    SUM(1) AS logica_value
  FROM
    t_1_U AS U
  WHERE
    (U.a = Node.n)), 0) >= 1) ORDER BY n NULLS LAST;
