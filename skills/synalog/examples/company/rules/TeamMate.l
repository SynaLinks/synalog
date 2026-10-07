---
name: TeamMate
description: Two people who work in the same department, by name.
keywords: [colleague, coworker, same team]
---
import concepts.Department.Department;
import concepts.Person.Person;
import concepts.WorksIn.WorksIn;

# A traversal: two people in the same department, named for readability.
@OrderBy(TeamMate, "person_name");
TeamMate(person_name:, mate_name:, department:) distinct :-
  WorksIn(person_id:, department_id:),
  WorksIn(person_id: mate_id, department_id:),
  person_id != mate_id,
  Person(person_id:, name: person_name),
  Person(person_id: mate_id, name: mate_name),
  Department(department_id:, name: department);
