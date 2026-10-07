WITH t_2_A AS (SELECT * FROM VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6)
AS UNUSED_TABLE_NAME(x)),
t_3_B AS (SELECT * FROM VALUES
  (4),
  (5),
  (6),
  (7),
  (8)
AS UNUSED_TABLE_NAME(x)),
t_1_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_2_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_0_U AS (SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_1_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1)
SELECT
  1 AS x
FROM
  t_0_U AS U
WHERE
  (U.x = 2);