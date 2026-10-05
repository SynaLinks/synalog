WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      UNNEST(ARRAY[1, 2]) as x_4
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      UNNEST(ARRAY[2, 3]) as x_6
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  U.x AS x
FROM
  t_1_U AS U
GROUP BY x)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;