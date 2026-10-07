-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_24_Employees AS (SELECT * FROM (
  
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
t_23_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_24_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_26_Management AS (SELECT * FROM (
  
    SELECT
      1 AS manager_id,
      2 AS employee_id
   UNION ALL
  
    SELECT
      1 AS manager_id,
      5 AS employee_id
   UNION ALL
  
    SELECT
      4 AS manager_id,
      3 AS employee_id
   UNION ALL
  
    SELECT
      2 AS manager_id,
      6 AS employee_id
  
) AS UNUSED_TABLE_NAME  ),
t_21_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_22_Person.person_id AS employee_id
FROM
  t_23_Person AS Person, t_23_Person AS t_22_Person, t_26_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_22_Person.person_id)
GROUP BY Person.person_id, t_22_Person.person_id),
t_18_Chain_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_20_Manages.employee_id AS employee_id,
      t_20_Manages.manager_id AS manager_id
    FROM
      t_21_Manages AS t_20_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_17_Chain_r0 AS (SELECT
  Chain_MultBodyAggAux_recursive_head_f1.employee_id AS employee_id,
  Chain_MultBodyAggAux_recursive_head_f1.manager_id AS manager_id
FROM
  t_18_Chain_MultBodyAggAux_recursive_head_f1 AS Chain_MultBodyAggAux_recursive_head_f1
GROUP BY Chain_MultBodyAggAux_recursive_head_f1.employee_id, Chain_MultBodyAggAux_recursive_head_f1.manager_id),
t_15_Chain_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Chain_r0.employee_id AS employee_id,
      t_16_Manages.manager_id AS manager_id
    FROM
      t_17_Chain_r0 AS Chain_r0, t_21_Manages AS t_16_Manages
    WHERE
      (t_16_Manages.employee_id = Chain_r0.manager_id)
   UNION ALL
  
    SELECT
      t_30_Manages.employee_id AS employee_id,
      t_30_Manages.manager_id AS manager_id
    FROM
      t_21_Manages AS t_30_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_14_Chain_r1 AS (SELECT
  Chain_MultBodyAggAux_recursive_head_f2.employee_id AS employee_id,
  Chain_MultBodyAggAux_recursive_head_f2.manager_id AS manager_id
FROM
  t_15_Chain_MultBodyAggAux_recursive_head_f2 AS Chain_MultBodyAggAux_recursive_head_f2
GROUP BY Chain_MultBodyAggAux_recursive_head_f2.employee_id, Chain_MultBodyAggAux_recursive_head_f2.manager_id),
t_12_Chain_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Chain_r1.employee_id AS employee_id,
      t_13_Manages.manager_id AS manager_id
    FROM
      t_14_Chain_r1 AS Chain_r1, t_21_Manages AS t_13_Manages
    WHERE
      (t_13_Manages.employee_id = Chain_r1.manager_id)
   UNION ALL
  
    SELECT
      t_31_Manages.employee_id AS employee_id,
      t_31_Manages.manager_id AS manager_id
    FROM
      t_21_Manages AS t_31_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_11_Chain_r2 AS (SELECT
  Chain_MultBodyAggAux_recursive_head_f3.employee_id AS employee_id,
  Chain_MultBodyAggAux_recursive_head_f3.manager_id AS manager_id
FROM
  t_12_Chain_MultBodyAggAux_recursive_head_f3 AS Chain_MultBodyAggAux_recursive_head_f3
GROUP BY Chain_MultBodyAggAux_recursive_head_f3.employee_id, Chain_MultBodyAggAux_recursive_head_f3.manager_id),
t_9_Chain_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Chain_r2.employee_id AS employee_id,
      t_10_Manages.manager_id AS manager_id
    FROM
      t_11_Chain_r2 AS Chain_r2, t_21_Manages AS t_10_Manages
    WHERE
      (t_10_Manages.employee_id = Chain_r2.manager_id)
   UNION ALL
  
    SELECT
      t_32_Manages.employee_id AS employee_id,
      t_32_Manages.manager_id AS manager_id
    FROM
      t_21_Manages AS t_32_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_8_Chain_r3 AS (SELECT
  Chain_MultBodyAggAux_recursive_head_f4.employee_id AS employee_id,
  Chain_MultBodyAggAux_recursive_head_f4.manager_id AS manager_id
FROM
  t_9_Chain_MultBodyAggAux_recursive_head_f4 AS Chain_MultBodyAggAux_recursive_head_f4
GROUP BY Chain_MultBodyAggAux_recursive_head_f4.employee_id, Chain_MultBodyAggAux_recursive_head_f4.manager_id),
t_6_Chain_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Chain_r3.employee_id AS employee_id,
      t_7_Manages.manager_id AS manager_id
    FROM
      t_8_Chain_r3 AS Chain_r3, t_21_Manages AS t_7_Manages
    WHERE
      (t_7_Manages.employee_id = Chain_r3.manager_id)
   UNION ALL
  
    SELECT
      t_33_Manages.employee_id AS employee_id,
      t_33_Manages.manager_id AS manager_id
    FROM
      t_21_Manages AS t_33_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_5_Chain_r4 AS (SELECT
  Chain_MultBodyAggAux_recursive_head_f5.employee_id AS employee_id,
  Chain_MultBodyAggAux_recursive_head_f5.manager_id AS manager_id
FROM
  t_6_Chain_MultBodyAggAux_recursive_head_f5 AS Chain_MultBodyAggAux_recursive_head_f5
GROUP BY Chain_MultBodyAggAux_recursive_head_f5.employee_id, Chain_MultBodyAggAux_recursive_head_f5.manager_id),
t_3_Chain_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Chain_r4.employee_id AS employee_id,
      t_4_Manages.manager_id AS manager_id
    FROM
      t_5_Chain_r4 AS Chain_r4, t_21_Manages AS t_4_Manages
    WHERE
      (t_4_Manages.employee_id = Chain_r4.manager_id)
   UNION ALL
  
    SELECT
      t_34_Manages.employee_id AS employee_id,
      t_34_Manages.manager_id AS manager_id
    FROM
      t_21_Manages AS t_34_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_2_Chain_r5 AS (SELECT
  Chain_MultBodyAggAux_recursive_head_f6.employee_id AS employee_id,
  Chain_MultBodyAggAux_recursive_head_f6.manager_id AS manager_id
FROM
  t_3_Chain_MultBodyAggAux_recursive_head_f6 AS Chain_MultBodyAggAux_recursive_head_f6
GROUP BY Chain_MultBodyAggAux_recursive_head_f6.employee_id, Chain_MultBodyAggAux_recursive_head_f6.manager_id),
t_1_Chain_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Chain_r5.employee_id AS employee_id,
      Manages.manager_id AS manager_id
    FROM
      t_2_Chain_r5 AS Chain_r5, t_21_Manages AS Manages
    WHERE
      (Manages.employee_id = Chain_r5.manager_id)
   UNION ALL
  
    SELECT
      t_35_Manages.employee_id AS employee_id,
      t_35_Manages.manager_id AS manager_id
    FROM
      t_21_Manages AS t_35_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Chain AS (SELECT
  Chain_MultBodyAggAux_recursive_head_f7.employee_id AS employee_id,
  Chain_MultBodyAggAux_recursive_head_f7.manager_id AS manager_id
FROM
  t_1_Chain_MultBodyAggAux_recursive_head_f7 AS Chain_MultBodyAggAux_recursive_head_f7
GROUP BY Chain_MultBodyAggAux_recursive_head_f7.employee_id, Chain_MultBodyAggAux_recursive_head_f7.manager_id)
SELECT
  Chain.manager_id AS manager_id
FROM
  t_0_Chain AS Chain
WHERE
  (Chain.employee_id = 4)
GROUP BY Chain.manager_id ORDER BY manager_id;