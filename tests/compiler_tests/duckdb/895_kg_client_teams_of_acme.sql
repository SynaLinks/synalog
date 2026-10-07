-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_Teams AS (SELECT * FROM (
  
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
t_3_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_4_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_6_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_5_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_6_Clients AS Clients
GROUP BY Clients.client_id, Clients.client ORDER BY client_id),
t_7_Engagements AS (SELECT * FROM (
  
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
t_0_EngagedWith AS (SELECT
  t_1_Team.team_id AS team_id,
  t_2_Client.client_id AS client_id
FROM
  t_3_Team AS t_1_Team, t_5_Client AS t_2_Client, t_7_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_1_Team.team_id) AND
  (Engagements.client_id = t_2_Client.client_id)
GROUP BY t_1_Team.team_id, t_2_Client.client_id)
SELECT
  EngagedWith.team_id AS team_id
FROM
  t_0_EngagedWith AS EngagedWith
WHERE
  (EngagedWith.client_id = 100)
GROUP BY EngagedWith.team_id ORDER BY team_id;