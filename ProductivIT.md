# SQL Query Solutions for ProductivIT Database

## Overview
This repository contains SQL solutions to various data analysis and reporting problems using the **ProductivIT** database. Each solution consists of a **single SQL SELECT statement**, ensuring efficient data retrieval without creating custom views or temporary tables.

## Problem Statements and Solutions

### 1. Customers with More Than 15 Disabled User Accounts
- Identify customers who have more than 15 disabled user accounts.

### 2. Employees with Five-Letter First Names
- Retrieve the **first and last names** of all employees whose **first names contain exactly five letters**.

### 3. Average Daily Car Rental Rate by Company
- Calculate the **average daily rental rate** for each car rental company.
- The rate is derived using `lineItemTotal / carDay`, where the rental company is stored in `lineItemCompany`.

### 4. Expense Reports Approved by Employees in Different Offices
- Find employees whose **expense reports were approved by someone from a different office**.
- Display:
  - Submitter’s first and last name + their office
  - Approver’s first and last name + their office
- Ensure that duplicate records are removed.

### 5. Customers Who Have Never Taken More Than 20 Days to Pay Invoices
- Identify customers who **always** pay their invoices in **20 days or fewer**.
- Display the **customer name** and their **average invoice payment time**.

### 6. Employees in Chicago with High Meal Costs vs. Atlanta
- Generate a report that includes:
  - Employee name
  - Expense report number
  - Name of the restaurant
  - **Average cost per diner** (computed as `total line item amount / number of diners`)
- Only include employees from **Chicago** where their **average cost per diner is higher** than the **average cost per diner for Atlanta employees**.

### 7. List of All Cities Employees Have Flown From or To
- Combine cities where employees have flown **out of (origin)** or **to (destination)** into a single report.
- The output should contain:
  - City name
  - Label indicating whether it is an **"origin"** or **"destination"** city.

### 8. Detailed Report of Meal and Lodging Expenses
- Retrieve **all details** for expense line items categorized as either **"Meals"** or **"Lodging"**.
- Display:
  - **All columns** from `expLineItem`
  - **Relevant columns** from `Meals` and `Lodging` tables (depending on `lineItemCat` value).

### 9. Current Hourly Employees Earning Below Average
- Find all **active hourly employees** who earn **less than the average hourly rate** of **all current active employees**.

### 10. Most Assigned Expense Report Purpose
- Identify the **most frequently assigned** **expense report purpose**.
- Display:
  - The `purposeDesc`
  - The **number of times** this purpose was assigned.

## Execution Guidelines
- All queries are written as **single SQL SELECT statements**.
- Queries are optimized for execution on the **original ProductivIT database**.
- No temporary tables or custom views are used.

## About This Repository
This repository serves as a reference for **SQL data analysis techniques**, demonstrating efficient query writing for real-world business reporting and analytics.
