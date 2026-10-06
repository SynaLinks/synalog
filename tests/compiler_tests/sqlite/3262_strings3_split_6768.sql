SELECT
  JSON_ARRAY_LENGTH(SPLIT('one--two', '--')) AS n,
  JSON_EXTRACT(SPLIT('one--two', '--'), '$[' || 0 || ']') AS first,
  JSON_EXTRACT(SPLIT('one--two', '--'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('one--two', '--'))) - (1)) || ']') AS last;