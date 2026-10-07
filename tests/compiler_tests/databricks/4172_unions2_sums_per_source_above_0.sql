WITH t_1_A AS (SELECT * FROM VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6)
AS UNUSED_TABLE_NAME(x)),
t_2_B AS (SELECT * FROM VALUES
  (4),
  (5),
  (6),
  (7),
  (8)
AS UNUSED_TABLE_NAME(x)),
t_3_C AS (SELECT * FROM VALUES
  (2),
  (7),
  (9)
AS UNUSED_TABLE_NAME(x)),
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x,
      "a" AS src
    FROM
      t_1_A AS A
    WHERE
      (A.x > 0)
   UNION ALL
  
    SELECT
      B.x AS x,
      "b" AS src
    FROM
      t_2_B AS B
    WHERE
      (B.x > 0)
   UNION ALL
  
    SELECT
      C.x AS x,
      "c" AS src
    FROM
      t_3_C AS C
    WHERE
      (C.x > 0)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.src AS src,
  SUM(U.x) AS s
FROM
  t_0_U AS U
GROUP BY 1 ORDER BY src NULLS LAST;