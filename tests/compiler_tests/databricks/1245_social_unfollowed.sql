WITH t_3_Follows AS (SELECT * FROM VALUES
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
t_2_User_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Follows.a AS u
    FROM
      t_3_Follows AS Follows
   UNION ALL
  
    SELECT
      t_4_Follows.b AS u
    FROM
      t_3_Follows AS t_4_Follows
  
) AS UNUSED_TABLE_NAME  ),
t_1_User AS (SELECT
  User_MultBodyAggAux.u AS u
FROM
  t_2_User_MultBodyAggAux AS User_MultBodyAggAux
GROUP BY 1),
t_5_Followed AS (SELECT
  t_6_Follows.b AS u
FROM
  t_3_Follows AS t_6_Follows
GROUP BY 1)
SELECT
  t_0_User.u AS u
FROM
  t_1_User AS t_0_User
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_5_Followed AS Followed
  WHERE
    (Followed.u = t_0_User.u)) IS NULL);
