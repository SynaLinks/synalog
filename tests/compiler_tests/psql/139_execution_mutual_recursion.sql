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
WITH t_30_Even_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_29_Even_r0 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f1.n AS n
FROM
  t_30_Even_MultBodyAggAux_recursive_head_f1 AS Even_MultBodyAggAux_recursive_head_f1
GROUP BY Even_MultBodyAggAux_recursive_head_f1.n ORDER BY n),
t_28_Odd_recursive_head_f2 AS (SELECT
  ((Even_r0.n) + (1)) AS n
FROM
  t_29_Even_r0 AS Even_r0
WHERE
  (Even_r0.n < 4)
GROUP BY ((Even_r0.n) + (1))),
t_27_Even_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f2.n) + (1)) AS n
    FROM
      t_28_Odd_recursive_head_f2 AS Odd_recursive_head_f2
    WHERE
      (Odd_recursive_head_f2.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_26_Even_r1 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f2.n AS n
FROM
  t_27_Even_MultBodyAggAux_recursive_head_f2 AS Even_MultBodyAggAux_recursive_head_f2
GROUP BY Even_MultBodyAggAux_recursive_head_f2.n ORDER BY n),
t_25_Odd_recursive_head_f3 AS (SELECT
  ((Even_r1.n) + (1)) AS n
FROM
  t_26_Even_r1 AS Even_r1
WHERE
  (Even_r1.n < 4)
GROUP BY ((Even_r1.n) + (1))),
t_24_Even_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f3.n) + (1)) AS n
    FROM
      t_25_Odd_recursive_head_f3 AS Odd_recursive_head_f3
    WHERE
      (Odd_recursive_head_f3.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_23_Even_r2 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f3.n AS n
FROM
  t_24_Even_MultBodyAggAux_recursive_head_f3 AS Even_MultBodyAggAux_recursive_head_f3
GROUP BY Even_MultBodyAggAux_recursive_head_f3.n ORDER BY n),
t_22_Odd_recursive_head_f4 AS (SELECT
  ((Even_r2.n) + (1)) AS n
FROM
  t_23_Even_r2 AS Even_r2
WHERE
  (Even_r2.n < 4)
GROUP BY ((Even_r2.n) + (1))),
t_21_Even_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f4.n) + (1)) AS n
    FROM
      t_22_Odd_recursive_head_f4 AS Odd_recursive_head_f4
    WHERE
      (Odd_recursive_head_f4.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_20_Even_r3 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f4.n AS n
FROM
  t_21_Even_MultBodyAggAux_recursive_head_f4 AS Even_MultBodyAggAux_recursive_head_f4
GROUP BY Even_MultBodyAggAux_recursive_head_f4.n ORDER BY n),
t_19_Odd_recursive_head_f5 AS (SELECT
  ((Even_r3.n) + (1)) AS n
FROM
  t_20_Even_r3 AS Even_r3
WHERE
  (Even_r3.n < 4)
GROUP BY ((Even_r3.n) + (1))),
t_18_Even_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f5.n) + (1)) AS n
    FROM
      t_19_Odd_recursive_head_f5 AS Odd_recursive_head_f5
    WHERE
      (Odd_recursive_head_f5.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_17_Even_r4 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f5.n AS n
FROM
  t_18_Even_MultBodyAggAux_recursive_head_f5 AS Even_MultBodyAggAux_recursive_head_f5
GROUP BY Even_MultBodyAggAux_recursive_head_f5.n ORDER BY n),
t_16_Odd_recursive_head_f6 AS (SELECT
  ((Even_r4.n) + (1)) AS n
FROM
  t_17_Even_r4 AS Even_r4
WHERE
  (Even_r4.n < 4)
GROUP BY ((Even_r4.n) + (1))),
t_15_Even_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f6.n) + (1)) AS n
    FROM
      t_16_Odd_recursive_head_f6 AS Odd_recursive_head_f6
    WHERE
      (Odd_recursive_head_f6.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_14_Even_r5 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f6.n AS n
FROM
  t_15_Even_MultBodyAggAux_recursive_head_f6 AS Even_MultBodyAggAux_recursive_head_f6
GROUP BY Even_MultBodyAggAux_recursive_head_f6.n ORDER BY n),
t_13_Odd_recursive_head_f7 AS (SELECT
  ((Even_r5.n) + (1)) AS n
FROM
  t_14_Even_r5 AS Even_r5
WHERE
  (Even_r5.n < 4)
GROUP BY ((Even_r5.n) + (1))),
t_12_Even_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f7.n) + (1)) AS n
    FROM
      t_13_Odd_recursive_head_f7 AS Odd_recursive_head_f7
    WHERE
      (Odd_recursive_head_f7.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_11_Even_r6 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f7.n AS n
FROM
  t_12_Even_MultBodyAggAux_recursive_head_f7 AS Even_MultBodyAggAux_recursive_head_f7
GROUP BY Even_MultBodyAggAux_recursive_head_f7.n ORDER BY n),
t_10_Odd_recursive_head_f8 AS (SELECT
  ((Even_r6.n) + (1)) AS n
FROM
  t_11_Even_r6 AS Even_r6
WHERE
  (Even_r6.n < 4)
GROUP BY ((Even_r6.n) + (1))),
t_9_Even_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f8.n) + (1)) AS n
    FROM
      t_10_Odd_recursive_head_f8 AS Odd_recursive_head_f8
    WHERE
      (Odd_recursive_head_f8.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_8_Even_r7 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f8.n AS n
FROM
  t_9_Even_MultBodyAggAux_recursive_head_f8 AS Even_MultBodyAggAux_recursive_head_f8
GROUP BY Even_MultBodyAggAux_recursive_head_f8.n ORDER BY n),
t_7_Odd_recursive_head_f9 AS (SELECT
  ((Even_r7.n) + (1)) AS n
FROM
  t_8_Even_r7 AS Even_r7
WHERE
  (Even_r7.n < 4)
GROUP BY ((Even_r7.n) + (1))),
t_6_Even_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f9.n) + (1)) AS n
    FROM
      t_7_Odd_recursive_head_f9 AS Odd_recursive_head_f9
    WHERE
      (Odd_recursive_head_f9.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_Even_r8 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f9.n AS n
FROM
  t_6_Even_MultBodyAggAux_recursive_head_f9 AS Even_MultBodyAggAux_recursive_head_f9
GROUP BY Even_MultBodyAggAux_recursive_head_f9.n ORDER BY n),
t_4_Odd_recursive_head_f10 AS (SELECT
  ((Even_r8.n) + (1)) AS n
FROM
  t_5_Even_r8 AS Even_r8
WHERE
  (Even_r8.n < 4)
GROUP BY ((Even_r8.n) + (1))),
t_3_Even_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f10.n) + (1)) AS n
    FROM
      t_4_Odd_recursive_head_f10 AS Odd_recursive_head_f10
    WHERE
      (Odd_recursive_head_f10.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_2_Even_r9 AS (SELECT
  Even_MultBodyAggAux_recursive_head_f10.n AS n
FROM
  t_3_Even_MultBodyAggAux_recursive_head_f10 AS Even_MultBodyAggAux_recursive_head_f10
GROUP BY Even_MultBodyAggAux_recursive_head_f10.n ORDER BY n),
t_1_Odd_recursive_head_f11 AS (SELECT
  ((Even_r9.n) + (1)) AS n
FROM
  t_2_Even_r9 AS Even_r9
WHERE
  (Even_r9.n < 4)
GROUP BY ((Even_r9.n) + (1))),
t_0_Even_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      ((Odd_recursive_head_f11.n) + (1)) AS n
    FROM
      t_1_Odd_recursive_head_f11 AS Odd_recursive_head_f11
    WHERE
      (Odd_recursive_head_f11.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_recursive_head_f11.n AS n
FROM
  t_0_Even_MultBodyAggAux_recursive_head_f11 AS Even_MultBodyAggAux_recursive_head_f11
GROUP BY Even_MultBodyAggAux_recursive_head_f11.n ORDER BY n;