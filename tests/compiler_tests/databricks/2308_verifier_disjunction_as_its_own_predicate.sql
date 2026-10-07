WITH t_0_V AS (SELECT * FROM VALUES
  (1),
  (2),
  (3)
AS UNUSED_TABLE_NAME(x)),
t_2_Other_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_V.x AS x
    FROM
      t_0_V AS t_3_V
    WHERE
      (t_3_V.x = 2)
   UNION ALL
  
    SELECT
      t_4_V.x AS x
    FROM
      t_0_V AS t_4_V
    WHERE
      (t_4_V.x = 3)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Other AS (SELECT
  Other_MultBodyAggAux.x AS x
FROM
  t_2_Other_MultBodyAggAux AS Other_MultBodyAggAux
GROUP BY 1)
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Other AS Other
  WHERE
    (Other.x = V.x)) IS NULL);
