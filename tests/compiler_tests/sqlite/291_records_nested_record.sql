SELECT
  JSON_EXTRACT(JSON_OBJECT('inner', 'deep'), "$.inner") AS v;