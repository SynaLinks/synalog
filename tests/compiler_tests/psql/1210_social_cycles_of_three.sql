-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Follows AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Follows.a AS a,
  Follows.b AS b,
  t_0_Follows.b AS c
FROM
  t_2_Follows AS Follows, t_2_Follows AS t_0_Follows, t_2_Follows AS t_1_Follows
WHERE
  (Follows.a < Follows.b) AND
  (Follows.a < t_0_Follows.b) AND
  (COALESCE(t_0_Follows.a, '') = COALESCE(Follows.b, '') AND (t_0_Follows.a IS NULL) = (Follows.b IS NULL)) AND
  (COALESCE(t_1_Follows.a, '') = COALESCE(t_0_Follows.b, '') AND (t_1_Follows.a IS NULL) = (t_0_Follows.b IS NULL)) AND
  (COALESCE(t_1_Follows.b, '') = COALESCE(Follows.a, '') AND (t_1_Follows.b IS NULL) = (Follows.a IS NULL))
GROUP BY Follows.a, Follows.b, t_0_Follows.b;