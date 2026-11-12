DROP TABLE IF EXISTS synalog_home.G;
CREATE TABLE synalog_home.G AS SELECT
  x_1 AS k
FROM
  LATERAL (SELECT explode(ARRAY(1)) AS x_1) AS pushkin;

-- Interacting with table synalog_home.G

WITH t_0_N AS (SELECT * FROM VALUES
  (1, "a"),
  (2, "b")
AS UNUSED_TABLE_NAME(k, s))
SELECT
  G.k AS k,
  N.s AS s
FROM
  synalog_home.G AS G, t_0_N AS N
WHERE
  (N.k = G.k);