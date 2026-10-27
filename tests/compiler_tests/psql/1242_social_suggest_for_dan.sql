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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Follows.b AS c
FROM
  t_1_Follows AS Follows, t_1_Follows AS t_0_Follows
WHERE
  (t_0_Follows.b IS DISTINCT FROM 'dan') AND
  (CAST((SELECT
    MIN((CASE WHEN x_8 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_Follows AS t_2_Follows, UNNEST(ARRAY[0]) as x_8
  WHERE
    (t_2_Follows.a = 'dan') AND
    (COALESCE(t_2_Follows.b, '') = COALESCE(t_0_Follows.b, '') AND (t_2_Follows.b IS NULL) = (t_0_Follows.b IS NULL))) AS numeric) IS NULL) AND
  (Follows.a = 'dan') AND
  (COALESCE(t_0_Follows.a, '') = COALESCE(Follows.b, '') AND (t_0_Follows.a IS NULL) = (Follows.b IS NULL))
GROUP BY t_0_Follows.b ORDER BY c;