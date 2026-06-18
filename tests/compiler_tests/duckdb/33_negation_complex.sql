-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'Alice' AS col1,
      'admin' AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'Bob' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'Charlie' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      4 AS col0,
      'Diana' AS col1,
      'guest' AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      100 AS col1
   UNION ALL
  
    SELECT
      1 AS col0,
      200 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.col0 AS id,
  Users.col1 AS name
FROM
  t_0_Users AS Users
WHERE
  ((SELECT
    MIN((CASE WHEN x_13.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Orders AS Orders, (select unnest([0]::numeric[]) as unnested_pod) as x_13
  WHERE
    (Orders.col0 = Users.col0)) IS NULL) ORDER BY id;