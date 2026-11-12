-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  CARDINALITY((CASE WHEN 'one--two' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('one--two', '--') END)) AS n,
  ((CASE WHEN 'one--two' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('one--two', '--') END))[0 + 1] AS first,
  ((CASE WHEN 'one--two' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('one--two', '--') END))[((CARDINALITY((CASE WHEN 'one--two' = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY('one--two', '--') END))) - (1)) + 1] AS last;