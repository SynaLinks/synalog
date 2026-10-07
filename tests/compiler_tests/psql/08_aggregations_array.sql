-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_Team AS (SELECT * FROM (
  
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
  t_3_Team AS Team
GROUP BY Team.name)
SELECT
  SkillsByPerson.name AS name,
  SkillsByPerson.skills AS skills
FROM
  t_0_SkillsByPerson AS SkillsByPerson ORDER BY name;