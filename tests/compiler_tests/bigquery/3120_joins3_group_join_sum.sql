WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "a" AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      "a" AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      "b" AS g,
      null AS v
   UNION ALL
  
    SELECT
      4 AS id,
      null AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_S AS (SELECT
  E.g AS g,
  SUM(E.v) AS s
FROM
  t_2_E AS E
GROUP BY g),
t_3_F AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      1 AS w
   UNION ALL
  
    SELECT
      "b" AS g,
      2 AS w
   UNION ALL
  
    SELECT
      null AS g,
      3 AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_S.g AS g,
  t_0_S.s AS s,
  F.w AS w
FROM
  t_1_S AS t_0_S, t_3_F AS F
WHERE
  (F.g = t_0_S.g) ORDER BY g NULLS LAST;