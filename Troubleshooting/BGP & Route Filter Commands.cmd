| Command / Configuration                                                          | Purpose / Description   | When to Use                          |
| -------------------------------------------------------------------------------- | ----------------------- | ------------------------------------ |
| `set policy-options policy-statement <NAME> term 1 from route-filter <IP> exact` | Accept specific prefix  | When advertising or filtering routes |
| `set policy-options policy-statement <NAME> term 1 then accept`                  | Accept matched routes   | Use after defining route-filter      |
| `set policy-options policy-statement <NAME> term 2 then reject`                  | Reject all other routes | Always to avoid unwanted routes      |
