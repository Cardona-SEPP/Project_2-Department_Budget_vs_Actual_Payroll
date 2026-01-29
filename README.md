## 📊 Project 2: Department Budget vs Actual Payroll Analysis

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

| Department | Fiscal Year | Budget | Payroll | Variance | % Used | Over Budget |
|----------|-------------|--------|---------|----------|--------|-------------|
| Parks | 2024 | $1,200,000 | $1,350,000 | -$150,000 | 112.5% | Yes |
| Admin | 2024 | $800,000 | $720,000 | $80,000 | 90.0% | No |

*(Values shown for demonstration purposes)*

