DROP TABLE IF EXISTS logica_test.G;
CREATE TABLE logica_test.G AS SELECT
  x_1 AS k
FROM
  LATERAL (SELECT explode(ARRAY(1)) AS x_1) AS pushkin;

-- Interacting with table logica_test.G

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      "a" AS s
   UNION ALL
  
    SELECT
      2 AS k,
      "b" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  G.k AS k,
  N.s AS s
FROM
  logica_test.G AS G, t_0_N AS N
WHERE
  (N.k = G.k);