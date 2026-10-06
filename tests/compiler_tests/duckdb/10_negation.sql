-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Prime AS (SELECT * FROM (
  
    SELECT
      2 AS col0
   UNION ALL
  
    SELECT
      3 AS col0
   UNION ALL
  
    SELECT
      5 AS col0
   UNION ALL
  
    SELECT
      7 AS col0
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      'odd' AS test_name,
      x_5.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      ((SELECT
        MIN((CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        (select unnest(Range(10)) as unnested_pod) as x_12, (select unnest([0]) as unnested_pod) as x_8
      WHERE
        (((x_5.unnested_pod) % NULLIF(2, 0)) = 0) AND
        (x_5.unnested_pod = x_12.unnested_pod)) IS NULL)
   UNION ALL
  
    SELECT
      'not_prime' AS test_name,
      x_5.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      (x_5.unnested_pod > 1) AND
      ((SELECT
        MIN((CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_0_Prime AS Prime, (select unnest([0]) as unnested_pod) as x_8
      WHERE
        (Prime.col0 = x_5.unnested_pod)) IS NULL)
   UNION ALL
  
    SELECT
      'even_not_prime' AS test_name,
      x_7.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_7
    WHERE
      ((SELECT
        MIN((CASE WHEN x_10.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_0_Prime AS Prime, (select unnest([0]) as unnested_pod) as x_10
      WHERE
        (Prime.col0 = x_7.unnested_pod)) IS NULL) AND
      (((x_7.unnested_pod) % NULLIF(2, 0)) = 0)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;