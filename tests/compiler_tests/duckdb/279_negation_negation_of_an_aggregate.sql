-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      1 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_K AS (SELECT
  R.k AS k
FROM
  t_2_R AS R
GROUP BY R.k),
t_3_Loud AS (SELECT
  t_4_R.k AS k
FROM
  t_2_R AS t_4_R
WHERE
  (t_4_R.v > 5)
GROUP BY t_4_R.k)
SELECT
  t_0_K.k AS k
FROM
  t_1_K AS t_0_K
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_Loud AS Loud, (select unnest([0]) as unnested_pod) as x_6
  WHERE
    (Loud.k = t_0_K.k)) IS NULL) ORDER BY k;