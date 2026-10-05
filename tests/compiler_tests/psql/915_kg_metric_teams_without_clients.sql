-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

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
t_1_Team AS (SELECT
  Teams.team_id AS team_id,
  Teams.team AS team
FROM
  t_2_Teams AS Teams
GROUP BY Teams.team_id, Teams.team ORDER BY team_id),
t_8_Clients AS (SELECT * FROM (
  
    SELECT
      100 AS client_id,
      'acme' AS client
   UNION ALL
  
    SELECT
      200 AS client_id,
      'globex' AS client
  
) AS UNUSED_TABLE_NAME  ),
t_7_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_8_Clients AS Clients
GROUP BY Clients.client_id, Clients.client ORDER BY client_id),
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
GROUP BY t_4_Team.team_id, t_5_Client.client_id)
SELECT
  t_0_Team.team_id AS team_id
FROM
  t_1_Team AS t_0_Team
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_8 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_EngagedWith AS EngagedWith, UNNEST(ARRAY[0]) as x_8
  WHERE
    (EngagedWith.team_id = t_0_Team.team_id)) AS numeric) IS NULL) ORDER BY team_id;