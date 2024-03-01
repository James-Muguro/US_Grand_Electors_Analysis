# Project: Analysis of US Grand Electors

This project focuses on analyzing and processing data related to the United States voters. The dataset includes information about the number of Grand Electors and the population in various states. The goal is to derive insights, calculate ratios, and identify key states that can significantly impact an election outcome.

## Overview

The project involves several SQL queries to retrieve, update, and analyze data from two main tables: `grandelectors_by_state` and `population_by_state`. Additionally, a new table, `US_Voters_data`, is created to consolidate relevant information. The queries cover tasks such as counting distinct states, updating data formatting, creating a new table, calculating ratios, and identifying influential states based on election outcomes.

## Usage

Follow these steps to replicate the analysis:

1. **Retrieve Data:**
    - Execute queries to retrieve all columns from `grandelectors_by_state` and `population_by_state`.
    - Count the number of distinct states in each table.

2. **Data Formatting:**
    - Update the 'State' column in the `population_by_state` table to capitalize the first letter and convert the rest to lowercase.

3. **Create and Populate New Table:**
    - Create the `US_Voters_data` table with columns for 'State', 'Population', and 'GrandElectors'.
    - Populate the new table by joining data from `GrandElectors_by_state` and `Population_by_state`.

4. **Analysis:**
    - Retrieve all rows from the newly created 'US_Voters_data' table.
    - Calculate and retrieve the Ratio of Population to Grand Electors in the 'US_Voters_data' table.
    - Identify the top 15 states with the highest Ratio of Population to Grand Electors.

5. **Advanced Analysis:**
    - Calculate the Ratio of Population to Grand Electors and the running sum of Grand Electors in descending order.
    - Determine the Half Total Grand Electors required for a candidate to secure a win and the Average Ratio.
    - Filter the list of states to meet the computed threshold for securing a win.

## Setup/Installation Requirements

1. **Database Setup:**
   - Ensure that you have a MySQL database server installed.
   - Import the dataset into your MySQL database or adapt the queries to your existing data structure.

2. **Query Execution:**
   - Execute the provided SQL queries using a MySQL client or any other tool of your choice.
   - Ensure proper permissions for updating tables and creating new ones.

3. **Adjustments:**
   - Depending on your dataset, you might need to modify queries to match column names or data types.

4. **Dependencies:**
   - This project assumes familiarity with SQL and a working MySQL database environment.

## Notes

- The dataset contains variations in state names, which are addressed by updating the 'State' column in the `population_by_state` table.

- The calculated ratios provide insights into the distribution of population and Grand Electors across states.

- The project concludes by identifying states that, if convinced, guarantee a win based on the computed threshold.

## Conclusion

This project provides a comprehensive analysis of US voter data, shedding light on the distribution of Grand Electors and population across states. The calculated ratios offer valuable insights into the electoral landscape, and the identified states can play a crucial role in determining election outcomes. Feel free to explore, modify, or extend the analysis based on your specific requirements or dataset variationss.
