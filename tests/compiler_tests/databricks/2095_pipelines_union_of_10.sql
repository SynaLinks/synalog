WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(0, 1)) AS x_4) AS pushkin
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2, 3)) AS x_6) AS pushkin
   UNION ALL
  
    SELECT
      x_8 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(4, 5)) AS x_8) AS pushkin
   UNION ALL
  
    SELECT
      x_10 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(6, 7)) AS x_10) AS pushkin
   UNION ALL
  
    SELECT
      x_12 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(8, 9)) AS x_12) AS pushkin
   UNION ALL
  
    SELECT
      x_14 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(10, 11)) AS x_14) AS pushkin
   UNION ALL
  
    SELECT
      x_16 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(12, 13)) AS x_16) AS pushkin
   UNION ALL
  
    SELECT
      x_18 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(14, 15)) AS x_18) AS pushkin
   UNION ALL
  
    SELECT
      x_20 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(16, 17)) AS x_20) AS pushkin
   UNION ALL
  
    SELECT
      x_22 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(18, 19)) AS x_22) AS pushkin
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;
