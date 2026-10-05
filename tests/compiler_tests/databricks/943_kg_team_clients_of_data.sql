WITH t_4_Teams AS (SELECT * FROM VALUES
  (10, "core"),
  (20, "infra"),
  (30, "data")
AS UNUSED_TABLE_NAME(team_id, team)),
t_3_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_4_Teams AS Teams
GROUP BY 1, 2 ORDER BY team_id NULLS LAST),
t_6_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_5_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_6_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_7_Engagements AS (SELECT * FROM VALUES
  (10, 100),
  (20, 100),
  (30, 200)
AS UNUSED_TABLE_NAME(team_id, client_id)),
t_0_EngagedWith AS (SELECT
  t_1_Team.team_id AS team_id,
  t_2_Client.client_id AS client_id
FROM
  t_3_Team AS t_1_Team, t_5_Client AS t_2_Client, t_7_Engagements AS Engagements
WHERE
  (Engagements.team_id = t_1_Team.team_id) AND
  (Engagements.client_id = t_2_Client.client_id)
GROUP BY 1, 2)
SELECT
  EngagedWith.client_id AS client_id
FROM
  t_0_EngagedWith AS EngagedWith
WHERE
  (EngagedWith.team_id = 30)
GROUP BY 1 ORDER BY client_id NULLS LAST;