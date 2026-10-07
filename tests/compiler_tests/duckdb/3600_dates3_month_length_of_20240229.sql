-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  CASE WHEN (CAST(SUBSTR('2024-02-29', 6, 2) AS BIGINT) = 2) THEN CASE WHEN (((((CAST(SUBSTR('2024-02-29', 1, 4) AS BIGINT)) % NULLIF(4, 0)) = 0) AND (((CAST(SUBSTR('2024-02-29', 1, 4) AS BIGINT)) % NULLIF(100, 0)) != 0)) OR (((CAST(SUBSTR('2024-02-29', 1, 4) AS BIGINT)) % NULLIF(400, 0)) = 0)) THEN 29 ELSE 28 END ELSE (CASE WHEN ((CAST(SUBSTR('2024-02-29', 6, 2) AS BIGINT)) - (1)) < 0 THEN NULL ELSE array_extract([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], CAST(((CAST(SUBSTR('2024-02-29', 6, 2) AS BIGINT)) - (1)) + 1 AS BIGINT)) END) END AS n;