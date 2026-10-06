SELECT
  JSON_ARRAY_LENGTH(SPLIT('a+b+c', '+')) AS n,
  JSON_EXTRACT(SPLIT('a+b+c', '+'), '$[' || 0 || ']') AS first,
  JSON_EXTRACT(SPLIT('a+b+c', '+'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT('a+b+c', '+'))) - (1)) || ']') AS last;