-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_6_Employees AS (SELECT * FROM (
  
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
t_5_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_6_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_8_Management AS (SELECT * FROM (
  
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
t_3_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_4_Person.person_id AS employee_id
FROM
  t_5_Person AS Person, t_5_Person AS t_4_Person, t_8_Management AS Management
WHERE
  (Management.manager_id IS NOT DISTINCT FROM Person.person_id) AND
  (Management.employee_id IS NOT DISTINCT FROM t_4_Person.person_id)
GROUP BY Person.person_id, t_4_Person.person_id),
t_2_Below_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Manages.manager_id AS manager_id,
        Manages.employee_id AS employee_id,
        0 AS synalog_step
      FROM
        t_3_Manages AS Manages
     UNION ALL
    
      SELECT
        t_11_Manages.manager_id AS manager_id,
        t_9_Manages.employee_id AS employee_id,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_11_Manages, t_3_Manages AS t_9_Manages
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (t_9_Manages.manager_id IS NOT DISTINCT FROM t_11_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_20_Manages.manager_id AS manager_id,
        t_16_Manages.employee_id AS employee_id,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_20_Manages, t_3_Manages AS t_18_Manages, t_3_Manages AS t_16_Manages
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_16_Manages.manager_id IS NOT DISTINCT FROM t_18_Manages.employee_id) AND
        (t_18_Manages.manager_id IS NOT DISTINCT FROM t_20_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_28_Manages.manager_id AS manager_id,
        t_22_Manages.employee_id AS employee_id,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_28_Manages, t_3_Manages AS t_26_Manages, t_3_Manages AS t_24_Manages, t_3_Manages AS t_22_Manages
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_22_Manages.manager_id IS NOT DISTINCT FROM t_24_Manages.employee_id) AND
        (t_24_Manages.manager_id IS NOT DISTINCT FROM t_26_Manages.employee_id) AND
        (t_26_Manages.manager_id IS NOT DISTINCT FROM t_28_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_38_Manages.manager_id AS manager_id,
        t_30_Manages.employee_id AS employee_id,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_38_Manages, t_3_Manages AS t_36_Manages, t_3_Manages AS t_34_Manages, t_3_Manages AS t_32_Manages, t_3_Manages AS t_30_Manages
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_30_Manages.manager_id IS NOT DISTINCT FROM t_32_Manages.employee_id) AND
        (t_32_Manages.manager_id IS NOT DISTINCT FROM t_34_Manages.employee_id) AND
        (t_34_Manages.manager_id IS NOT DISTINCT FROM t_36_Manages.employee_id) AND
        (t_36_Manages.manager_id IS NOT DISTINCT FROM t_38_Manages.employee_id)
     UNION ALL
    
      SELECT
        t_50_Manages.manager_id AS manager_id,
        t_40_Manages.employee_id AS employee_id,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_50_Manages, t_3_Manages AS t_48_Manages, t_3_Manages AS t_46_Manages, t_3_Manages AS t_44_Manages, t_3_Manages AS t_42_Manages, t_3_Manages AS t_40_Manages
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_40_Manages.manager_id IS NOT DISTINCT FROM t_42_Manages.employee_id) AND
        (t_42_Manages.manager_id IS NOT DISTINCT FROM t_44_Manages.employee_id) AND
        (t_44_Manages.manager_id IS NOT DISTINCT FROM t_46_Manages.employee_id) AND
        (t_46_Manages.manager_id IS NOT DISTINCT FROM t_48_Manages.employee_id) AND
        (t_48_Manages.manager_id IS NOT DISTINCT FROM t_50_Manages.employee_id)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_51_Below_RecursiveCte.manager_id AS manager_id,
  t_52_Manages.employee_id AS employee_id,
  ((t_51_Below_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Below_RecursiveCte AS t_51_Below_RecursiveCte, t_3_Manages AS t_52_Manages
WHERE
  (t_51_Below_RecursiveCte.synalog_step < 6) AND
  (t_52_Manages.manager_id IS NOT DISTINCT FROM t_51_Below_RecursiveCte.employee_id)),
t_1_Below AS (SELECT
  Below_RecursiveCte.manager_id AS manager_id,
  Below_RecursiveCte.employee_id AS employee_id
FROM
  t_2_Below_RecursiveCte AS Below_RecursiveCte
GROUP BY Below_RecursiveCte.manager_id, Below_RecursiveCte.employee_id),
t_0_Count AS (SELECT
  SUM(1) AS n
FROM
  t_1_Below AS Below
WHERE
  (Below.manager_id = 4))
SELECT
  COALESCE(Count.n, 0) AS n
FROM
  t_0_Count AS Count;