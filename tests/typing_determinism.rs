//! Column types do not depend on hash order: a predicate whose rules give a
//! column a number and a null is typed as a number every time.
use std::collections::HashMap;

use synalog::compiler::universe::LogicaProgram;

#[test]
fn column_types_are_deterministic() {
    let src = "V(g: null, x: 1);\nV(g: null, x: 2);\nV(g: 1, x: 3);\nN(g:, n? += 1) distinct :- V(g:, x:);\n";
    for _ in 0..16 {
        let parsed = synalog::parser::parse_file(src, None, &[]).unwrap();
        let p = LogicaProgram::new_with_engine(&parsed, HashMap::new(), HashMap::new(), Some("psql")).unwrap();
        let v = &p.predicate_types["V"];
        assert_eq!(format!("{:?}", v["g"]), "Number");
        assert_eq!(format!("{:?}", v["x"]), "Number");
    }
}
