-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

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
      [t_2_Phones.phone] AS phones,
      [] AS emails
    FROM
      t_3_Phones AS t_2_Phones
   UNION ALL
  
    SELECT
      t_4_Emails.person AS person,
      [] AS phones,
      [t_4_Emails.email] AS emails
    FROM
      t_5_Emails AS t_4_Emails
  
) AS UNUSED_TABLE_NAME  ),
t_0_ContactInfo AS (SELECT
  ContactInfo_MultBodyAggAux.person AS person,
  arrayFlatten(groupArray(ContactInfo_MultBodyAggAux.phones)) AS phones,
  arrayFlatten(groupArray(ContactInfo_MultBodyAggAux.emails)) AS emails
FROM
  t_1_ContactInfo_MultBodyAggAux AS ContactInfo_MultBodyAggAux
GROUP BY 1 ORDER BY person)
SELECT
  ContactInfo.person AS person,
  ContactInfo.phones AS phones,
  ContactInfo.emails AS emails
FROM
  t_0_ContactInfo AS ContactInfo ORDER BY person;