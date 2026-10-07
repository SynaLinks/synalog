SELECT
  JSON_ARRAY_LENGTH(SPLIT('one--two', '--')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('one--two', '--'), '$[' || 0 || ']') END) AS first,
  (CASE WHEN ((JSON_ARRAY_LENGTH(SPLIT('one--two', '--'))) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('one--two', '--'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('one--two', '--'))) - (1)) || ']') END) AS last;