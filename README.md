## Project 2: Department Budget vs Actual Payroll Analysis

### Business Question
Are departments operating within their approved payroll budgets?

### Analysis Goals
- Compare payroll expenses against approved department budgets
- Identify departments exceeding budget limits
- Quantify variance in both dollars and percentage
- Measure budget utilization rates

### Key Assumption
Payroll data does not contain fiscal year information.  
Payroll is treated as a snapshot baseline and compared against each fiscal year’s budget.

### Metrics Produced
- Department budget
- Actual payroll expense
- Budget remaining
- Variance dollars
- Variance percentage
- Percentage of budget used
- Over-budget indicator

### SQL Skills Demonstrated
- Common Table Expressions (CTEs)
- Aggregations and grouping
- LEFT JOINs for full budget coverage
- NULL handling with COALESCE and NULLIF
- Business rule flags using CASE statements
- Financial variance calculations

### Output Example (sample)
<img width="1307" height="222" alt="image" src="https://github.com/user-attachments/assets/faf76320-ce5e-4b30-a283-d093288ba5c6" />


