WITH t_2_V AS (SELECT * FROM VALUES
  (1),
  (1)
AS UNUSED_TABLE_NAME(x)),
t_1_A AS (SELECT
  V.x AS x
FROM
  t_2_V AS V
GROUP BY 1),
t_3_B AS (SELECT
  t_4_V.x AS x
FROM
  t_2_V AS t_4_V
GROUP BY 1),
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_1_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;