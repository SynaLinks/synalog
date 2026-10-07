WITH t_1_Follows AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("ann", "cat"),
  ("cat", "dan"),
  ("dan", "cat"),
  ("bob", "cat"),
  ("eve", "ann"),
  ("eve", "bob"),
  ("eve", "cat"),
  ("dan", "eve"),
  ("fay", "cat")
AS UNUSED_TABLE_NAME(a, b)),
t_0_D_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Follows.b AS u,
      1 AS followers,
      0 AS following
    FROM
      t_1_Follows AS Follows
   UNION ALL
  
    SELECT
      t_2_Follows.a AS u,
      0 AS followers,
      1 AS following
    FROM
      t_1_Follows AS t_2_Follows
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux.u AS u,
  SUM(D_MultBodyAggAux.followers) AS followers,
  SUM(D_MultBodyAggAux.following) AS following
FROM
  t_0_D_MultBodyAggAux AS D_MultBodyAggAux
GROUP BY 1 ORDER BY u NULLS LAST, followers NULLS LAST, following NULLS LAST;
