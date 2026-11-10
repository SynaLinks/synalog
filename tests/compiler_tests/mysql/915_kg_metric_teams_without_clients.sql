-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_Teams AS (SELECT * FROM (
  
    SELECT
      10 AS team_id,
      'core' AS team
   UNION ALL
  
    SELECT
      20 AS team_id,
      'infra' AS team
   UNION ALL
  
    SELECT
      30 AS team_id,
      'data' AS team
  
) AS UNUSED_TABLE_NAME  ),
t_1_Team AS (SELECT * FROM (
SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_2_Teams AS Teams
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY team_id IS NULL, team_id),
t_8_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_7_Client AS (SELECT * FROM (
SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_8_Clients AS Clients
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY client_id IS NULL, client_id),
t_9_Engagements AS (SELECT * FROM (
  
    SELECT
      10 AS team_id,
      100 AS client_id
   UNION ALL
  
    SELECT
      20 AS team_id,
      100 AS client_id
   UNION ALL
  
    SELECT
      30 AS team_id,
      200 AS client_id
  
) AS UNUSED_TABLE_NAME  ),
t_3_EngagedWith AS (SELECT
  t_4_Team.team_id AS team_id,
  t_5_Client.client_id AS client_id
FROM
  t_1_Team AS t_4_Team, t_7_Client AS t_5_Client, t_9_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_4_Team.team_id) AND
  (Engagements.client_id = t_5_Client.client_id)
GROUP BY 1, 2)
SELECT * FROM (
SELECT
  t_0_Team.team_id AS team_id
FROM
  t_1_Team AS t_0_Team
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_3_EngagedWith AS EngagedWith
  WHERE
    (EngagedWith.team_id = t_0_Team.team_id)) IS NULL)
) AS UNUSED_TABLE_NAME ORDER BY team_id IS NULL, team_id;