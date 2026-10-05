WITH t_1_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      "ann" AS name,
      "eng" AS dept,
      10 AS team_id,
      "active" AS status,
      "https://x/ann" AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      "bob" AS name,
      "eng" AS dept,
      10 AS team_id,
      "active" AS status,
      "https://x/bob" AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      "cid" AS name,
      "ops" AS dept,
      20 AS team_id,
      "inactive" AS status,
      "https://x/cid" AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      "dan" AS name,
      "ops" AS dept,
      20 AS team_id,
      "active" AS status,
      "https://x/dan" AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      "eve" AS name,
      "eng" AS dept,
      30 AS team_id,
      "active" AS status,
      "https://x/eve" AS url
  
) AS UNUSED_TABLE_NAME  ),
t_2_Contractors AS (SELECT * FROM (
  
    SELECT
      1 AS contractor_id,
      "zoe" AS name
   UNION ALL
  
    SELECT
      2 AS contractor_id,
      "yan" AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_Party_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      ("employee:" || (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) ELSE CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) END) FROM UNNEST([Employees.person_id]) AS synalog_v)) AS party_id,
      Employees.name AS name,
      "employee" AS kind
    FROM
      t_1_Employees AS Employees
   UNION ALL
  
    SELECT
      ("contractor:" || (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) ELSE CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) END) FROM UNNEST([Contractors.contractor_id]) AS synalog_v)) AS party_id,
      Contractors.name AS name,
      "contractor" AS kind
    FROM
      t_2_Contractors AS Contractors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Party_MultBodyAggAux.party_id AS party_id,
  Party_MultBodyAggAux.name AS name,
  Party_MultBodyAggAux.kind AS kind
FROM
  t_0_Party_MultBodyAggAux AS Party_MultBodyAggAux
GROUP BY party_id, name, kind ORDER BY party_id NULLS LAST;
