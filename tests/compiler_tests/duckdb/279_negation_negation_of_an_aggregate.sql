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
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      1 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_K AS (SELECT
  R.k AS k
FROM
  t_1_R AS R
GROUP BY R.k),
t_2_Loud AS (SELECT
  t_3_R.k AS k
FROM
  t_1_R AS t_3_R
WHERE
  (t_3_R.v > 5)
GROUP BY t_3_R.k)
SELECT
  K.k AS k
FROM
  t_0_K AS K
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_Loud AS Loud, (select unnest([0]::numeric[]) as unnested_pod) as x_6
  WHERE
    (Loud.k = K.k)) IS NULL) ORDER BY k;