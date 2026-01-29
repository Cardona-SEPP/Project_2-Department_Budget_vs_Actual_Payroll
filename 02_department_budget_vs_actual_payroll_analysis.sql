/*
Project: Department Budget vs Actual Payroll Analysis

Business Question:
Are departments operating within their approved payroll budgets?

Analysis Goals:
- Compare departmental payroll expenses against allocated budgets
- Identify departments over or under budget
- Calculate variance in dollars and percentage
- Measure percentage of budget used
- Flag departments exceeding budget thresholds

Key Assumption:
Payroll data does not contain fiscal year information.
Payroll is treated as a snapshot baseline and compared
against each fiscal year budget.

Purpose:
Support finance and leadership teams in monitoring budget
performance and identifying cost overruns.
*/

WITH dept_budget AS (
	SELECT department_id,
		fiscal_year,
		SUM(budget_amount) AS department_budget
	FROM parks_departments_budget
	GROUP BY department_id, fiscal_year
),
dept_payroll AS (
	SELECT dept_id AS department_id,
		SUM(salary) AS department_salary_expenses
	FROM employee_salary
	GROUP BY dept_id
)

SELECT b.department_id,
	COALESCE(d.department_name, 'Unassigned') AS department,
	b.fiscal_year,
    ROUND(b.department_budget, 0) AS department_budget,
    ROUND(COALESCE(p.department_salary_expenses, 0), 0) AS department_salary_expense,
    ROUND((b.department_budget - COALESCE(p.department_salary_expenses, 0)),0) AS budget_remaining,
    ROUND(COALESCE(p.department_salary_expenses, 0) - b.department_budget, 0) AS variance_dollars,
	ROUND((COALESCE(p.department_salary_expenses, 0) - b.department_budget)/NULLIF(b.department_budget, 0) * 100, 2) AS variance_pct,
	ROUND(COALESCE(p.department_salary_expenses, 0)/ NULLIF(b.department_budget, 0) * 100, 2) AS pct_budget_used,
    CASE
		WHEN COALESCE(p.department_salary_expenses, 0) > b.department_budget THEN 'Yes'
        ELSE 'No'
	END AS over_budget_flag,
    'Payroll treated as snapshot baseline (no fiscal year in salary data)' AS payroll_basis
FROM dept_budget AS b
LEFT JOIN dept_payroll AS p
	ON p.department_id = b.department_id # Keep all budgeted departments evin if payroll is missing
LEFT JOIN parks_departments AS d
	ON d.department_id = b.department_id
ORDER BY b.fiscal_year, variance_dollars DESC;
