-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
      (Follows.b IS DISTINCT FROM 'dan') AND
      (Follows.a = 'dan')
   UNION ALL
  
    SELECT
      t_3_Follows.b AS b
    FROM
      t_1_Follows AS t_2_Follows, t_1_Follows AS t_3_Follows
    WHERE
      (t_3_Follows.b IS DISTINCT FROM 'dan') AND
      (t_2_Follows.a = 'dan') AND
      (COALESCE(t_3_Follows.a, '') = COALESCE(t_2_Follows.b, '') AND (t_3_Follows.a IS NULL) = (t_2_Follows.b IS NULL))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux.b AS b
FROM
  t_0_R_MultBodyAggAux AS R_MultBodyAggAux
GROUP BY R_MultBodyAggAux.b ORDER BY b;