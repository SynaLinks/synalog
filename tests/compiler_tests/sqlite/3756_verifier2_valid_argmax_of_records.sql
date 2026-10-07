WITH t_4_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMax(JSON_OBJECT('n', t_2_N.n, 's', t_2_N.s), t_2_N.n, 1), '$[' || 0 || ']') END) AS best
FROM
  t_4_N AS t_2_N)
SELECT
  JSON_EXTRACT(t_0_A.best, "$.s") AS s
FROM
  t_1_A AS t_0_A;