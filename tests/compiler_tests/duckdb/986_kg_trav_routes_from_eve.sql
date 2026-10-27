-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_10_Employees AS (SELECT * FROM (
  
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
  (Management.manager_id IS NOT DISTINCT FROM t_7_Person.person_id) AND
  (Management.employee_id IS NOT DISTINCT FROM t_8_Person.person_id)
GROUP BY t_7_Person.person_id, t_8_Person.person_id),
t_1_PathTo_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Manages.manager_id AS source,
        Manages.employee_id AS target,
        ((((t_4_Person.name) || (' > '))) || (t_5_Person.name)) AS path,
        0 AS synalog_step
      FROM
        t_6_Manages AS Manages, t_9_Person AS t_4_Person, t_9_Person AS t_5_Person
      WHERE
        (Manages.manager_id IS NOT DISTINCT FROM t_4_Person.person_id) AND
        (Manages.employee_id IS NOT DISTINCT FROM t_5_Person.person_id)
     UNION ALL
    
      SELECT
        t_17_Manages.manager_id AS source,
        t_13_Manages.employee_id AS target,
        ((((((((t_20_Person.name) || (' > '))) || (t_21_Person.name))) || (' > '))) || (t_16_Person.name)) AS path,
        ((0) + (1)) AS synalog_step
      FROM
        t_6_Manages AS t_17_Manages, t_9_Person AS t_20_Person, t_9_Person AS t_21_Person, t_6_Manages AS t_13_Manages, t_9_Person AS t_16_Person
      WHERE
        (0 < 4) AND
        (1 = 0) AND
        (t_13_Manages.employee_id IS NOT DISTINCT FROM t_16_Person.person_id) AND
        (t_13_Manages.manager_id IS NOT DISTINCT FROM t_17_Manages.employee_id) AND
        (t_17_Manages.manager_id IS NOT DISTINCT FROM t_20_Person.person_id) AND
        (t_17_Manages.employee_id IS NOT DISTINCT FROM t_21_Person.person_id)
     UNION ALL
    
      SELECT
        t_34_Manages.manager_id AS source,
        t_26_Manages.employee_id AS target,
        ((((((((((((t_37_Person.name) || (' > '))) || (t_38_Person.name))) || (' > '))) || (t_33_Person.name))) || (' > '))) || (t_31_Person.name)) AS path,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_6_Manages AS t_34_Manages, t_9_Person AS t_37_Person, t_9_Person AS t_38_Person, t_6_Manages AS t_29_Manages, t_9_Person AS t_33_Person, t_6_Manages AS t_26_Manages, t_9_Person AS t_31_Person
      WHERE
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_26_Manages.manager_id IS NOT DISTINCT FROM t_29_Manages.employee_id) AND
        (t_26_Manages.employee_id IS NOT DISTINCT FROM t_31_Person.person_id) AND
        (t_29_Manages.employee_id IS NOT DISTINCT FROM t_33_Person.person_id) AND
        (t_29_Manages.manager_id IS NOT DISTINCT FROM t_34_Manages.employee_id) AND
        (t_34_Manages.manager_id IS NOT DISTINCT FROM t_37_Person.person_id) AND
        (t_34_Manages.employee_id IS NOT DISTINCT FROM t_38_Person.person_id)
     UNION ALL
    
      SELECT
        t_52_Manages.manager_id AS source,
        t_40_Manages.employee_id AS target,
        ((((((((((((((((t_55_Person.name) || (' > '))) || (t_56_Person.name))) || (' > '))) || (t_51_Person.name))) || (' > '))) || (t_49_Person.name))) || (' > '))) || (t_45_Person.name)) AS path,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_6_Manages AS t_52_Manages, t_9_Person AS t_55_Person, t_9_Person AS t_56_Person, t_6_Manages AS t_47_Manages, t_9_Person AS t_51_Person, t_6_Manages AS t_43_Manages, t_9_Person AS t_49_Person, t_6_Manages AS t_40_Manages, t_9_Person AS t_45_Person
      WHERE
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_40_Manages.manager_id IS NOT DISTINCT FROM t_43_Manages.employee_id) AND
        (t_40_Manages.employee_id IS NOT DISTINCT FROM t_45_Person.person_id) AND
        (t_43_Manages.manager_id IS NOT DISTINCT FROM t_47_Manages.employee_id) AND
        (t_43_Manages.employee_id IS NOT DISTINCT FROM t_49_Person.person_id) AND
        (t_47_Manages.employee_id IS NOT DISTINCT FROM t_51_Person.person_id) AND
        (t_47_Manages.manager_id IS NOT DISTINCT FROM t_52_Manages.employee_id) AND
        (t_52_Manages.manager_id IS NOT DISTINCT FROM t_55_Person.person_id) AND
        (t_52_Manages.employee_id IS NOT DISTINCT FROM t_56_Person.person_id)
     UNION ALL
    
      SELECT
        t_74_Manages.manager_id AS source,
        t_58_Manages.employee_id AS target,
        ((((((((((((((((((((t_77_Person.name) || (' > '))) || (t_78_Person.name))) || (' > '))) || (t_73_Person.name))) || (' > '))) || (t_71_Person.name))) || (' > '))) || (t_67_Person.name))) || (' > '))) || (t_63_Person.name)) AS path,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_6_Manages AS t_74_Manages, t_9_Person AS t_77_Person, t_9_Person AS t_78_Person, t_6_Manages AS t_69_Manages, t_9_Person AS t_73_Person, t_6_Manages AS t_65_Manages, t_9_Person AS t_71_Person, t_6_Manages AS t_61_Manages, t_9_Person AS t_67_Person, t_6_Manages AS t_58_Manages, t_9_Person AS t_63_Person
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_58_Manages.manager_id IS NOT DISTINCT FROM t_61_Manages.employee_id) AND
        (t_58_Manages.employee_id IS NOT DISTINCT FROM t_63_Person.person_id) AND
        (t_61_Manages.manager_id IS NOT DISTINCT FROM t_65_Manages.employee_id) AND
        (t_61_Manages.employee_id IS NOT DISTINCT FROM t_67_Person.person_id) AND
        (t_65_Manages.manager_id IS NOT DISTINCT FROM t_69_Manages.employee_id) AND
        (t_65_Manages.employee_id IS NOT DISTINCT FROM t_71_Person.person_id) AND
        (t_69_Manages.employee_id IS NOT DISTINCT FROM t_73_Person.person_id) AND
        (t_69_Manages.manager_id IS NOT DISTINCT FROM t_74_Manages.employee_id) AND
        (t_74_Manages.manager_id IS NOT DISTINCT FROM t_77_Person.person_id) AND
        (t_74_Manages.employee_id IS NOT DISTINCT FROM t_78_Person.person_id)
     UNION ALL
    
      SELECT
        t_100_Manages.manager_id AS source,
        t_80_Manages.employee_id AS target,
        ((((((((((((((((((((((((t_103_Person.name) || (' > '))) || (t_104_Person.name))) || (' > '))) || (t_99_Person.name))) || (' > '))) || (t_97_Person.name))) || (' > '))) || (t_93_Person.name))) || (' > '))) || (t_89_Person.name))) || (' > '))) || (t_85_Person.name)) AS path,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_6_Manages AS t_100_Manages, t_9_Person AS t_103_Person, t_9_Person AS t_104_Person, t_6_Manages AS t_95_Manages, t_9_Person AS t_99_Person, t_6_Manages AS t_91_Manages, t_9_Person AS t_97_Person, t_6_Manages AS t_87_Manages, t_9_Person AS t_93_Person, t_6_Manages AS t_83_Manages, t_9_Person AS t_89_Person, t_6_Manages AS t_80_Manages, t_9_Person AS t_85_Person
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_80_Manages.manager_id IS NOT DISTINCT FROM t_83_Manages.employee_id) AND
        (t_80_Manages.employee_id IS NOT DISTINCT FROM t_85_Person.person_id) AND
        (t_83_Manages.manager_id IS NOT DISTINCT FROM t_87_Manages.employee_id) AND
        (t_83_Manages.employee_id IS NOT DISTINCT FROM t_89_Person.person_id) AND
        (t_87_Manages.manager_id IS NOT DISTINCT FROM t_91_Manages.employee_id) AND
        (t_87_Manages.employee_id IS NOT DISTINCT FROM t_93_Person.person_id) AND
        (t_91_Manages.manager_id IS NOT DISTINCT FROM t_95_Manages.employee_id) AND
        (t_91_Manages.employee_id IS NOT DISTINCT FROM t_97_Person.person_id) AND
        (t_95_Manages.employee_id IS NOT DISTINCT FROM t_99_Person.person_id) AND
        (t_95_Manages.manager_id IS NOT DISTINCT FROM t_100_Manages.employee_id) AND
        (t_100_Manages.manager_id IS NOT DISTINCT FROM t_103_Person.person_id) AND
        (t_100_Manages.employee_id IS NOT DISTINCT FROM t_104_Person.person_id)
     UNION ALL
    
      SELECT
        t_130_Manages.manager_id AS source,
        t_106_Manages.employee_id AS target,
        ((((((((((((((((((((((((((((t_133_Person.name) || (' > '))) || (t_134_Person.name))) || (' > '))) || (t_129_Person.name))) || (' > '))) || (t_127_Person.name))) || (' > '))) || (t_123_Person.name))) || (' > '))) || (t_119_Person.name))) || (' > '))) || (t_115_Person.name))) || (' > '))) || (t_111_Person.name)) AS path,
        ((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_6_Manages AS t_130_Manages, t_9_Person AS t_133_Person, t_9_Person AS t_134_Person, t_6_Manages AS t_125_Manages, t_9_Person AS t_129_Person, t_6_Manages AS t_121_Manages, t_9_Person AS t_127_Person, t_6_Manages AS t_117_Manages, t_9_Person AS t_123_Person, t_6_Manages AS t_113_Manages, t_9_Person AS t_119_Person, t_6_Manages AS t_109_Manages, t_9_Person AS t_115_Person, t_6_Manages AS t_106_Manages, t_9_Person AS t_111_Person
      WHERE
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_106_Manages.manager_id IS NOT DISTINCT FROM t_109_Manages.employee_id) AND
        (t_106_Manages.employee_id IS NOT DISTINCT FROM t_111_Person.person_id) AND
        (t_109_Manages.manager_id IS NOT DISTINCT FROM t_113_Manages.employee_id) AND
        (t_109_Manages.employee_id IS NOT DISTINCT FROM t_115_Person.person_id) AND
        (t_113_Manages.manager_id IS NOT DISTINCT FROM t_117_Manages.employee_id) AND
        (t_113_Manages.employee_id IS NOT DISTINCT FROM t_119_Person.person_id) AND
        (t_117_Manages.manager_id IS NOT DISTINCT FROM t_121_Manages.employee_id) AND
        (t_117_Manages.employee_id IS NOT DISTINCT FROM t_123_Person.person_id) AND
        (t_121_Manages.manager_id IS NOT DISTINCT FROM t_125_Manages.employee_id) AND
        (t_121_Manages.employee_id IS NOT DISTINCT FROM t_127_Person.person_id) AND
        (t_125_Manages.employee_id IS NOT DISTINCT FROM t_129_Person.person_id) AND
        (t_125_Manages.manager_id IS NOT DISTINCT FROM t_130_Manages.employee_id) AND
        (t_130_Manages.manager_id IS NOT DISTINCT FROM t_133_Person.person_id) AND
        (t_130_Manages.employee_id IS NOT DISTINCT FROM t_134_Person.person_id)
     UNION ALL
    
      SELECT
        t_164_Manages.manager_id AS source,
        t_136_Manages.employee_id AS target,
        ((((((((((((((((((((((((((((((((t_167_Person.name) || (' > '))) || (t_168_Person.name))) || (' > '))) || (t_163_Person.name))) || (' > '))) || (t_161_Person.name))) || (' > '))) || (t_157_Person.name))) || (' > '))) || (t_153_Person.name))) || (' > '))) || (t_149_Person.name))) || (' > '))) || (t_145_Person.name))) || (' > '))) || (t_141_Person.name)) AS path,
        ((x_717.unnested_pod) + (1)) AS synalog_step
      FROM
        t_6_Manages AS t_164_Manages, t_9_Person AS t_167_Person, t_9_Person AS t_168_Person, t_6_Manages AS t_159_Manages, t_9_Person AS t_163_Person, t_6_Manages AS t_155_Manages, t_9_Person AS t_161_Person, t_6_Manages AS t_151_Manages, t_9_Person AS t_157_Person, t_6_Manages AS t_147_Manages, t_9_Person AS t_153_Person, t_6_Manages AS t_143_Manages, t_9_Person AS t_149_Person, t_6_Manages AS t_139_Manages, t_9_Person AS t_145_Person, t_6_Manages AS t_136_Manages, t_9_Person AS t_141_Person, (select unnest([((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))]) as unnested_pod) as x_717
      WHERE
        (x_717.unnested_pod < 4) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_136_Manages.manager_id IS NOT DISTINCT FROM t_139_Manages.employee_id) AND
        (t_136_Manages.employee_id IS NOT DISTINCT FROM t_141_Person.person_id) AND
        (t_139_Manages.manager_id IS NOT DISTINCT FROM t_143_Manages.employee_id) AND
        (t_139_Manages.employee_id IS NOT DISTINCT FROM t_145_Person.person_id) AND
        (t_143_Manages.manager_id IS NOT DISTINCT FROM t_147_Manages.employee_id) AND
        (t_143_Manages.employee_id IS NOT DISTINCT FROM t_149_Person.person_id) AND
        (t_147_Manages.manager_id IS NOT DISTINCT FROM t_151_Manages.employee_id) AND
        (t_147_Manages.employee_id IS NOT DISTINCT FROM t_153_Person.person_id) AND
        (t_151_Manages.manager_id IS NOT DISTINCT FROM t_155_Manages.employee_id) AND
        (t_151_Manages.employee_id IS NOT DISTINCT FROM t_157_Person.person_id) AND
        (t_155_Manages.manager_id IS NOT DISTINCT FROM t_159_Manages.employee_id) AND
        (t_155_Manages.employee_id IS NOT DISTINCT FROM t_161_Person.person_id) AND
        (t_159_Manages.employee_id IS NOT DISTINCT FROM t_163_Person.person_id) AND
        (t_159_Manages.manager_id IS NOT DISTINCT FROM t_164_Manages.employee_id) AND
        (t_164_Manages.manager_id IS NOT DISTINCT FROM t_167_Person.person_id) AND
        (t_164_Manages.employee_id IS NOT DISTINCT FROM t_168_Person.person_id)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_169_PathTo_RecursiveCte.source AS source,
  t_170_Manages.employee_id AS target,
  ((((t_169_PathTo_RecursiveCte.path) || (' > '))) || (t_172_Person.name)) AS path,
  ((t_169_PathTo_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_PathTo_RecursiveCte AS t_169_PathTo_RecursiveCte, t_6_Manages AS t_170_Manages, t_9_Person AS t_172_Person
WHERE
  (t_169_PathTo_RecursiveCte.synalog_step < 4) AND
  (t_170_Manages.manager_id IS NOT DISTINCT FROM t_169_PathTo_RecursiveCte.target) AND
  (t_170_Manages.employee_id IS NOT DISTINCT FROM t_172_Person.person_id)),
t_0_PathTo AS (SELECT
  PathTo_RecursiveCte.source AS source,
  PathTo_RecursiveCte.target AS target,
  PathTo_RecursiveCte.path AS path
FROM
  t_1_PathTo_RecursiveCte AS PathTo_RecursiveCte
GROUP BY PathTo_RecursiveCte.source, PathTo_RecursiveCte.target, PathTo_RecursiveCte.path)
SELECT
  Person.name AS target,
  PathTo.path AS path
FROM
  t_0_PathTo AS PathTo, t_9_Person AS Person
WHERE
  (PathTo.source = 5) AND
  (PathTo.target IS NOT DISTINCT FROM Person.person_id)
GROUP BY Person.name, PathTo.path ORDER BY target, path;