WITH t_2_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_1_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_2_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_8_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_7_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_8_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_9_Engagements AS (SELECT * FROM VALUES
  (10, 100),
  (20, 100),
  (30, 200)
AS UNUSED_TABLE_NAME(team_id, client_id)),
t_3_EngagedWith AS (SELECT
  t_4_Team.team_id AS team_id,
  t_5_Client.client_id AS client_id
FROM
  t_1_Team AS t_4_Team, t_7_Client AS t_5_Client, t_9_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_4_Team.team_id) AND
  (Engagements.client_id = t_5_Client.client_id)
GROUP BY 1, 2)
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