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
WITH t_27_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_24_Under_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_26_Manages.boss AS boss,
      t_26_Manages.report AS report
    FROM
      t_27_Manages AS t_26_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_23_Under_r0 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f1.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f1.report AS report
FROM
  t_24_Under_MultBodyAggAux_recursive_head_f1 AS Under_MultBodyAggAux_recursive_head_f1
GROUP BY Under_MultBodyAggAux_recursive_head_f1.boss, Under_MultBodyAggAux_recursive_head_f1.report),
t_21_Under_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Under_r0.boss AS boss,
      t_22_Manages.report AS report
    FROM
      t_23_Under_r0 AS Under_r0, t_27_Manages AS t_22_Manages
    WHERE
      (t_22_Manages.boss = Under_r0.report)
   UNION ALL
  
    SELECT
      t_28_Manages.boss AS boss,
      t_28_Manages.report AS report
    FROM
      t_27_Manages AS t_28_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_20_Under_r1 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f2.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f2.report AS report
FROM
  t_21_Under_MultBodyAggAux_recursive_head_f2 AS Under_MultBodyAggAux_recursive_head_f2
GROUP BY Under_MultBodyAggAux_recursive_head_f2.boss, Under_MultBodyAggAux_recursive_head_f2.report),
t_18_Under_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Under_r1.boss AS boss,
      t_19_Manages.report AS report
    FROM
      t_20_Under_r1 AS Under_r1, t_27_Manages AS t_19_Manages
    WHERE
      (t_19_Manages.boss = Under_r1.report)
   UNION ALL
  
    SELECT
      t_29_Manages.boss AS boss,
      t_29_Manages.report AS report
    FROM
      t_27_Manages AS t_29_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_17_Under_r2 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f3.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f3.report AS report
FROM
  t_18_Under_MultBodyAggAux_recursive_head_f3 AS Under_MultBodyAggAux_recursive_head_f3
GROUP BY Under_MultBodyAggAux_recursive_head_f3.boss, Under_MultBodyAggAux_recursive_head_f3.report),
t_15_Under_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Under_r2.boss AS boss,
      t_16_Manages.report AS report
    FROM
      t_17_Under_r2 AS Under_r2, t_27_Manages AS t_16_Manages
    WHERE
      (t_16_Manages.boss = Under_r2.report)
   UNION ALL
  
    SELECT
      t_30_Manages.boss AS boss,
      t_30_Manages.report AS report
    FROM
      t_27_Manages AS t_30_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_14_Under_r3 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f4.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f4.report AS report
FROM
  t_15_Under_MultBodyAggAux_recursive_head_f4 AS Under_MultBodyAggAux_recursive_head_f4
GROUP BY Under_MultBodyAggAux_recursive_head_f4.boss, Under_MultBodyAggAux_recursive_head_f4.report),
t_12_Under_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Under_r3.boss AS boss,
      t_13_Manages.report AS report
    FROM
      t_14_Under_r3 AS Under_r3, t_27_Manages AS t_13_Manages
    WHERE
      (t_13_Manages.boss = Under_r3.report)
   UNION ALL
  
    SELECT
      t_31_Manages.boss AS boss,
      t_31_Manages.report AS report
    FROM
      t_27_Manages AS t_31_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_11_Under_r4 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f5.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f5.report AS report
FROM
  t_12_Under_MultBodyAggAux_recursive_head_f5 AS Under_MultBodyAggAux_recursive_head_f5
GROUP BY Under_MultBodyAggAux_recursive_head_f5.boss, Under_MultBodyAggAux_recursive_head_f5.report),
t_9_Under_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Under_r4.boss AS boss,
      t_10_Manages.report AS report
    FROM
      t_11_Under_r4 AS Under_r4, t_27_Manages AS t_10_Manages
    WHERE
      (t_10_Manages.boss = Under_r4.report)
   UNION ALL
  
    SELECT
      t_32_Manages.boss AS boss,
      t_32_Manages.report AS report
    FROM
      t_27_Manages AS t_32_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_8_Under_r5 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f6.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f6.report AS report
FROM
  t_9_Under_MultBodyAggAux_recursive_head_f6 AS Under_MultBodyAggAux_recursive_head_f6
GROUP BY Under_MultBodyAggAux_recursive_head_f6.boss, Under_MultBodyAggAux_recursive_head_f6.report),
t_6_Under_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Under_r5.boss AS boss,
      t_7_Manages.report AS report
    FROM
      t_8_Under_r5 AS Under_r5, t_27_Manages AS t_7_Manages
    WHERE
      (t_7_Manages.boss = Under_r5.report)
   UNION ALL
  
    SELECT
      t_33_Manages.boss AS boss,
      t_33_Manages.report AS report
    FROM
      t_27_Manages AS t_33_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_5_Under_r6 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f7.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f7.report AS report
FROM
  t_6_Under_MultBodyAggAux_recursive_head_f7 AS Under_MultBodyAggAux_recursive_head_f7
GROUP BY Under_MultBodyAggAux_recursive_head_f7.boss, Under_MultBodyAggAux_recursive_head_f7.report),
t_3_Under_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      Under_r6.boss AS boss,
      t_4_Manages.report AS report
    FROM
      t_5_Under_r6 AS Under_r6, t_27_Manages AS t_4_Manages
    WHERE
      (t_4_Manages.boss = Under_r6.report)
   UNION ALL
  
    SELECT
      t_34_Manages.boss AS boss,
      t_34_Manages.report AS report
    FROM
      t_27_Manages AS t_34_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_2_Under_r7 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f8.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f8.report AS report
FROM
  t_3_Under_MultBodyAggAux_recursive_head_f8 AS Under_MultBodyAggAux_recursive_head_f8
GROUP BY Under_MultBodyAggAux_recursive_head_f8.boss, Under_MultBodyAggAux_recursive_head_f8.report),
t_1_Under_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      Under_r7.boss AS boss,
      Manages.report AS report
    FROM
      t_2_Under_r7 AS Under_r7, t_27_Manages AS Manages
    WHERE
      (Manages.boss = Under_r7.report)
   UNION ALL
  
    SELECT
      t_35_Manages.boss AS boss,
      t_35_Manages.report AS report
    FROM
      t_27_Manages AS t_35_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under AS (SELECT
  Under_MultBodyAggAux_recursive_head_f9.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f9.report AS report
FROM
  t_1_Under_MultBodyAggAux_recursive_head_f9 AS Under_MultBodyAggAux_recursive_head_f9
GROUP BY Under_MultBodyAggAux_recursive_head_f9.boss, Under_MultBodyAggAux_recursive_head_f9.report)
SELECT
  Under.boss AS boss
FROM
  t_0_Under AS Under
WHERE
  (Under.report = 'dev2') ORDER BY boss;