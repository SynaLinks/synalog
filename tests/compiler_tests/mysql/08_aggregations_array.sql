-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

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
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(Team.skill), '$[0]') ORDER BY Team.skill IS NULL ASC, Team.skill ASC SEPARATOR ','), ']') AS JSON) AS skills
FROM
  t_3_Team AS Team
GROUP BY 1)
SELECT * FROM (
SELECT
  SkillsByPerson.name AS name,
  SkillsByPerson.skills AS skills
FROM
  t_0_SkillsByPerson AS SkillsByPerson
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;