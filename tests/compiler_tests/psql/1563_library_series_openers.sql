-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_IsSequel AS (SELECT
  t_2_Sequel.next AS book
FROM
  t_0_Sequel AS t_2_Sequel
GROUP BY t_2_Sequel.next)
SELECT
  Sequel.book AS book
FROM
  t_0_Sequel AS Sequel
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_IsSequel AS IsSequel, UNNEST(ARRAY[0]) as x_4
  WHERE
    (COALESCE(IsSequel.book, 0) = COALESCE(Sequel.book, 0) AND (IsSequel.book IS NULL) = (Sequel.book IS NULL))) AS numeric) IS NULL)
GROUP BY Sequel.book ORDER BY book;