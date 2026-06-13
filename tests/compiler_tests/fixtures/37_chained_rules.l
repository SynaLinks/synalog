# Test: Chained rules with dependencies

Raw(v: 1);
Raw(v: 2);
Raw(v: 3);
Raw(v: 4);
Raw(v: 5);

# Chain 1: double
Step1(v:, doubled: v * 2) :- Raw(v:);

# Chain 2: add 10
Step2(v:, doubled:, plus_ten: doubled + 10) :- Step1(v:, doubled:);

# Chain 3: filter
Step3(v:, doubled:, plus_ten:) :- Step2(v:, doubled:, plus_ten:), v > 2;

@OrderBy(Test, "v");
Test(v:, doubled:, plus_ten:) :- Step3(v:, doubled:, plus_ten:);
