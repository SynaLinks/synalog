WITH t_2_Teams AS (SELECT * FROM (
  
    SELECT
      10 AS team_id,
      "core" AS team
   UNION ALL
  
    SELECT
      20 AS team_id,
      "infra" AS team
   UNION ALL
  
    SELECT
      30 AS team_id,
      "data" AS team
  
) AS UNUSED_TABLE_NAME  ),
t_1_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_2_Teams AS Teams
GROUP BY team_id, team ORDER BY team_id NULLS LAST),
t_8_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      "acme" AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      "globex" AS client
  
) AS UNUSED_TABLE_NAME  ),
t_7_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_8_Clients AS Clients
GROUP BY client_id, client ORDER BY client_id NULLS LAST),
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
GROUP BY team_id, client_id)
SELECT
  t_0_Team.team_id AS team_id
FROM
  t_1_Team AS t_0_Team
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_EngagedWith AS EngagedWith
  WHERE
    (EngagedWith.team_id = t_0_Team.team_id)) IS NULL) ORDER BY team_id NULLS LAST;