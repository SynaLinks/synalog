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
   UNION ALL
  
    SELECT
      B.x AS x,
      "b" AS src
    FROM
      t_2_B AS B
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.src AS src
FROM
  t_0_U AS U
WHERE
  (U.x = 2) ORDER BY src NULLS LAST;