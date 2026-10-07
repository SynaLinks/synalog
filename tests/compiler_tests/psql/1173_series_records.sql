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
WITH t_0_Reading AS (SELECT * FROM (
  
    SELECT
      1 AS day,
      10 AS value
   UNION ALL
  
    SELECT
      2 AS day,
      12 AS value
   UNION ALL
  
    SELECT
      3 AS day,
      11 AS value
   UNION ALL
  
    SELECT
      4 AS day,
      15 AS value
   UNION ALL
  
    SELECT
      5 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      6 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      7 AS day,
      14 AS value
   UNION ALL
  
    SELECT
      8 AS day,
      20 AS value
   UNION ALL
  
    SELECT
      9 AS day,
      25 AS value
   UNION ALL
  
    SELECT
      10 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      11 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      12 AS day,
      30 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_1_Beaten AS (SELECT
  t_2_Reading.day AS day
FROM
  t_0_Reading AS t_2_Reading, t_0_Reading AS t_3_Reading
WHERE
  (t_3_Reading.day < t_2_Reading.day) AND
  (t_3_Reading.value >= t_2_Reading.value)
GROUP BY t_2_Reading.day)
SELECT
  Reading.day AS day
FROM
  t_0_Reading AS Reading
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Beaten AS Beaten, UNNEST(ARRAY[0]::numeric[]) as x_4
  WHERE
    (Beaten.day = Reading.day)) AS numeric) IS NULL) ORDER BY day;