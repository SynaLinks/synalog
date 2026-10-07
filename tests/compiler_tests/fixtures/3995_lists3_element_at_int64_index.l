# Test: An element at an index made 64-bit. (from tests/programs/lists3/element_at_int64_index.l)

Q(e: Element([10, 20, 30], ToInt64("1")), f: Element(["a", "b"], ToInt64(1.0)), g: Element([1], ToInt64(5)));
