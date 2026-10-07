-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_I AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      3 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'ink' AS item,
      CAST(7.0 AS double precision) AS price,
      1 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      2 AS "order",
      'ann' AS customer,
      'pad' AS item,
      CAST(4.0 AS double precision) AS price,
      2 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      10 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'cap' AS item,
      CAST(1.25 AS double precision) AS price,
      4 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'ink' AS item,
      CAST(7.0 AS double precision) AS price,
      2 AS qty,
      3 AS pos
   UNION ALL
  
    SELECT
      4 AS "order",
      'cid' AS customer,
      'pad' AS item,
      CAST(4.0 AS double precision) AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      2 AS qty,
      2 AS pos
  
) AS UNUSED_TABLE_NAME  ),
t_3_T AS (SELECT
  t_5_I.pos AS pos,
  SUM(x_13) AS t
FROM
  t_2_I AS t_5_I, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, t_5_I.qty - 1) as x), '{}')) as x_13
WHERE
  (t_5_I."order" = 5)
GROUP BY t_5_I.pos)
SELECT
  t_1_T.pos AS pos,
  CARDINALITY(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, I.qty - 1) as x), '{}')) AS n,
  t_1_T.t AS t
FROM
  t_2_I AS I, t_3_T AS t_1_T
WHERE
  (I.pos = t_1_T.pos) AND
  (I."order" = 5) ORDER BY pos, n, t;