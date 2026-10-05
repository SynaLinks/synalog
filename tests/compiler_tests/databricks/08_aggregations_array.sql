WITH t_3_Team AS (SELECT * FROM VALUES
  ("Alice", "Python"),
  ("Alice", "SQL"),
  ("Bob", "Java"),
  ("Bob", "Python"),
  ("Bob", "Go")
AS UNUSED_TABLE_NAME(name, skill)),
t_0_SkillsByPerson AS (SELECT
  Team.name AS name,
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(Team.skill AS arg, Team.skill AS value))), s -> s.value) AS skills
FROM
  t_3_Team AS Team
GROUP BY 1)
SELECT
  SkillsByPerson.name AS name,
  SkillsByPerson.skills AS skills
FROM
  t_0_SkillsByPerson AS SkillsByPerson ORDER BY name NULLS LAST;