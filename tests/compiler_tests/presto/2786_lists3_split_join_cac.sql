SELECT
  CARDINALITY(SPLIT(',a,', ',')) AS n,
  ARRAY_JOIN(SPLIT(',a,', ','), ',') AS s;