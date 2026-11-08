-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

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
  arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(Team.skill, Team.skill)))) AS skills
FROM
  t_3_Team AS Team
GROUP BY 1)
SELECT
  SkillsByPerson.name AS name,
  SkillsByPerson.skills AS skills
FROM
  t_0_SkillsByPerson AS SkillsByPerson ORDER BY name;