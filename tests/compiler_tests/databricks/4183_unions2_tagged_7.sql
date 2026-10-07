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
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x,
      "a" AS src
    FROM
      t_1_A AS A
    WHERE
      (A.x > 7)
   UNION ALL
  
    SELECT
      B.x AS x,
      "b" AS src
    FROM
      t_2_B AS B
    WHERE
      (B.x > 7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.x AS x,
  U.src AS src
FROM
  t_0_U AS U ORDER BY x NULLS LAST, src NULLS LAST;