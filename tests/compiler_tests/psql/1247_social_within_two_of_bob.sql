-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
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
      (Follows.b != 'bob') AND
      (Follows.a = 'bob')
   UNION ALL
  
    SELECT
      t_3_Follows.b AS b
    FROM
      t_1_Follows AS t_2_Follows, t_1_Follows AS t_3_Follows
    WHERE
      (t_3_Follows.b != 'bob') AND
      (t_2_Follows.a = 'bob') AND
      (t_3_Follows.a = t_2_Follows.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux.b AS b
FROM
  t_0_R_MultBodyAggAux AS R_MultBodyAggAux
GROUP BY R_MultBodyAggAux.b ORDER BY b;