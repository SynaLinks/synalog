-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_Order AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS who,
      'tea' AS item,
      3 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS who,
      'cake' AS item,
      1 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      3 AS id,
      'ann' AS who,
      'cake' AS item,
      2 AS n,
      'refunded' AS state
   UNION ALL
  
    SELECT
      4 AS id,
      'cy' AS who,
      'tea' AS item,
      5 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      5 AS id,
      'dee' AS who,
      'coffee' AS item,
      2 AS n,
      'pending' AS state
   UNION ALL
  
    SELECT
      6 AS id,
      'bob' AS who,
      'tea' AS item,
      1 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      7 AS id,
      'cy' AS who,
      'coffee' AS item,
      4 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      8 AS id,
      'ann' AS who,
      'coffee' AS item,
      1 AS n,
      'pending' AS state
   UNION ALL
  
    SELECT
      9 AS id,
      'eve' AS who,
      'cake' AS item,
      6 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      10 AS id,
      'eve' AS who,
      'tea' AS item,
      2 AS n,
      'refunded' AS state
  
) AS UNUSED_TABLE_NAME  ),
t_2_Any_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_Order.id AS id,
      t_3_Order.who AS who
    FROM
      t_4_Order AS t_3_Order
    WHERE
      (t_3_Order.state = 'paid')
   UNION ALL
  
    SELECT
      t_5_Order.id AS id,
      t_5_Order.who AS who
    FROM
      t_4_Order AS t_5_Order
    WHERE
      (t_5_Order.state != 'paid')
  
) AS UNUSED_TABLE_NAME  ),
t_1_Any AS (SELECT
  Any_MultBodyAggAux.id AS id,
  Any_MultBodyAggAux.who AS who
FROM
  t_2_Any_MultBodyAggAux AS Any_MultBodyAggAux
GROUP BY Any_MultBodyAggAux.id, Any_MultBodyAggAux.who)
SELECT
  SUM(1) AS n
FROM
  t_1_Any AS t_0_Any
WHERE
  (t_0_Any.who = 'ann');
