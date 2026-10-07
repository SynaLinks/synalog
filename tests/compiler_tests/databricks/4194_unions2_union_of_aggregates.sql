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
t_1_S_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      "a" AS src,
      A.x AS t
    FROM
      t_2_A AS A
   UNION ALL
  
    SELECT
      "b" AS src,
      B.x AS t
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_0_S AS (SELECT
  S_MultBodyAggAux.src AS src,
  SUM(S_MultBodyAggAux.t) AS t
FROM
  t_1_S_MultBodyAggAux AS S_MultBodyAggAux
GROUP BY 1)
SELECT
  S.src AS src,
  S.t AS t
FROM
  t_0_S AS S ORDER BY src NULLS LAST;