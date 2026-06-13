//! Type inference system for Logica.
//!
//! This module provides type inference capabilities for Logica programs,
//! ported from the Python implementation in `type_inference/`.
//!
//! # Overview
//!
//! The type inference system works by:
//! 1. Building a type graph from parsed Logica rules using `TypesGraphBuilder`
//! 2. Connecting expressions with edges based on their relationships
//! 3. Running fixed-point inference to propagate types through the graph
//!
//! # Example
//!
//! ```ignore
//! use synalog::compiler::type_inference::{TypesGraphBuilder, TypeInference};
//!
//! let mut builder = TypesGraphBuilder::new();
//! let graphs = builder.run(&parsed_program);
//! let mut inference = TypeInference::new(graphs);
//! inference.infer()?;
//!
//! let predicate_types = inference.get_predicate_types("MyPredicate");
//! ```

mod built_in;
mod builder;
mod edge;
mod expression;
mod graph;
mod inference;
mod intersection;
mod types;

pub use builder::TypesGraphBuilder;
pub use edge::{Bounds, Edge};
pub use expression::Expression;
pub use graph::TypesGraph;
pub use inference::TypeInference;
pub use intersection::{intersect, TypeInferenceError};
pub use types::Type;
