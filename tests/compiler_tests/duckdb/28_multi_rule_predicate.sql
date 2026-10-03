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
WITH t_1_Number AS (SELECT * FROM (
  
    SELECT
      x_8.unnested_pod AS col0
    FROM
      (select unnest(Range(5)) as unnested_pod) as x_8
   UNION ALL
  
    SELECT
      x_10.unnested_pod AS col0
    FROM
      (select unnest([10, 11, 12, 13, 14]::numeric[]) as unnested_pod) as x_10
  
) AS UNUSED_TABLE_NAME  ),
t_0_Category AS (SELECT * FROM (
  
    SELECT
      Number.col0 AS col0,
      'small' AS col1
    FROM
      t_1_Number AS Number
    WHERE
      (Number.col0 < 5)
   UNION ALL
  
    SELECT
      t_2_Number.col0 AS col0,
      'medium' AS col1
    FROM
      t_1_Number AS t_2_Number
    WHERE
      (t_2_Number.col0 >= 5) AND
      (t_2_Number.col0 < 10)
   UNION ALL
  
    SELECT
      t_3_Number.col0 AS col0,
      'large' AS col1
    FROM
      t_1_Number AS t_3_Number
    WHERE
      (t_3_Number.col0 >= 10)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Category.col0 AS col0,
  Category.col1 AS col1
FROM
  t_0_Category AS Category ORDER BY col0;