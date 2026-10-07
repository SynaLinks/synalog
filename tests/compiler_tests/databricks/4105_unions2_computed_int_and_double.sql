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
      ((A.x) / NULLIF(2, 0)) AS v
    FROM
      t_1_A AS A
   UNION ALL
  
    SELECT
      B.x AS x,
      ((B.x) * (2)) AS v
    FROM
      t_2_B AS B
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.x AS x,
  U.v AS v
FROM
  t_0_U AS U ORDER BY x NULLS LAST, v NULLS LAST;