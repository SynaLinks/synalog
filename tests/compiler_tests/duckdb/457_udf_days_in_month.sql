-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN ((((2024) % NULLIF(4, 0)) = 0) AND ((((2024) % NULLIF(100, 0)) != 0) OR (((2024) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS a,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN ((((2023) % NULLIF(4, 0)) = 0) AND ((((2023) % NULLIF(100, 0)) != 0) OR (((2023) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS b,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN ((((2000) % NULLIF(4, 0)) = 0) AND ((((2000) % NULLIF(100, 0)) != 0) OR (((2000) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS c,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN ((((1900) % NULLIF(4, 0)) = 0) AND ((((1900) % NULLIF(100, 0)) != 0) OR (((1900) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS d,
  CASE WHEN (4 = 2) THEN ((28) + (CASE WHEN ((((2023) % NULLIF(4, 0)) = 0) AND ((((2023) % NULLIF(100, 0)) != 0) OR (((2023) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((4 = 4) OR (4 = 6)) OR (4 = 9)) OR (4 = 11)) THEN 30 ELSE 31 END AS e,
  CASE WHEN (12 = 2) THEN ((28) + (CASE WHEN ((((2023) % NULLIF(4, 0)) = 0) AND ((((2023) % NULLIF(100, 0)) != 0) OR (((2023) % NULLIF(400, 0)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((12 = 4) OR (12 = 6)) OR (12 = 9)) OR (12 = 11)) THEN 30 ELSE 31 END AS f;