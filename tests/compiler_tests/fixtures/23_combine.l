# Test: Combine expressions

Items(id: 1, tags: ["a", "b"]);
Items(id: 2, tags: ["c"]);
Items(id: 3, tags: ["a", "d", "e"]);

# Combine lists
AllTags() ++= tags :- Items(id:, tags:);

# Combine with condition
FilteredTags() ++= (if Size(tags) > 1 then tags else []) :- Items(id:, tags:);

# Per-group combine
@OrderBy(TagsBySize, "size");
TagsBySize(size: Size(tags), all_tags? ++= tags) distinct :- Items(id:, tags:);

Test(all_tags: AllTags(), filtered: FilteredTags());
