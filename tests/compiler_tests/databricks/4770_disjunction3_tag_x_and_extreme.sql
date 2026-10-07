WITH t_0_I AS (SELECT * FROM VALUES
  (1, "red", 10, null),
  (2, "blue", 25, "x"),
  (3, "red", 40, "y"),
  (4, "green", 5, null),
  (5, "blue", 60, "x"),
  (6, null, 30, "z"),
  (7, "green", 45, "y")
AS UNUSED_TABLE_NAME(id, c, p, t))
SELECT * FROM (
  
    SELECT
      I.id AS id
    FROM
      t_0_I AS I
    WHERE
      (I.p < 30) AND
      (I.t = "x")
   UNION ALL
  
    SELECT
      I.id AS id
    FROM
      t_0_I AS I
    WHERE
      (I.p > 50) AND
      (I.t = "x")
  
) AS UNUSED_TABLE_NAME  ORDER BY id NULLS LAST ;