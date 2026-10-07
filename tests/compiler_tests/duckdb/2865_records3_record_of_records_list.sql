-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord399476892
drop type if exists logicarecord399476892 cascade; create type logicarecord399476892 as struct(n text, v numeric);

-- Logica type: logicarecord208157017
drop type if exists logicarecord208157017 cascade; create type logicarecord208157017 as struct(p logicarecord399476892);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
SELECT
  x_1.unnested_pod.p.n AS n,
  x_1.unnested_pod.p.v AS v
FROM
  (select unnest([{p: {n: 'x', v: 1}}, {p: {n: 'y', v: 2}}]::logicarecord208157017[]) as unnested_pod) as x_1 ORDER BY n;