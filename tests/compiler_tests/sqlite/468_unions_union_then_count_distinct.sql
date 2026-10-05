WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      x_4.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2)) as x_4
   UNION ALL
  
    SELECT
      x_6.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(2, 3)) as x_6
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  U.x AS x
FROM
  t_1_U AS U
GROUP BY U.x)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;