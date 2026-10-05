-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Follows AS (SELECT * FROM (
  
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
t_0_R_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Follows.b AS b
    FROM
      t_1_Follows AS Follows
    WHERE
      (Follows.b != 'fay') AND
      (Follows.a = 'fay')
   UNION ALL
  
    SELECT
      t_3_Follows.b AS b
    FROM
      t_1_Follows AS t_2_Follows, t_1_Follows AS t_3_Follows
    WHERE
      (t_3_Follows.b != 'fay') AND
      (t_2_Follows.a = 'fay') AND
      (t_3_Follows.a = t_2_Follows.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux.b AS b
FROM
  t_0_R_MultBodyAggAux AS R_MultBodyAggAux
GROUP BY R_MultBodyAggAux.b ORDER BY b;