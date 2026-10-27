-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_1_Own AS (SELECT * FROM (
  
    SELECT
      'a' AS owner,
      'b' AS owned,
      50 AS percent
   UNION ALL
  
    SELECT
      'b' AS owner,
      'c' AS owned,
      40 AS percent
   UNION ALL
  
    SELECT
      'c' AS owner,
      'a' AS owned,
      10 AS percent
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Own.owner AS owner,
        Own.owned AS entity,
        1 AS hops,
        Own.percent AS stake,
        0 AS synalog_step
      FROM
        t_1_Own AS Own
     UNION ALL
    
      SELECT
        t_4_Own.owner AS owner,
        t_2_Own.owned AS entity,
        ((1) + (1)) AS hops,
        ((t_4_Own.percent) * (((t_2_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((0) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_4_Own, t_1_Own AS t_2_Own
      WHERE
        (0 < 4) AND
        (1 = 0) AND
        (t_2_Own.owner IS NOT DISTINCT FROM t_4_Own.owned)
     UNION ALL
    
      SELECT
        t_10_Own.owner AS owner,
        t_6_Own.owned AS entity,
        ((((1) + (1))) + (1)) AS hops,
        ((((t_10_Own.percent) * (((t_8_Own.percent) / NULLIF(100, 0))))) * (((t_6_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_10_Own, t_1_Own AS t_8_Own, t_1_Own AS t_6_Own
      WHERE
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_6_Own.owner IS NOT DISTINCT FROM t_8_Own.owned) AND
        (t_8_Own.owner IS NOT DISTINCT FROM t_10_Own.owned)
     UNION ALL
    
      SELECT
        t_18_Own.owner AS owner,
        t_12_Own.owned AS entity,
        ((((((1) + (1))) + (1))) + (1)) AS hops,
        ((((((t_18_Own.percent) * (((t_16_Own.percent) / NULLIF(100, 0))))) * (((t_14_Own.percent) / NULLIF(100, 0))))) * (((t_12_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_18_Own, t_1_Own AS t_16_Own, t_1_Own AS t_14_Own, t_1_Own AS t_12_Own
      WHERE
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_12_Own.owner IS NOT DISTINCT FROM t_14_Own.owned) AND
        (t_14_Own.owner IS NOT DISTINCT FROM t_16_Own.owned) AND
        (t_16_Own.owner IS NOT DISTINCT FROM t_18_Own.owned)
     UNION ALL
    
      SELECT
        t_28_Own.owner AS owner,
        t_20_Own.owned AS entity,
        ((((((((1) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((t_28_Own.percent) * (((t_26_Own.percent) / NULLIF(100, 0))))) * (((t_24_Own.percent) / NULLIF(100, 0))))) * (((t_22_Own.percent) / NULLIF(100, 0))))) * (((t_20_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_28_Own, t_1_Own AS t_26_Own, t_1_Own AS t_24_Own, t_1_Own AS t_22_Own, t_1_Own AS t_20_Own
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_20_Own.owner IS NOT DISTINCT FROM t_22_Own.owned) AND
        (t_22_Own.owner IS NOT DISTINCT FROM t_24_Own.owned) AND
        (t_24_Own.owner IS NOT DISTINCT FROM t_26_Own.owned) AND
        (t_26_Own.owner IS NOT DISTINCT FROM t_28_Own.owned)
     UNION ALL
    
      SELECT
        t_40_Own.owner AS owner,
        t_30_Own.owned AS entity,
        ((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((((t_40_Own.percent) * (((t_38_Own.percent) / NULLIF(100, 0))))) * (((t_36_Own.percent) / NULLIF(100, 0))))) * (((t_34_Own.percent) / NULLIF(100, 0))))) * (((t_32_Own.percent) / NULLIF(100, 0))))) * (((t_30_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_40_Own, t_1_Own AS t_38_Own, t_1_Own AS t_36_Own, t_1_Own AS t_34_Own, t_1_Own AS t_32_Own, t_1_Own AS t_30_Own
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_30_Own.owner IS NOT DISTINCT FROM t_32_Own.owned) AND
        (t_32_Own.owner IS NOT DISTINCT FROM t_34_Own.owned) AND
        (t_34_Own.owner IS NOT DISTINCT FROM t_36_Own.owned) AND
        (t_36_Own.owner IS NOT DISTINCT FROM t_38_Own.owned) AND
        (t_38_Own.owner IS NOT DISTINCT FROM t_40_Own.owned)
     UNION ALL
    
      SELECT
        t_54_Own.owner AS owner,
        t_42_Own.owned AS entity,
        ((((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((((((t_54_Own.percent) * (((t_52_Own.percent) / NULLIF(100, 0))))) * (((t_50_Own.percent) / NULLIF(100, 0))))) * (((t_48_Own.percent) / NULLIF(100, 0))))) * (((t_46_Own.percent) / NULLIF(100, 0))))) * (((t_44_Own.percent) / NULLIF(100, 0))))) * (((t_42_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_54_Own, t_1_Own AS t_52_Own, t_1_Own AS t_50_Own, t_1_Own AS t_48_Own, t_1_Own AS t_46_Own, t_1_Own AS t_44_Own, t_1_Own AS t_42_Own
      WHERE
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_42_Own.owner IS NOT DISTINCT FROM t_44_Own.owned) AND
        (t_44_Own.owner IS NOT DISTINCT FROM t_46_Own.owned) AND
        (t_46_Own.owner IS NOT DISTINCT FROM t_48_Own.owned) AND
        (t_48_Own.owner IS NOT DISTINCT FROM t_50_Own.owned) AND
        (t_50_Own.owner IS NOT DISTINCT FROM t_52_Own.owned) AND
        (t_52_Own.owner IS NOT DISTINCT FROM t_54_Own.owned)
     UNION ALL
    
      SELECT
        t_70_Own.owner AS owner,
        t_56_Own.owned AS entity,
        ((((((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((((((((t_70_Own.percent) * (((t_68_Own.percent) / NULLIF(100, 0))))) * (((t_66_Own.percent) / NULLIF(100, 0))))) * (((t_64_Own.percent) / NULLIF(100, 0))))) * (((t_62_Own.percent) / NULLIF(100, 0))))) * (((t_60_Own.percent) / NULLIF(100, 0))))) * (((t_58_Own.percent) / NULLIF(100, 0))))) * (((t_56_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((x_486.unnested_pod) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_70_Own, t_1_Own AS t_68_Own, t_1_Own AS t_66_Own, t_1_Own AS t_64_Own, t_1_Own AS t_62_Own, t_1_Own AS t_60_Own, t_1_Own AS t_58_Own, t_1_Own AS t_56_Own, (select unnest([((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))]) as unnested_pod) as x_486
      WHERE
        (x_486.unnested_pod < 4) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_56_Own.owner IS NOT DISTINCT FROM t_58_Own.owned) AND
        (t_58_Own.owner IS NOT DISTINCT FROM t_60_Own.owned) AND
        (t_60_Own.owner IS NOT DISTINCT FROM t_62_Own.owned) AND
        (t_62_Own.owner IS NOT DISTINCT FROM t_64_Own.owned) AND
        (t_64_Own.owner IS NOT DISTINCT FROM t_66_Own.owned) AND
        (t_66_Own.owner IS NOT DISTINCT FROM t_68_Own.owned) AND
        (t_68_Own.owner IS NOT DISTINCT FROM t_70_Own.owned)
     UNION ALL
    
      SELECT
        t_88_Own.owner AS owner,
        t_72_Own.owned AS entity,
        ((((((((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((((((((((t_88_Own.percent) * (((t_86_Own.percent) / NULLIF(100, 0))))) * (((t_84_Own.percent) / NULLIF(100, 0))))) * (((t_82_Own.percent) / NULLIF(100, 0))))) * (((t_80_Own.percent) / NULLIF(100, 0))))) * (((t_78_Own.percent) / NULLIF(100, 0))))) * (((t_76_Own.percent) / NULLIF(100, 0))))) * (((t_74_Own.percent) / NULLIF(100, 0))))) * (((t_72_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((((x_593.unnested_pod) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_88_Own, t_1_Own AS t_86_Own, t_1_Own AS t_84_Own, t_1_Own AS t_82_Own, t_1_Own AS t_80_Own, t_1_Own AS t_78_Own, t_1_Own AS t_76_Own, t_1_Own AS t_74_Own, t_1_Own AS t_72_Own, (select unnest([((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))]) as unnested_pod) as x_593
      WHERE
        (((x_593.unnested_pod) + (1)) < 4) AND
        (x_593.unnested_pod < 4) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_72_Own.owner IS NOT DISTINCT FROM t_74_Own.owned) AND
        (t_74_Own.owner IS NOT DISTINCT FROM t_76_Own.owned) AND
        (t_76_Own.owner IS NOT DISTINCT FROM t_78_Own.owned) AND
        (t_78_Own.owner IS NOT DISTINCT FROM t_80_Own.owned) AND
        (t_80_Own.owner IS NOT DISTINCT FROM t_82_Own.owned) AND
        (t_82_Own.owner IS NOT DISTINCT FROM t_84_Own.owned) AND
        (t_84_Own.owner IS NOT DISTINCT FROM t_86_Own.owned) AND
        (t_86_Own.owner IS NOT DISTINCT FROM t_88_Own.owned)
     UNION ALL
    
      SELECT
        t_108_Own.owner AS owner,
        t_90_Own.owned AS entity,
        ((((((((((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((((((((((((t_108_Own.percent) * (((t_106_Own.percent) / NULLIF(100, 0))))) * (((t_104_Own.percent) / NULLIF(100, 0))))) * (((t_102_Own.percent) / NULLIF(100, 0))))) * (((t_100_Own.percent) / NULLIF(100, 0))))) * (((t_98_Own.percent) / NULLIF(100, 0))))) * (((t_96_Own.percent) / NULLIF(100, 0))))) * (((t_94_Own.percent) / NULLIF(100, 0))))) * (((t_92_Own.percent) / NULLIF(100, 0))))) * (((t_90_Own.percent) / NULLIF(100, 0)))) AS stake,
        ((((((x_710.unnested_pod) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Own AS t_108_Own, t_1_Own AS t_106_Own, t_1_Own AS t_104_Own, t_1_Own AS t_102_Own, t_1_Own AS t_100_Own, t_1_Own AS t_98_Own, t_1_Own AS t_96_Own, t_1_Own AS t_94_Own, t_1_Own AS t_92_Own, t_1_Own AS t_90_Own, (select unnest([((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))]) as unnested_pod) as x_710
      WHERE
        (((((x_710.unnested_pod) + (1))) + (1)) < 4) AND
        (((x_710.unnested_pod) + (1)) < 4) AND
        (x_710.unnested_pod < 4) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 4) AND
        (((((((0) + (1))) + (1))) + (1)) < 4) AND
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (t_90_Own.owner IS NOT DISTINCT FROM t_92_Own.owned) AND
        (t_92_Own.owner IS NOT DISTINCT FROM t_94_Own.owned) AND
        (t_94_Own.owner IS NOT DISTINCT FROM t_96_Own.owned) AND
        (t_96_Own.owner IS NOT DISTINCT FROM t_98_Own.owned) AND
        (t_98_Own.owner IS NOT DISTINCT FROM t_100_Own.owned) AND
        (t_100_Own.owner IS NOT DISTINCT FROM t_102_Own.owned) AND
        (t_102_Own.owner IS NOT DISTINCT FROM t_104_Own.owned) AND
        (t_104_Own.owner IS NOT DISTINCT FROM t_106_Own.owned) AND
        (t_106_Own.owner IS NOT DISTINCT FROM t_108_Own.owned)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_109_C_RecursiveCte.owner AS owner,
  t_110_Own.owned AS entity,
  ((t_109_C_RecursiveCte.hops) + (1)) AS hops,
  ((t_109_C_RecursiveCte.stake) * (((t_110_Own.percent) / NULLIF(100, 0)))) AS stake,
  ((t_109_C_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_C_RecursiveCte AS t_109_C_RecursiveCte, t_1_Own AS t_110_Own
WHERE
  (t_109_C_RecursiveCte.synalog_step < 4) AND
  (t_110_Own.owner IS NOT DISTINCT FROM t_109_C_RecursiveCte.entity))
SELECT
  C_RecursiveCte.owner AS owner,
  C_RecursiveCte.entity AS entity,
  C_RecursiveCte.hops AS hops,
  C_RecursiveCte.stake AS stake
FROM
  t_0_C_RecursiveCte AS C_RecursiveCte
GROUP BY C_RecursiveCte.owner, C_RecursiveCte.entity, C_RecursiveCte.hops, C_RecursiveCte.stake ORDER BY hops, owner, entity;