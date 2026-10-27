-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_1_Child AS (SELECT * FROM (
  
    SELECT
      'root' AS p,
      'a' AS c
   UNION ALL
  
    SELECT
      'a' AS p,
      'b' AS c
   UNION ALL
  
    SELECT
      'b' AS p,
      'c' AS c
   UNION ALL
  
    SELECT
      'a' AS p,
      'd' AS c
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Child.c AS n
      FROM
        t_1_Child AS Child
      WHERE
        (Child.p = 'root')
     UNION ALL
    
      SELECT
        t_2_Child.c AS n
      FROM
        t_1_Child AS t_4_Child, t_1_Child AS t_2_Child
      WHERE
        (1 = 0) AND
        (t_4_Child.p = 'root') AND
        (COALESCE(t_2_Child.p, '') = COALESCE(t_4_Child.c, '') AND (t_2_Child.p IS NULL) = (t_4_Child.c IS NULL))
     UNION ALL
    
      SELECT
        t_6_Child.c AS n
      FROM
        t_1_Child AS t_10_Child, t_1_Child AS t_8_Child, t_1_Child AS t_6_Child
      WHERE
        (1 = 0) AND
        (COALESCE(t_6_Child.p, '') = COALESCE(t_8_Child.c, '') AND (t_6_Child.p IS NULL) = (t_8_Child.c IS NULL)) AND
        (t_10_Child.p = 'root') AND
        (COALESCE(t_8_Child.p, '') = COALESCE(t_10_Child.c, '') AND (t_8_Child.p IS NULL) = (t_10_Child.c IS NULL))
     UNION ALL
    
      SELECT
        t_12_Child.c AS n
      FROM
        t_1_Child AS t_18_Child, t_1_Child AS t_16_Child, t_1_Child AS t_14_Child, t_1_Child AS t_12_Child
      WHERE
        (1 = 0) AND
        (COALESCE(t_12_Child.p, '') = COALESCE(t_14_Child.c, '') AND (t_12_Child.p IS NULL) = (t_14_Child.c IS NULL)) AND
        (COALESCE(t_14_Child.p, '') = COALESCE(t_16_Child.c, '') AND (t_14_Child.p IS NULL) = (t_16_Child.c IS NULL)) AND
        (t_18_Child.p = 'root') AND
        (COALESCE(t_16_Child.p, '') = COALESCE(t_18_Child.c, '') AND (t_16_Child.p IS NULL) = (t_18_Child.c IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_20_Child.c AS n
FROM
  t_0_Below_RecursiveCte AS t_19_Below_RecursiveCte, t_1_Child AS t_20_Child
WHERE
  (COALESCE(t_20_Child.p, '') = COALESCE(t_19_Below_RecursiveCte.n, '') AND (t_20_Child.p IS NULL) = (t_19_Below_RecursiveCte.n IS NULL)))
SELECT
  Below_RecursiveCte.n AS n
FROM
  t_0_Below_RecursiveCte AS Below_RecursiveCte
GROUP BY Below_RecursiveCte.n ORDER BY n;