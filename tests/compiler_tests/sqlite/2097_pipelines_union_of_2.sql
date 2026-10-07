WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(0, 1)) as x_4
   UNION ALL
  
    SELECT
      x_6.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(2, 3)) as x_6
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY W_MultBodyAggAux.x)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;