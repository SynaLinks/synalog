# An effective approver is never away.
# Expect: holds Effective.present
ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
Away(person: "dan");
DelegatesTo(person: "dan", delegate: "fay");
Effective(approver:, requester:) distinct :- ApproverOf(approver:, requester:), ~Away(person: approver) |
  ApproverOf(approver: a, requester:), Away(person: a), DelegatesTo(person: a, delegate: approver);
@Assert(Effective, present: "∀ a r, Effective a r → ¬ Away a");
