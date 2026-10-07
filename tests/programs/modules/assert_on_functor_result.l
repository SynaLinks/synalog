# An assertion about a functor applied across an import.
# Expect: holds R.transitive
import lib.graph.Reach;
Local(a: "x", b: "y");
Local(a: "y", b: "z");
Local(a: "z", b: "w");
Local(a: "p", b: "q");
R := Reach(Edge: Local);
@Assert(R, transitive: "∀ a b c, R a b → R b c → R a c");
