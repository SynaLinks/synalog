WITH t_2_Team AS (SELECT * FROM (
  
    SELECT
      "Alice" AS name,
      "Python" AS skill
   UNION ALL
  
    SELECT
      "Alice" AS name,
      "SQL" AS skill
   UNION ALL
  
    SELECT
      "Bob" AS name,
      "Java" AS skill
   UNION ALL
  
    SELECT
      "Bob" AS name,
      "Python" AS skill
   UNION ALL
  
    SELECT
      "Bob" AS name,
      "Go" AS skill
  
) AS UNUSED_TABLE_NAME  ),
t_0_SkillsByPerson AS (SELECT
  Team.name AS name,
  ARRAY_AGG(Team.skill order by [Team.skill][offset(0)]) AS skills
FROM
  t_2_Team AS Team
GROUP BY name)
SELECT
  SkillsByPerson.name AS name,
  SkillsByPerson.skills AS skills
FROM
  t_0_SkillsByPerson AS SkillsByPerson ORDER BY name;