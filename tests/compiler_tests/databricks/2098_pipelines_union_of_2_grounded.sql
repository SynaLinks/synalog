DROP TABLE IF EXISTS logica_test.W;
CREATE TABLE logica_test.W AS WITH t_0_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(0, 1)) AS x_3) AS pushkin
   UNION ALL
  
    SELECT
      x_5 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2, 3)) AS x_5) AS pushkin
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_0_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1;

-- Interacting with table logica_test.W

SELECT
  SUM(1) AS n
FROM
  logica_test.W AS W;
