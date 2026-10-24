-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_0_Loan AS (SELECT * FROM (
  
    SELECT
      'ana' AS member,
      1 AS book,
      '2026-01-03' AS out,
      '2026-01-20' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      4 AS book,
      '2026-02-01' AS out,
      '2026-03-15' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      4 AS book,
      '2026-01-10' AS out,
      '2026-01-12' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      5 AS book,
      '2026-02-11' AS out,
      '2026-02-25' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      6 AS book,
      '2026-03-01' AS out,
      '2026-04-02' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      8 AS book,
      '2026-01-05' AS out,
      '2026-02-28' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      9 AS book,
      '2026-03-01' AS out,
      '2026-03-09' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      10 AS book,
      '2026-03-03' AS out,
      '2026-03-04' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      2 AS book,
      '2026-03-20' AS out,
      '2026-03-30' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      3 AS book,
      '2026-04-01' AS out,
      '2026-04-10' AS back
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_Loan AS Loan
WHERE
  (Loan.member = 'ben');