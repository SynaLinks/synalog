WITH t_2_P AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (4, 4),
  (5, 1),
  (7, 6)
AS UNUSED_TABLE_NAME(a, b)),
t_0_S AS (SELECT * FROM (
  
    SELECT
      t_1_P.a AS x,
      t_1_P.b AS y
    FROM
      t_2_P AS t_1_P
   UNION ALL
  
    SELECT
      t_3_P.b AS x,
      t_3_P.a AS y
    FROM
      t_2_P AS t_3_P
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_S AS S;