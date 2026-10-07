DROP TABLE IF EXISTS logica_test.Team;
CREATE TABLE logica_test.Team AS WITH t_0_Teams AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_0_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id;

-- Interacting with table logica_test.Team

WITH t_4_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_3_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_4_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id),
t_5_Engagements AS (SELECT * FROM (
  
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
  logica_test.Team AS t_1_Team, t_3_Client AS t_2_Client, t_5_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_1_Team.team_id) AND
  (Engagements.client_id = t_2_Client.client_id)
GROUP BY 1, 2)
SELECT
  EngagedWith.team_id AS team_id
FROM
  t_0_EngagedWith AS EngagedWith
WHERE
  (EngagedWith.client_id = 100)
GROUP BY 1 ORDER BY team_id;