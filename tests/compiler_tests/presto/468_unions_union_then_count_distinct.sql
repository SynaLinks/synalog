WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  U.x AS x
FROM
  t_1_U AS U
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;