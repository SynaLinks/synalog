-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_3_Phones AS (SELECT * FROM (
  
    SELECT
      'Alice' AS person,
      '555-1234' AS phone
   UNION ALL
  
    SELECT
      'Bob' AS person,
      '555-5678' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_5_Emails AS (SELECT * FROM (
  
    SELECT
      'Bob' AS person,
      'bob@example.com' AS email
   UNION ALL
  
    SELECT
      'Charlie' AS person,
      'charlie@example.com' AS email
  
) AS UNUSED_TABLE_NAME  ),
t_1_ContactInfo_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_Phones.person AS person,
      JSON_ARRAY(t_2_Phones.phone) AS phones,
      JSON_ARRAY() AS emails
    FROM
      t_3_Phones AS t_2_Phones
   UNION ALL
  
    SELECT
      t_4_Emails.person AS person,
      JSON_ARRAY() AS phones,
      JSON_ARRAY(t_4_Emails.email) AS emails
    FROM
      t_5_Emails AS t_4_Emails
  
) AS UNUSED_TABLE_NAME  ),
t_0_ContactInfo AS (SELECT * FROM (
SELECT
  ContactInfo_MultBodyAggAux.person AS person,
  (CASE WHEN COUNT(ContactInfo_MultBodyAggAux.phones) > 0 THEN CAST(CONCAT('[', COALESCE(GROUP_CONCAT(NULLIF(SUBSTR(CAST(ContactInfo_MultBodyAggAux.phones AS CHAR), 2, CHAR_LENGTH(CAST(ContactInfo_MultBodyAggAux.phones AS CHAR)) - 2), '') SEPARATOR ','), ''), ']') AS JSON) END) AS phones,
  (CASE WHEN COUNT(ContactInfo_MultBodyAggAux.emails) > 0 THEN CAST(CONCAT('[', COALESCE(GROUP_CONCAT(NULLIF(SUBSTR(CAST(ContactInfo_MultBodyAggAux.emails AS CHAR), 2, CHAR_LENGTH(CAST(ContactInfo_MultBodyAggAux.emails AS CHAR)) - 2), '') SEPARATOR ','), ''), ']') AS JSON) END) AS emails
FROM
  t_1_ContactInfo_MultBodyAggAux AS ContactInfo_MultBodyAggAux
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY person IS NULL, person)
SELECT * FROM (
SELECT
  ContactInfo.person AS person,
  ContactInfo.phones AS phones,
  ContactInfo.emails AS emails
FROM
  t_0_ContactInfo AS ContactInfo
) AS UNUSED_TABLE_NAME ORDER BY person IS NULL, person;