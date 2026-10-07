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
WITH t_21_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_18_Need_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_20_Uses.part AS part,
      t_20_Uses.component AS component,
      t_20_Uses.component AS path_id,
      t_20_Uses.qty AS n
    FROM
      t_21_Uses AS t_20_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_17_Need_r0 AS (SELECT
  Need_MultBodyAggAux_recursive_head_f1.part AS part,
  Need_MultBodyAggAux_recursive_head_f1.component AS component,
  Need_MultBodyAggAux_recursive_head_f1.path_id AS path_id,
  Need_MultBodyAggAux_recursive_head_f1.n AS n
FROM
  t_18_Need_MultBodyAggAux_recursive_head_f1 AS Need_MultBodyAggAux_recursive_head_f1
GROUP BY Need_MultBodyAggAux_recursive_head_f1.part, Need_MultBodyAggAux_recursive_head_f1.component, Need_MultBodyAggAux_recursive_head_f1.path_id, Need_MultBodyAggAux_recursive_head_f1.n),
t_15_Need_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Need_r0.part AS part,
      t_16_Uses.component AS component,
      ((Need_r0.path_id || '/') || t_16_Uses.component) AS path_id,
      ((Need_r0.n) * (t_16_Uses.qty)) AS n
    FROM
      t_17_Need_r0 AS Need_r0, t_21_Uses AS t_16_Uses
    WHERE
      (t_16_Uses.part = Need_r0.component)
   UNION ALL
  
    SELECT
      t_22_Uses.part AS part,
      t_22_Uses.component AS component,
      t_22_Uses.component AS path_id,
      t_22_Uses.qty AS n
    FROM
      t_21_Uses AS t_22_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_14_Need_r1 AS (SELECT
  Need_MultBodyAggAux_recursive_head_f2.part AS part,
  Need_MultBodyAggAux_recursive_head_f2.component AS component,
  Need_MultBodyAggAux_recursive_head_f2.path_id AS path_id,
  Need_MultBodyAggAux_recursive_head_f2.n AS n
FROM
  t_15_Need_MultBodyAggAux_recursive_head_f2 AS Need_MultBodyAggAux_recursive_head_f2
GROUP BY Need_MultBodyAggAux_recursive_head_f2.part, Need_MultBodyAggAux_recursive_head_f2.component, Need_MultBodyAggAux_recursive_head_f2.path_id, Need_MultBodyAggAux_recursive_head_f2.n),
t_12_Need_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Need_r1.part AS part,
      t_13_Uses.component AS component,
      ((Need_r1.path_id || '/') || t_13_Uses.component) AS path_id,
      ((Need_r1.n) * (t_13_Uses.qty)) AS n
    FROM
      t_14_Need_r1 AS Need_r1, t_21_Uses AS t_13_Uses
    WHERE
      (t_13_Uses.part = Need_r1.component)
   UNION ALL
  
    SELECT
      t_23_Uses.part AS part,
      t_23_Uses.component AS component,
      t_23_Uses.component AS path_id,
      t_23_Uses.qty AS n
    FROM
      t_21_Uses AS t_23_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_11_Need_r2 AS (SELECT
  Need_MultBodyAggAux_recursive_head_f3.part AS part,
  Need_MultBodyAggAux_recursive_head_f3.component AS component,
  Need_MultBodyAggAux_recursive_head_f3.path_id AS path_id,
  Need_MultBodyAggAux_recursive_head_f3.n AS n
FROM
  t_12_Need_MultBodyAggAux_recursive_head_f3 AS Need_MultBodyAggAux_recursive_head_f3
GROUP BY Need_MultBodyAggAux_recursive_head_f3.part, Need_MultBodyAggAux_recursive_head_f3.component, Need_MultBodyAggAux_recursive_head_f3.path_id, Need_MultBodyAggAux_recursive_head_f3.n),
t_9_Need_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Need_r2.part AS part,
      t_10_Uses.component AS component,
      ((Need_r2.path_id || '/') || t_10_Uses.component) AS path_id,
      ((Need_r2.n) * (t_10_Uses.qty)) AS n
    FROM
      t_11_Need_r2 AS Need_r2, t_21_Uses AS t_10_Uses
    WHERE
      (t_10_Uses.part = Need_r2.component)
   UNION ALL
  
    SELECT
      t_24_Uses.part AS part,
      t_24_Uses.component AS component,
      t_24_Uses.component AS path_id,
      t_24_Uses.qty AS n
    FROM
      t_21_Uses AS t_24_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_8_Need_r3 AS (SELECT
  Need_MultBodyAggAux_recursive_head_f4.part AS part,
  Need_MultBodyAggAux_recursive_head_f4.component AS component,
  Need_MultBodyAggAux_recursive_head_f4.path_id AS path_id,
  Need_MultBodyAggAux_recursive_head_f4.n AS n
FROM
  t_9_Need_MultBodyAggAux_recursive_head_f4 AS Need_MultBodyAggAux_recursive_head_f4
GROUP BY Need_MultBodyAggAux_recursive_head_f4.part, Need_MultBodyAggAux_recursive_head_f4.component, Need_MultBodyAggAux_recursive_head_f4.path_id, Need_MultBodyAggAux_recursive_head_f4.n),
t_6_Need_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Need_r3.part AS part,
      t_7_Uses.component AS component,
      ((Need_r3.path_id || '/') || t_7_Uses.component) AS path_id,
      ((Need_r3.n) * (t_7_Uses.qty)) AS n
    FROM
      t_8_Need_r3 AS Need_r3, t_21_Uses AS t_7_Uses
    WHERE
      (t_7_Uses.part = Need_r3.component)
   UNION ALL
  
    SELECT
      t_25_Uses.part AS part,
      t_25_Uses.component AS component,
      t_25_Uses.component AS path_id,
      t_25_Uses.qty AS n
    FROM
      t_21_Uses AS t_25_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_5_Need_r4 AS (SELECT
  Need_MultBodyAggAux_recursive_head_f5.part AS part,
  Need_MultBodyAggAux_recursive_head_f5.component AS component,
  Need_MultBodyAggAux_recursive_head_f5.path_id AS path_id,
  Need_MultBodyAggAux_recursive_head_f5.n AS n
FROM
  t_6_Need_MultBodyAggAux_recursive_head_f5 AS Need_MultBodyAggAux_recursive_head_f5
GROUP BY Need_MultBodyAggAux_recursive_head_f5.part, Need_MultBodyAggAux_recursive_head_f5.component, Need_MultBodyAggAux_recursive_head_f5.path_id, Need_MultBodyAggAux_recursive_head_f5.n),
t_3_Need_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Need_r4.part AS part,
      t_4_Uses.component AS component,
      ((Need_r4.path_id || '/') || t_4_Uses.component) AS path_id,
      ((Need_r4.n) * (t_4_Uses.qty)) AS n
    FROM
      t_5_Need_r4 AS Need_r4, t_21_Uses AS t_4_Uses
    WHERE
      (t_4_Uses.part = Need_r4.component)
   UNION ALL
  
    SELECT
      t_26_Uses.part AS part,
      t_26_Uses.component AS component,
      t_26_Uses.component AS path_id,
      t_26_Uses.qty AS n
    FROM
      t_21_Uses AS t_26_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_2_Need_r5 AS (SELECT
  Need_MultBodyAggAux_recursive_head_f6.part AS part,
  Need_MultBodyAggAux_recursive_head_f6.component AS component,
  Need_MultBodyAggAux_recursive_head_f6.path_id AS path_id,
  Need_MultBodyAggAux_recursive_head_f6.n AS n
FROM
  t_3_Need_MultBodyAggAux_recursive_head_f6 AS Need_MultBodyAggAux_recursive_head_f6
GROUP BY Need_MultBodyAggAux_recursive_head_f6.part, Need_MultBodyAggAux_recursive_head_f6.component, Need_MultBodyAggAux_recursive_head_f6.path_id, Need_MultBodyAggAux_recursive_head_f6.n),
t_1_Need_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Need_r5.part AS part,
      Uses.component AS component,
      ((Need_r5.path_id || '/') || Uses.component) AS path_id,
      ((Need_r5.n) * (Uses.qty)) AS n
    FROM
      t_2_Need_r5 AS Need_r5, t_21_Uses AS Uses
    WHERE
      (Uses.part = Need_r5.component)
   UNION ALL
  
    SELECT
      t_27_Uses.part AS part,
      t_27_Uses.component AS component,
      t_27_Uses.component AS path_id,
      t_27_Uses.qty AS n
    FROM
      t_21_Uses AS t_27_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need AS (SELECT
  Need_MultBodyAggAux_recursive_head_f7.part AS part,
  Need_MultBodyAggAux_recursive_head_f7.component AS component,
  Need_MultBodyAggAux_recursive_head_f7.path_id AS path_id,
  Need_MultBodyAggAux_recursive_head_f7.n AS n
FROM
  t_1_Need_MultBodyAggAux_recursive_head_f7 AS Need_MultBodyAggAux_recursive_head_f7
GROUP BY Need_MultBodyAggAux_recursive_head_f7.part, Need_MultBodyAggAux_recursive_head_f7.component, Need_MultBodyAggAux_recursive_head_f7.path_id, Need_MultBodyAggAux_recursive_head_f7.n)
SELECT
  SUM(Need.n) AS q
FROM
  t_0_Need AS Need
WHERE
  (Need.part = 'bike') AND
  (Need.component = 'spoke');