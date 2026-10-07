-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      'ann' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/ann' AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      'bob' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/bob' AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      'cid' AS name,
      'ops' AS dept,
      20 AS team_id,
      'inactive' AS status,
      'https://x/cid' AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      'dan' AS name,
      'ops' AS dept,
      20 AS team_id,
      'active' AS status,
      'https://x/dan' AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      'eve' AS name,
      'eng' AS dept,
      30 AS team_id,
      'active' AS status,
      'https://x/eve' AS url
  
) AS UNUSED_TABLE_NAME  ),
t_2_Contractors AS (SELECT * FROM (
  
    SELECT
      1 AS contractor_id,
      'zoe' AS name
   UNION ALL
  
    SELECT
      2 AS contractor_id,
      'yan' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_Party_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      ('employee:' || (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS TEXT) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN ABS(synalog_v) < 1 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15) AS TEXT))) WHEN ABS(synalog_v) < 1e18 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,20)) AS TEXT))) ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,0)) AS TEXT) END) FROM (SELECT Employees.person_id AS synalog_v) AS synalog_n)) AS party_id,
      Employees.name AS name,
      'employee' AS kind
    FROM
      t_1_Employees AS Employees
   UNION ALL
  
    SELECT
      ('contractor:' || (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS TEXT) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN ABS(synalog_v) < 1 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15) AS TEXT))) WHEN ABS(synalog_v) < 1e18 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,20)) AS TEXT))) ELSE CAST(CAST(ROUND(CAST(CAST(synalog_v AS TEXT) AS numeric), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS TEXT) AS numeric))) AS TEXT))) AS DECIMAL(38,0)) AS TEXT) END) FROM (SELECT Contractors.contractor_id AS synalog_v) AS synalog_n)) AS party_id,
      Contractors.name AS name,
      'contractor' AS kind
    FROM
      t_2_Contractors AS Contractors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Party_MultBodyAggAux.party_id AS party_id,
  Party_MultBodyAggAux.name AS name,
  Party_MultBodyAggAux.kind AS kind
FROM
  t_0_Party_MultBodyAggAux AS Party_MultBodyAggAux
GROUP BY Party_MultBodyAggAux.party_id, Party_MultBodyAggAux.name, Party_MultBodyAggAux.kind ORDER BY party_id;