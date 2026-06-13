# Test: List/Set/Array aggregations

# Data
Tags("post1", "tech");
Tags("post1", "news");
Tags("post1", "featured");
Tags("post2", "tech");
Tags("post2", "tutorial");
Tags("post3", "news");
Tags("post3", "news");

# Collect all tags per post (List - includes duplicates)
PostTags(post, all_tags? List= tag) distinct :- Tags(post, tag);

# Collect unique tags per post (Set - removes duplicates)
PostUniqueTags(post, unique_tags? Set= tag) distinct :- Tags(post, tag);

# Count tags per post
TagCount(post, count? += 1) distinct :- Tags(post, tag);

# String aggregation
TagString(post, tag_str? StringAgg= tag) distinct :- Tags(post, tag);

@OrderBy(Test, "post");
Test(post:, count:) :- TagCount(post, count:);
