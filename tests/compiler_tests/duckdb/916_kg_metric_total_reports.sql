-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_5_Employees AS (SELECT * FROM (
  
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
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_7_Management AS (SELECT * FROM (
  
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
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id IS NOT DISTINCT FROM Person.person_id) AND
  (Management.employee_id IS NOT DISTINCT FROM t_3_Person.person_id)
GROUP BY Person.person_id, t_3_Person.person_id),
t_1_Below_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Manages.manager_id AS manager_id,
        Manages.employee_id AS employee_id,
        0 AS synalog_step
      FROM
        t_2_Manages AS Manages
     UNION ALL
    
      SELECT
        t_10_Manages.manager_id AS manager_id,
        t_8_Manages.employee_id AS employee_id,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_10_Manages, t_2_Manages AS t_8_Manages
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (t_8_Manages.manager_id IS NOT DISTINCT FROM t_10_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_19_Manages.manager_id AS manager_id,
        t_15_Manages.employee_id AS employee_id,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_19_Manages, t_2_Manages AS t_17_Manages, t_2_Manages AS t_15_Manages
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_15_Manages.manager_id IS NOT DISTINCT FROM t_17_Manages.employee_id) AND
        (t_17_Manages.manager_id IS NOT DISTINCT FROM t_19_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_27_Manages.manager_id AS manager_id,
        t_21_Manages.employee_id AS employee_id,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_27_Manages, t_2_Manages AS t_25_Manages, t_2_Manages AS t_23_Manages, t_2_Manages AS t_21_Manages
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_21_Manages.manager_id IS NOT DISTINCT FROM t_23_Manages.employee_id) AND
        (t_23_Manages.manager_id IS NOT DISTINCT FROM t_25_Manages.employee_id) AND
        (t_25_Manages.manager_id IS NOT DISTINCT FROM t_27_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_37_Manages.manager_id AS manager_id,
        t_29_Manages.employee_id AS employee_id,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_37_Manages, t_2_Manages AS t_35_Manages, t_2_Manages AS t_33_Manages, t_2_Manages AS t_31_Manages, t_2_Manages AS t_29_Manages
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_29_Manages.manager_id IS NOT DISTINCT FROM t_31_Manages.employee_id) AND
        (t_31_Manages.manager_id IS NOT DISTINCT FROM t_33_Manages.employee_id) AND
        (t_33_Manages.manager_id IS NOT DISTINCT FROM t_35_Manages.employee_id) AND
        (t_35_Manages.manager_id IS NOT DISTINCT FROM t_37_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_49_Manages.manager_id AS manager_id,
        t_39_Manages.employee_id AS employee_id,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_49_Manages, t_2_Manages AS t_47_Manages, t_2_Manages AS t_45_Manages, t_2_Manages AS t_43_Manages, t_2_Manages AS t_41_Manages, t_2_Manages AS t_39_Manages
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_39_Manages.manager_id IS NOT DISTINCT FROM t_41_Manages.employee_id) AND
        (t_41_Manages.manager_id IS NOT DISTINCT FROM t_43_Manages.employee_id) AND
        (t_43_Manages.manager_id IS NOT DISTINCT FROM t_45_Manages.employee_id) AND
        (t_45_Manages.manager_id IS NOT DISTINCT FROM t_47_Manages.employee_id) AND
        (t_47_Manages.manager_id IS NOT DISTINCT FROM t_49_Manages.employee_id)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_50_Below_RecursiveCte.manager_id AS manager_id,
  t_51_Manages.employee_id AS employee_id,
  ((t_50_Below_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Below_RecursiveCte AS t_50_Below_RecursiveCte, t_2_Manages AS t_51_Manages
WHERE
  (t_50_Below_RecursiveCte.synalog_step < 6) AND
  (t_51_Manages.manager_id IS NOT DISTINCT FROM t_50_Below_RecursiveCte.employee_id)),
t_0_Below AS (SELECT
  Below_RecursiveCte.manager_id AS manager_id,
  Below_RecursiveCte.employee_id AS employee_id
FROM
  t_1_Below_RecursiveCte AS Below_RecursiveCte
GROUP BY Below_RecursiveCte.manager_id, Below_RecursiveCte.employee_id)
SELECT
  Below.manager_id AS manager_id,
  SUM(1) AS n
FROM
  t_0_Below AS Below
GROUP BY Below.manager_id ORDER BY manager_id;