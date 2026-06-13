//! Concertina: workflow execution handler for Logica programs.
//!
//! Orchestrates the execution of compiled SQL queries in dependency order,
//! with support for iterative/recursive predicates.
//!
//! Port of `logica/common/concertina_lib.py`.

use std::collections::{HashMap, HashSet};
use std::fs;
use std::time::Instant;

use super::universe::Logica;

/// Result of a SQL query execution: (column_headers, rows).
pub type QueryResult = (Vec<String>, Vec<Vec<String>>);

/// Callback for executing SQL queries.
///
/// Parameters: (sql, engine, is_final).
/// Returns the query result.
pub type SqlRunner = Box<dyn FnMut(&str, &str, bool) -> QueryResult>;

/// Observer for completed predicate results.
pub trait Observer {
    fn observe_table(&mut self, predicate: &str, result: &QueryResult);
}

/// Display mode for execution progress.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DisplayMode {
    /// Print predicate names and timing to stdout.
    Terminal,
    /// No output.
    Silent,
}

/// A single action in the execution DAG.
#[derive(Debug, Clone)]
struct Action {
    name: String,
    #[allow(dead_code)]
    action_type: ActionType,
    requires: Vec<String>,
    launcher: Launcher,
}

#[derive(Debug, Clone, PartialEq, Eq)]
enum ActionType {
    Data,
    Intermediate,
    Final,
}

#[derive(Debug, Clone)]
enum Launcher {
    None,
    Query {
        predicate: String,
        engine: String,
        sql: String,
    },
}

/// Iteration definition for the concertina scheduler.
#[derive(Debug, Clone)]
struct IterationInfo {
    predicates: Vec<String>,
    repetitions: i64,
    stop_signal: Option<String>,
}

/// Engine that executes individual SQL queries.
struct ConcertinaQueryEngine {
    final_predicates: HashSet<String>,
    final_result: HashMap<String, QueryResult>,
    sql_runner: SqlRunner,
    print_running_predicate: bool,
    completion_time: HashMap<String, u128>,
}

impl ConcertinaQueryEngine {
    fn new(
        final_predicates: HashSet<String>,
        sql_runner: SqlRunner,
        print_running_predicate: bool,
    ) -> Self {
        ConcertinaQueryEngine {
            final_predicates,
            final_result: HashMap::new(),
            sql_runner,
            print_running_predicate,
            completion_time: HashMap::new(),
        }
    }

    fn run(&mut self, action: &Action) {
        match &action.launcher {
            Launcher::None => {}
            Launcher::Query {
                predicate,
                engine,
                sql,
            } => {
                if self.print_running_predicate {
                    eprint!("Running predicate: {}", predicate);
                }
                let start = Instant::now();
                let is_final = self.final_predicates.contains(predicate);
                let result = (self.sql_runner)(sql, engine, is_final);
                let elapsed_ms = start.elapsed().as_millis();
                self.completion_time.insert(predicate.clone(), elapsed_ms);
                if self.print_running_predicate {
                    eprintln!(" ({} ms)", elapsed_ms);
                }
                if is_final {
                    self.final_result.insert(predicate.clone(), result);
                }
            }
        }
    }
}

/// Concertina DAG scheduler and executor.
struct Concertina {
    /// All actions by name.
    actions: HashMap<String, Action>,
    /// Sorted execution order.
    actions_to_run: Vec<String>,
    /// Actions that have completed.
    complete_actions: HashSet<String>,
    /// Iteration definitions.
    iterations: HashMap<String, IterationInfo>,
    /// Action → which iteration it belongs to.
    action_iteration: HashMap<String, String>,
    /// Iteration → repetition count.
    iteration_repetitions: HashMap<String, i64>,
    /// Iteration → stop signal file path.
    iteration_stop_signal: HashMap<String, Option<String>>,
    /// Iteration → set of action names.
    iteration_actions: HashMap<String, HashSet<String>>,
    /// Half-iteration → set of action names (upper/lower halves).
    half_iteration_actions: HashMap<String, HashSet<String>>,
    /// Action → half-iteration name.
    action_half_iteration: HashMap<String, String>,
    /// Action → dependency set (augmented for iterations).
    action_requires: HashMap<String, HashSet<String>>,
    /// Action → number of completed iterations.
    action_iterations_complete: HashMap<String, i64>,
    /// Stop signals that have been triggered.
    wrench_in_gears: HashSet<String>,
    /// Actions stopped early by signal.
    #[allow(dead_code)]
    action_stopped: HashSet<String>,
}

impl Concertina {
    fn new(config: Vec<Action>, iterations: HashMap<String, IterationInfo>) -> Self {
        let actions: HashMap<String, Action> = config
            .iter()
            .map(|a| (a.name.clone(), a.clone()))
            .collect();

        let mut concertina = Concertina {
            actions,
            actions_to_run: Vec::new(),
            complete_actions: HashSet::new(),
            iterations,
            action_iteration: HashMap::new(),
            iteration_repetitions: HashMap::new(),
            iteration_stop_signal: HashMap::new(),
            iteration_actions: HashMap::new(),
            half_iteration_actions: HashMap::new(),
            action_half_iteration: HashMap::new(),
            action_requires: HashMap::new(),
            action_iterations_complete: HashMap::new(),
            wrench_in_gears: HashSet::new(),
            action_stopped: HashSet::new(),
        };

        concertina.understand_iterations();
        concertina.actions_to_run = concertina.sort_actions(&config);
        concertina
    }

    /// Build iteration tracking maps.
    fn understand_iterations(&mut self) {
        // action_iteration: predicate → iteration name
        for (iteration, info) in &self.iterations {
            self.iteration_repetitions
                .insert(iteration.clone(), info.repetitions);
            self.iteration_stop_signal
                .insert(iteration.clone(), info.stop_signal.clone());
            let mut action_set = HashSet::new();
            for predicate in &info.predicates {
                if self.actions.contains_key(predicate) {
                    self.action_iteration
                        .insert(predicate.clone(), iteration.clone());
                }
                action_set.insert(predicate.clone());
            }
            self.iteration_actions
                .insert(iteration.clone(), action_set);
        }

        // action_iterations_complete
        for info in self.iterations.values() {
            for predicate in &info.predicates {
                self.action_iterations_complete
                    .insert(predicate.clone(), 0);
            }
        }

        // half_iteration_actions: split predicates into upper and lower halves
        for (iteration, info) in &self.iterations {
            let predicates = &info.predicates;
            assert!(
                predicates.len() % 2 == 0,
                "Iteration predicates must be even: {:?}",
                predicates
            );
            let mid = predicates.len() / 2;
            let upper: HashSet<String> = predicates[..mid].iter().cloned().collect();
            let lower: HashSet<String> = predicates[mid..].iter().cloned().collect();
            self.half_iteration_actions
                .insert(format!("{}_upper", iteration), upper);
            self.half_iteration_actions
                .insert(format!("{}_lower", iteration), lower);
        }

        // action_half_iteration
        for (hi, ps) in &self.half_iteration_actions {
            for p in ps {
                self.action_half_iteration.insert(p.clone(), hi.clone());
            }
        }

        // action_requires: base requirements from config
        for action in self.actions.values() {
            self.action_requires.insert(
                action.name.clone(),
                action.requires.iter().cloned().collect(),
            );
        }

        // Augment requirements: everything an iteration depends on must come before it.
        let mut half_iteration_requires: HashMap<String, HashSet<String>> = self
            .half_iteration_actions
            .keys()
            .map(|i| (i.clone(), HashSet::new()))
            .collect();

        for (a, reqs) in &self.action_requires {
            if let Some(hi) = self.action_half_iteration.get(a) {
                half_iteration_requires
                    .get_mut(hi)
                    .unwrap()
                    .extend(reqs.iter().cloned());
            }
        }

        let half_iteration_actions_snapshot = self.half_iteration_actions.clone();
        for (iteration, requires) in &half_iteration_requires {
            if let Some(actions_in_hi) = half_iteration_actions_snapshot.get(iteration) {
                for predicate in actions_in_hi {
                    if let Some(pred_reqs) = self.action_requires.get_mut(predicate) {
                        let external_reqs: HashSet<String> = requires
                            .difference(actions_in_hi)
                            .cloned()
                            .collect();
                        pred_reqs.extend(external_reqs);
                    }
                }
            }
        }
    }

    /// Topologically sort actions, grouping iteration actions together.
    fn sort_actions(&self, config: &[Action]) -> Vec<String> {
        let mut actions_to_assign: HashSet<String> =
            config.iter().map(|a| a.name.clone()).collect();
        let mut complete: HashSet<String> = HashSet::new();
        let mut result = Vec::new();
        let mut assigning_iteration: Option<String> = None;

        while !actions_to_assign.is_empty() {
            let remains = actions_to_assign.len();

            let eligible: Vec<String> = if let Some(ref iter_name) = assigning_iteration {
                actions_to_assign
                    .intersection(
                        self.iteration_actions
                            .get(iter_name)
                            .unwrap_or(&HashSet::new()),
                    )
                    .cloned()
                    .collect()
            } else {
                actions_to_assign.iter().cloned().collect()
            };

            let mut exit_for = false;
            for a in &eligible {
                let reqs = self
                    .action_requires
                    .get(a)
                    .cloned()
                    .unwrap_or_default();
                if reqs.is_subset(&complete) {
                    result.push(a.clone());
                    if let Some(iter_name) = self.action_iteration.get(a) {
                        if let Some(ref current) = assigning_iteration {
                            assert_eq!(
                                current, iter_name,
                                "Iteration mismatch during sorting"
                            );
                        }
                        assigning_iteration = Some(iter_name.clone());
                        exit_for = true;
                    }
                    complete.insert(a.clone());
                    actions_to_assign.remove(a);
                    if let Some(ref iter_name) = assigning_iteration {
                        if let Some(iter_acts) = self.iteration_actions.get(iter_name) {
                            if iter_acts.intersection(&actions_to_assign).count() == 0 {
                                assigning_iteration = None;
                            }
                        }
                    }
                    if exit_for {
                        break;
                    }
                }
            }

            assert!(
                actions_to_assign.len() < remains,
                "Could not schedule: {:?}",
                actions_to_assign
            );
        }

        result
    }

    /// Check if an action's iteration wants to stop via signal file.
    fn action_iteration_wants_to_stop_by_signal(&mut self, action: &str) -> bool {
        let iteration = match self.action_iteration.get(action) {
            Some(i) => i.clone(),
            None => return false,
        };
        let signal = match self.iteration_stop_signal.get(&iteration) {
            Some(Some(s)) => s.clone(),
            _ => return false,
        };
        if self.wrench_in_gears.contains(&signal) {
            return true;
        }
        if let Ok(contents) = fs::read_to_string(&signal) {
            if !contents.is_empty() {
                self.wrench_in_gears.insert(signal);
                return true;
            }
        }
        false
    }

    /// Update state after running an iterative action.
    fn update_state_for_iterative_action(&mut self, one_action: &str) {
        *self
            .action_iterations_complete
            .get_mut(one_action)
            .unwrap() += 1;

        let iteration = self.action_iteration.get(one_action).unwrap().clone();
        let repetitions = *self.iteration_repetitions.get(&iteration).unwrap();

        if self.action_iterations_complete[one_action] >= repetitions {
            self.complete_actions.insert(one_action.to_string());
        } else if self.action_iteration_wants_to_stop_by_signal(one_action) {
            self.complete_actions.insert(one_action.to_string());
            self.action_stopped.insert(one_action.to_string());
        } else {
            // Re-insert action after current iteration group.
            let mut i = 0;
            while i < self.actions_to_run.len() {
                if let Some(a_iter) = self.action_iteration.get(&self.actions_to_run[i]) {
                    if *a_iter == iteration {
                        i += 1;
                        continue;
                    }
                }
                break;
            }
            self.actions_to_run
                .insert(i, one_action.to_string());
        }
    }

    /// Run all actions in order.
    fn run(&mut self, engine: &mut ConcertinaQueryEngine) {
        while !self.actions_to_run.is_empty() {
            let one_action = self.actions_to_run.remove(0);
            let action = self.actions[&one_action].clone();
            engine.run(&action);

            if !self.action_iterations_complete.contains_key(&one_action) {
                self.complete_actions.insert(one_action);
            } else {
                self.update_state_for_iterative_action(&one_action);
            }
        }
    }
}

/// Rename a predicate across the execution maps to avoid conflicts.
fn rename_predicate(
    table_to_export_map: &mut HashMap<String, String>,
    dependency_edges: &mut HashSet<(String, String)>,
    data_dependency_edges: &mut HashSet<(String, String)>,
    from_name: &str,
    to_name: &str,
) {
    // Rename in table_to_export_map
    if let Some(v) = table_to_export_map.remove(from_name) {
        table_to_export_map.insert(to_name.to_string(), v);
    }

    // Rename in dependency_edges
    let old_edges: Vec<_> = dependency_edges.iter().cloned().collect();
    dependency_edges.clear();
    for (mut a, mut b) in old_edges {
        if a == from_name {
            a = to_name.to_string();
        }
        if b == from_name {
            b = to_name.to_string();
        }
        dependency_edges.insert((a, b));
    }

    // Rename in data_dependency_edges
    let old_data_edges: Vec<_> = data_dependency_edges.iter().cloned().collect();
    data_dependency_edges.clear();
    for (mut a, mut b) in old_data_edges {
        if a == from_name {
            a = to_name.to_string();
        }
        if b == from_name {
            b = to_name.to_string();
        }
        data_dependency_edges.insert((a, b));
    }
}

/// Build the concertina config from aggregated execution data.
fn build_config(
    table_to_export_map: &HashMap<String, String>,
    dependency_edges: &HashSet<(String, String)>,
    data_dependency_edges: &HashSet<(String, String)>,
    final_predicates: &HashSet<String>,
    sql_engine: &str,
) -> Vec<Action> {
    // Build depends_on map
    let mut depends_on: HashMap<String, HashSet<String>> = HashMap::new();
    for (source, target) in dependency_edges.iter().chain(data_dependency_edges.iter()) {
        depends_on
            .entry(target.clone())
            .or_default()
            .insert(source.clone());
    }

    // Identify data nodes
    let mut data: HashSet<String> = data_dependency_edges
        .iter()
        .map(|(d, _)| d.clone())
        .collect();
    for (d, _) in dependency_edges {
        if !table_to_export_map.contains_key(d) {
            data.insert(d.clone());
        }
    }

    let mut result = Vec::new();

    // Data actions (no-op, just declare existence)
    for d in &data {
        result.push(Action {
            name: d.clone(),
            action_type: ActionType::Data,
            requires: Vec::new(),
            launcher: Launcher::None,
        });
    }

    // Query actions
    for (t, sql) in table_to_export_map {
        let action_type = if final_predicates.contains(t) {
            ActionType::Final
        } else {
            ActionType::Intermediate
        };
        result.push(Action {
            name: t.clone(),
            action_type,
            requires: depends_on
                .get(t)
                .map(|s| s.iter().cloned().collect())
                .unwrap_or_default(),
            launcher: Launcher::Query {
                predicate: t.clone(),
                engine: sql_engine.to_string(),
                sql: sql.clone(),
            },
        });
    }

    result
}

/// Execute a Logica program by running compiled SQL in dependency order.
///
/// This is the main entry point, equivalent to Python's `ExecuteLogicaProgram`.
///
/// # Arguments
/// * `logica_executions` - Compiled execution objects (one per requested predicate)
/// * `sql_runner` - Callback to execute SQL queries
/// * `sql_engine` - Engine name ("sqlite", "duckdb", "bigquery", etc.)
/// * `display_mode` - Progress display mode
/// * `observer` - Optional observer for final results
///
/// # Returns
/// Map of predicate name → query result for final predicates.
pub fn execute_logica_program(
    logica_executions: &[Logica],
    sql_runner: SqlRunner,
    sql_engine: &str,
    display_mode: DisplayMode,
    observer: Option<&mut dyn Observer>,
) -> HashMap<String, QueryResult> {
    let final_predicates: HashSet<String> = logica_executions
        .iter()
        .filter_map(|e| e.main_predicate.clone())
        .collect();

    let mut table_to_export_map: HashMap<String, String> = HashMap::new();
    let mut dependency_edges: HashSet<(String, String)> = HashSet::new();
    let mut data_dependency_edges: HashSet<(String, String)> = HashSet::new();
    let mut iterations: HashMap<String, IterationInfo> = HashMap::new();

    for e in logica_executions {
        let mut p_table_to_export_map: HashMap<String, String> =
            e.table_to_export_map.clone();
        let mut p_dependency_edges: HashSet<(String, String)> =
            e.dependency_edges.iter().cloned().collect();
        let mut p_data_dependency_edges: HashSet<(String, String)> =
            e.data_dependency_edges.iter().cloned().collect();

        // Collect iteration definitions
        for (iter_name, iter_def) in &e.iterations {
            iterations.insert(
                iter_name.clone(),
                IterationInfo {
                    predicates: iter_def.predicates.clone(),
                    repetitions: iter_def.repetitions,
                    stop_signal: iter_def.stop_signal.clone(),
                },
            );
        }

        // Rename predicates that are final in another execution to avoid conflicts.
        let main_pred = e.main_predicate.as_deref().unwrap_or("");
        for p in &final_predicates {
            if p != main_pred && p_table_to_export_map.contains_key(p) {
                rename_predicate(
                    &mut p_table_to_export_map,
                    &mut p_dependency_edges,
                    &mut p_data_dependency_edges,
                    p,
                    &format!("\u{2913}{}", p), // ⤓ prefix
                );
            }
        }

        // Add predicate-specific preamble to each SQL.
        for (k, v) in &p_table_to_export_map {
            let preamble = e.predicate_specific_preamble(main_pred);
            table_to_export_map.insert(k.clone(), format!("{}{}", preamble, v));
        }

        dependency_edges.extend(p_dependency_edges);
        data_dependency_edges.extend(p_data_dependency_edges);
    }

    let config = build_config(
        &table_to_export_map,
        &dependency_edges,
        &data_dependency_edges,
        &final_predicates,
        sql_engine,
    );

    let print_running = display_mode == DisplayMode::Terminal;
    let mut engine =
        ConcertinaQueryEngine::new(final_predicates.clone(), sql_runner, print_running);

    // Run preambles (idempotent, so run all).
    let preambles: HashSet<String> = logica_executions
        .iter()
        .map(|e| e.preamble.clone())
        .collect();
    for preamble in &preambles {
        if !preamble.is_empty() {
            (engine.sql_runner)(preamble, sql_engine, false);
        }
    }

    let mut concertina = Concertina::new(config, iterations);
    concertina.run(&mut engine);

    // Notify observer for final results.
    if let Some(obs) = observer {
        for (pred, result) in &engine.final_result {
            obs.observe_table(pred, result);
        }
    }

    engine.final_result
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Helper to create a minimal Logica execution with SQL.
    fn make_execution(
        predicate: &str,
        sql: &str,
        deps: Vec<(&str, &str)>,
    ) -> Logica {
        let mut e = Logica::new();
        e.main_predicate = Some(predicate.to_string());
        e.table_to_export_map
            .insert(predicate.to_string(), sql.to_string());
        e.dependency_edges = deps
            .into_iter()
            .map(|(a, b)| (a.to_string(), b.to_string()))
            .collect();
        e
    }

    #[test]
    fn test_single_predicate() {
        let exec = make_execution("test_pred", "SELECT 1", vec![]);
        let runner: SqlRunner = Box::new(|_sql, _engine, _is_final| {
            (vec!["col1".to_string()], vec![vec!["1".to_string()]])
        });

        let result = execute_logica_program(
            &[exec],
            runner,
            "sqlite",
            DisplayMode::Silent,
            None,
        );

        assert!(result.contains_key("test_pred"));
        let (headers, rows) = &result["test_pred"];
        assert_eq!(headers, &["col1"]);
        assert_eq!(rows, &[vec!["1".to_string()]]);
    }

    #[test]
    fn test_dependency_order() {
        let mut exec = Logica::new();
        exec.main_predicate = Some("final_pred".to_string());
        exec.table_to_export_map
            .insert("base".to_string(), "SELECT 1".to_string());
        exec.table_to_export_map
            .insert("final_pred".to_string(), "SELECT * FROM base".to_string());
        exec.dependency_edges = vec![("base".to_string(), "final_pred".to_string())];

        let execution_order = std::sync::Arc::new(std::sync::Mutex::new(Vec::new()));
        let order_clone = execution_order.clone();

        let runner: SqlRunner = Box::new(move |sql, _engine, _is_final| {
            order_clone.lock().unwrap().push(sql.to_string());
            (vec![], vec![])
        });

        execute_logica_program(&[exec], runner, "sqlite", DisplayMode::Silent, None);

        let order = execution_order.lock().unwrap();
        assert_eq!(order.len(), 2);
        assert_eq!(order[0], "SELECT 1");
        assert_eq!(order[1], "SELECT * FROM base");
    }

    #[test]
    fn test_data_dependency() {
        let mut exec = Logica::new();
        exec.main_predicate = Some("result".to_string());
        exec.table_to_export_map
            .insert("result".to_string(), "SELECT * FROM ext_table".to_string());
        exec.data_dependency_edges =
            vec![("ext_table".to_string(), "result".to_string())];

        let runner: SqlRunner = Box::new(|_sql, _engine, _is_final| {
            (vec!["x".to_string()], vec![vec!["42".to_string()]])
        });

        let result = execute_logica_program(
            &[exec],
            runner,
            "sqlite",
            DisplayMode::Silent,
            None,
        );

        assert!(result.contains_key("result"));
    }

    #[test]
    fn test_multiple_executions_rename_conflict() {
        // Two executions where each references the other's main predicate.
        let mut exec_a = Logica::new();
        exec_a.main_predicate = Some("A".to_string());
        exec_a
            .table_to_export_map
            .insert("A".to_string(), "SELECT 1 AS a".to_string());
        exec_a
            .table_to_export_map
            .insert("B".to_string(), "SELECT 2 AS b".to_string());
        exec_a.dependency_edges = vec![("B".to_string(), "A".to_string())];

        let mut exec_b = Logica::new();
        exec_b.main_predicate = Some("B".to_string());
        exec_b
            .table_to_export_map
            .insert("B".to_string(), "SELECT 3 AS b".to_string());

        let runner: SqlRunner = Box::new(|_sql, _engine, _is_final| (vec![], vec![]));

        let result = execute_logica_program(
            &[exec_a, exec_b],
            runner,
            "sqlite",
            DisplayMode::Silent,
            None,
        );

        // Both A and B should be in results.
        assert!(result.contains_key("A"));
        assert!(result.contains_key("B"));
    }

    #[test]
    fn test_preamble_execution() {
        let mut exec = Logica::new();
        exec.main_predicate = Some("pred".to_string());
        exec.table_to_export_map
            .insert("pred".to_string(), "SELECT 1".to_string());
        exec.preamble = "CREATE TYPE IF NOT EXISTS mytype".to_string();

        let calls = std::sync::Arc::new(std::sync::Mutex::new(Vec::new()));
        let calls_clone = calls.clone();

        let runner: SqlRunner = Box::new(move |sql, _engine, is_final| {
            calls_clone
                .lock()
                .unwrap()
                .push((sql.to_string(), is_final));
            (vec![], vec![])
        });

        execute_logica_program(&[exec], runner, "sqlite", DisplayMode::Silent, None);

        let calls = calls.lock().unwrap();
        // Preamble runs first, not as final.
        assert_eq!(calls[0].0, "CREATE TYPE IF NOT EXISTS mytype");
        assert!(!calls[0].1);
    }
}
