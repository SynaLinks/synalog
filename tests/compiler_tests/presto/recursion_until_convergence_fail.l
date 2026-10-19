# Test: @Recursive(P, -1) runs until nothing changes: synalog executes it, but one SQL script cannot hold it
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Test, -1);
Test(y: 0) distinct;
Test(y:) distinct :- Test(y: x), Next(x:, y:);
