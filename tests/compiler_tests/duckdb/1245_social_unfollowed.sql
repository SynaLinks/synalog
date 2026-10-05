-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_Follows AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'cat' AS a,
      'dan' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'eve' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'cat' AS b
  
) AS UNUSED_TABLE_NAME  ),
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
GROUP BY User_MultBodyAggAux.u),
t_5_Followed AS (SELECT
  t_6_Follows.b AS u
FROM
  t_3_Follows AS t_6_Follows
GROUP BY t_6_Follows.b)
SELECT
  t_0_User.u AS u
FROM
  t_1_User AS t_0_User
WHERE
  ((SELECT
    MIN((CASE WHEN x_10.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_5_Followed AS Followed, (select unnest([0]) as unnested_pod) as x_10
  WHERE
    (Followed.u = t_0_User.u)) IS NULL);
