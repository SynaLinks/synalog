-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_10_Employees AS (SELECT * FROM (
  
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
t_9_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_10_Employees AS Employees
GROUP BY Employees.person_id, Employees.name, Employees.url ORDER BY person_id),
t_12_Management AS (SELECT * FROM (
  
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
t_6_Manages AS (SELECT
  t_7_Person.person_id AS manager_id,
  t_8_Person.person_id AS employee_id
FROM
  t_9_Person AS t_7_Person, t_9_Person AS t_8_Person, t_12_Management AS Management
WHERE
  (Management.manager_id = t_7_Person.person_id) AND
  (Management.employee_id = t_8_Person.person_id)
GROUP BY t_7_Person.person_id, t_8_Person.person_id),
t_50_PathTo_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_51_Manages.manager_id AS source,
      t_51_Manages.employee_id AS target,
      ((t_54_Person.name || ' > ') || t_55_Person.name) AS path
    FROM
      t_6_Manages AS t_51_Manages, t_9_Person AS t_54_Person, t_9_Person AS t_55_Person
    WHERE
      (t_51_Manages.manager_id = t_54_Person.person_id) AND
      (t_51_Manages.employee_id = t_55_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_49_PathTo_r0 AS (SELECT
  PathTo_MultBodyAggAux_recursive_head_f1.source AS source,
  PathTo_MultBodyAggAux_recursive_head_f1.target AS target,
  PathTo_MultBodyAggAux_recursive_head_f1.path AS path
FROM
  t_50_PathTo_MultBodyAggAux_recursive_head_f1 AS PathTo_MultBodyAggAux_recursive_head_f1
GROUP BY PathTo_MultBodyAggAux_recursive_head_f1.source, PathTo_MultBodyAggAux_recursive_head_f1.target, PathTo_MultBodyAggAux_recursive_head_f1.path),
t_40_PathTo_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_41_Manages.manager_id AS source,
      t_41_Manages.employee_id AS target,
      ((t_44_Person.name || ' > ') || t_45_Person.name) AS path
    FROM
      t_6_Manages AS t_41_Manages, t_9_Person AS t_44_Person, t_9_Person AS t_45_Person
    WHERE
      (t_41_Manages.manager_id = t_44_Person.person_id) AND
      (t_41_Manages.employee_id = t_45_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_r0.source AS source,
      t_46_Manages.employee_id AS target,
      ((PathTo_r0.path || ' > ') || t_48_Person.name) AS path
    FROM
      t_49_PathTo_r0 AS PathTo_r0, t_6_Manages AS t_46_Manages, t_9_Person AS t_48_Person
    WHERE
      (t_46_Manages.manager_id = PathTo_r0.target) AND
      (t_46_Manages.employee_id = t_48_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_39_PathTo_r1 AS (SELECT
  PathTo_MultBodyAggAux_recursive_head_f2.source AS source,
  PathTo_MultBodyAggAux_recursive_head_f2.target AS target,
  PathTo_MultBodyAggAux_recursive_head_f2.path AS path
FROM
  t_40_PathTo_MultBodyAggAux_recursive_head_f2 AS PathTo_MultBodyAggAux_recursive_head_f2
GROUP BY PathTo_MultBodyAggAux_recursive_head_f2.source, PathTo_MultBodyAggAux_recursive_head_f2.target, PathTo_MultBodyAggAux_recursive_head_f2.path),
t_30_PathTo_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_31_Manages.manager_id AS source,
      t_31_Manages.employee_id AS target,
      ((t_34_Person.name || ' > ') || t_35_Person.name) AS path
    FROM
      t_6_Manages AS t_31_Manages, t_9_Person AS t_34_Person, t_9_Person AS t_35_Person
    WHERE
      (t_31_Manages.manager_id = t_34_Person.person_id) AND
      (t_31_Manages.employee_id = t_35_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_r1.source AS source,
      t_36_Manages.employee_id AS target,
      ((PathTo_r1.path || ' > ') || t_38_Person.name) AS path
    FROM
      t_39_PathTo_r1 AS PathTo_r1, t_6_Manages AS t_36_Manages, t_9_Person AS t_38_Person
    WHERE
      (t_36_Manages.manager_id = PathTo_r1.target) AND
      (t_36_Manages.employee_id = t_38_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_29_PathTo_r2 AS (SELECT
  PathTo_MultBodyAggAux_recursive_head_f3.source AS source,
  PathTo_MultBodyAggAux_recursive_head_f3.target AS target,
  PathTo_MultBodyAggAux_recursive_head_f3.path AS path
FROM
  t_30_PathTo_MultBodyAggAux_recursive_head_f3 AS PathTo_MultBodyAggAux_recursive_head_f3
GROUP BY PathTo_MultBodyAggAux_recursive_head_f3.source, PathTo_MultBodyAggAux_recursive_head_f3.target, PathTo_MultBodyAggAux_recursive_head_f3.path),
t_17_PathTo_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_18_Manages.manager_id AS source,
      t_18_Manages.employee_id AS target,
      ((t_21_Person.name || ' > ') || t_22_Person.name) AS path
    FROM
      t_6_Manages AS t_18_Manages, t_9_Person AS t_21_Person, t_9_Person AS t_22_Person
    WHERE
      (t_18_Manages.manager_id = t_21_Person.person_id) AND
      (t_18_Manages.employee_id = t_22_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_r2.source AS source,
      t_26_Manages.employee_id AS target,
      ((PathTo_r2.path || ' > ') || t_28_Person.name) AS path
    FROM
      t_29_PathTo_r2 AS PathTo_r2, t_6_Manages AS t_26_Manages, t_9_Person AS t_28_Person
    WHERE
      (t_26_Manages.manager_id = PathTo_r2.target) AND
      (t_26_Manages.employee_id = t_28_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_16_PathTo_r3 AS (SELECT
  PathTo_MultBodyAggAux_recursive_head_f4.source AS source,
  PathTo_MultBodyAggAux_recursive_head_f4.target AS target,
  PathTo_MultBodyAggAux_recursive_head_f4.path AS path
FROM
  t_17_PathTo_MultBodyAggAux_recursive_head_f4 AS PathTo_MultBodyAggAux_recursive_head_f4
GROUP BY PathTo_MultBodyAggAux_recursive_head_f4.source, PathTo_MultBodyAggAux_recursive_head_f4.target, PathTo_MultBodyAggAux_recursive_head_f4.path),
t_1_PathTo_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      ((t_4_Person.name || ' > ') || t_5_Person.name) AS path
    FROM
      t_6_Manages AS Manages, t_9_Person AS t_4_Person, t_9_Person AS t_5_Person
    WHERE
      (Manages.manager_id = t_4_Person.person_id) AND
      (Manages.employee_id = t_5_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_r3.source AS source,
      t_13_Manages.employee_id AS target,
      ((PathTo_r3.path || ' > ') || t_15_Person.name) AS path
    FROM
      t_16_PathTo_r3 AS PathTo_r3, t_6_Manages AS t_13_Manages, t_9_Person AS t_15_Person
    WHERE
      (t_13_Manages.manager_id = PathTo_r3.target) AND
      (t_13_Manages.employee_id = t_15_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo AS (SELECT
  PathTo_MultBodyAggAux_recursive_head_f5.source AS source,
  PathTo_MultBodyAggAux_recursive_head_f5.target AS target,
  PathTo_MultBodyAggAux_recursive_head_f5.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_recursive_head_f5 AS PathTo_MultBodyAggAux_recursive_head_f5
GROUP BY PathTo_MultBodyAggAux_recursive_head_f5.source, PathTo_MultBodyAggAux_recursive_head_f5.target, PathTo_MultBodyAggAux_recursive_head_f5.path)
SELECT
  Person.name AS target,
  PathTo.path AS path
FROM
  t_0_PathTo AS PathTo, t_9_Person AS Person
WHERE
  (PathTo.source = 3) AND
  (PathTo.target = Person.person_id)
GROUP BY Person.name, PathTo.path ORDER BY target, path;