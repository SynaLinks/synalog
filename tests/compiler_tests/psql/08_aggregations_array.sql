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
-- Logica type: logicarecord625776357
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord625776357') then create type logicarecord625776357 as (arg text, value text); end if;
END $$;
WITH t_2_Team AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      'Python' AS skill
   UNION ALL
  
    SELECT
      'Alice' AS name,
      'SQL' AS skill
   UNION ALL
  
    SELECT
      'Bob' AS name,
      'Java' AS skill
   UNION ALL
  
    SELECT
      'Bob' AS name,
      'Python' AS skill
   UNION ALL
  
    SELECT
      'Bob' AS name,
      'Go' AS skill
  
) AS UNUSED_TABLE_NAME  ),
t_0_SkillsByPerson AS (SELECT
  Team.name AS name,
  ARRAY_AGG(Team.skill order by Team.skill) AS skills
FROM
  t_2_Team AS Team
GROUP BY Team.name)
SELECT
  SkillsByPerson.name AS name,
  SkillsByPerson.skills AS skills
FROM
  t_0_SkillsByPerson AS SkillsByPerson ORDER BY name;