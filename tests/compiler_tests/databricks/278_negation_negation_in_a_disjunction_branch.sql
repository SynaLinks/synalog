WITH t_1_Banned AS (SELECT * FROM VALUES
  (2),
  (3)
AS UNUSED_TABLE_NAME(x)),
t_0_Out_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_5) AS pushkin
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_1_Banned AS Banned
      WHERE
        (Banned.x = x_5)) IS NULL)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_10) AS pushkin
    WHERE
      (x_10 = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Out_MultBodyAggAux.x AS x
FROM
  t_0_Out_MultBodyAggAux AS Out_MultBodyAggAux
GROUP BY 1 ORDER BY x NULLS LAST;