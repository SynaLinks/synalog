-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  list_transform([((0) - (((1) / (3))))], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 1, 1) || substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 3, 14) || repeat('0', CAST(substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), strpos(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 'e') + 1) AS INTEGER) - 14) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM format('{:.{}f}', CAST(synalog_v AS DOUBLE), GREATEST(1, LEAST(15, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)))))) END))[1] AS s;
