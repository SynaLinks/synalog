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
t_0_R_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Follows.b AS b
    FROM
      t_1_Follows AS Follows
    WHERE
      (Follows.b != "dan") AND
      (Follows.a = "dan")
   UNION ALL
  
    SELECT
      t_3_Follows.b AS b
    FROM
      t_1_Follows AS t_2_Follows, t_1_Follows AS t_3_Follows
    WHERE
      (t_3_Follows.b != "dan") AND
      (t_2_Follows.a = "dan") AND
      (t_3_Follows.a = t_2_Follows.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux.b AS b
FROM
  t_0_R_MultBodyAggAux AS R_MultBodyAggAux
GROUP BY 1 ORDER BY b NULLS LAST;
