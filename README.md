# SQL Project: Analysis of US Grand Electors

## Introduction
This SQL project involves analyzing data related to US Grand Electors. The project consists of several steps to derive meaningful insights from the dataset, including joining tables, data manipulation, and statistical analysis.

## Project Tasks
Below are the key tasks and steps performed in this project:

### 1. Data Import and Preparation
- Importing the required SQL extension and connecting to an in-memory SQLite database.
- Loading two datasets: "Grand Electors by State" and "Population by State."
- Cleaning data, including converting state names to uppercase for consistency.

### 2. Joining Tables
- Joining the "Grand Electors by State" and "Population by State" tables based on the common "State" column.

### 3. Renaming States
- Changing the name of the "District of Columbia" state to its short version, "DC," in both datasets.

### 4. Calculating Ratios
- Calculating the ratio between the number of Grand Electors and the population for each state.
- Ordering states by decreasing ratio of Grand Electors per capita to create a priority list.

### 5. Running Total of Grand Electors
- Computing the running total of Grand Electors in the sorted list of states.

### 6. Half of the Total Grand Electors
- Independently computing half of the total Grand Electors overall (in the whole country).

### 7. Filtering States
- Filtering the sorted list of states to keep only the top ones that enable reaching the computed threshold. These states are the target list.

## Setup/Installation Requirements
To work with this SQL project, you will need:
1. SQL database management system (e.g., SQLite) installed.
2. SQL client or interface to run SQL queries.
3. Knowledge of SQL to interact with the project.

## Conclusion
This SQL project provides insights into US Grand Electors, helping to prioritize states based on Grand Electors per capita. It also calculates the target list of states required to achieve a specific threshold. This analysis is crucial for decision-making in various political contexts.

