WITH t_3_I AS (SELECT * FROM VALUES
  (1, "red", 10, null),
  (2, "blue", 25, "x"),
  (3, "red", 40, "y"),
  (4, "green", 5, null),
  (5, "blue", 60, "x"),
  (6, null, 30, "z"),
  (7, "green", 45, "y")
AS UNUSED_TABLE_NAME(id, c, p, t)),
t_2_C_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      I.id AS id
    FROM
      t_3_I AS I
    WHERE
      (I.p < 60)
   UNION ALL
  
    SELECT
      t_4_I.id AS id
    FROM
      t_3_I AS t_4_I
    WHERE
      (t_4_I.t IS NOT null)
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  C_MultBodyAggAux.id AS id
FROM
  t_2_C_MultBodyAggAux AS C_MultBodyAggAux
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_1_C AS t_0_C;