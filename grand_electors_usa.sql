-- Retrieve all columns from the 'grandelectors_by_state' table
SELECT *
FROM grandelectors_by_state;

-- Retrieve all columns from the 'population_by_state' table
SELECT *
FROM population_by_state;

-- Count the number of distinct states in the 'grandelectors_by_state' table
SELECT COUNT(DISTINCT State) AS distinct_states
FROM grandelectors_by_state;

-- Note: The result of this query indicates there are 51 states in the dataset.

-- Count the number of distinct states in the 'population_by_state' table
SELECT COUNT(DISTINCT State) AS distinct_states
FROM population_by_state;

-- Note: The result of this query indicates there are 56 states in the dataset.

-- Update the 'State' column to capitalize the first letter and convert the rest to lowercase
UPDATE population_by_state
SET State = CONCAT(
    UPPER(SUBSTRING(State, 1, 1)), -- Capitalize the first letter
    LCASE(SUBSTRING(State, 2))     -- Convert the rest to lowercase
)
WHERE state IS NOT NULL; -- Exclude NULL values

-- Retrieve the first 10 rows from the updated 'population_by_state' table
SELECT *
FROM population_by_state
LIMIT 10;

-- Create the 'US_Voters_data' table with columns for State, Population, and GrandElectors
CREATE TABLE US_Voters_data (
  State VARCHAR(255),
  Population FLOAT,
  GrandElectors FLOAT
);
-- Populate the 'US_Voters_data' table by joining 'GrandElectors_by_state' and 'Population_by_state'
INSERT INTO US_Voters_data (State, Population, GrandElectors)
SELECT GES.State, PBS.Population, GES.GrandElectors
FROM grandelectors_by_state GES
INNER JOIN population_by_state PBS ON GES.State = PBS.State;

-- Retrieve all rows from the newly created 'US_Voters_data' table
SELECT *
FROM us_voters_data;

-- Calculate and retrieve the Ratio of Population to GrandElectors in the 'US_Voters_data' table
SELECT *, Population / GrandElectors AS Ratio
FROM us_voters_data;

-- Calculate and retrieve the top 15 states with the highest Ratio of Population to GrandElectors in the 'US_Voters_data' table
SELECT *, Population / GrandElectors AS Ratio
FROM us_voters_data
ORDER BY Ratio DESC
LIMIT 15;

-- Calculate the Ratio of Population to GrandElectors and running sum of GrandElectors in descending order
SELECT 
    State, 
    GrandElectors, 
    Population / GrandElectors AS Ratio,
    SUM(GrandElectors) OVER (ORDER BY Population / GrandElectors DESC) AS RunningBalance
FROM us_voters_data
ORDER BY Ratio DESC
LIMIT 20;

-- Calculate the HalfTotalGrandElectors required for a candidate to secure a win and the AverageRatio
SELECT 
    SUM(GrandElectors)/2 AS HalfTotalGrandElectors,
    AVG(Population / GrandElectors) AS AverageRatio
FROM us_voters_data;


-- Filter the sorted list of states to meet the computed threshold for securing a win
WITH RankedData AS (
    SELECT 
        State, 
        GrandElectors, 
        Population / GrandElectors AS Ratio,
        ROW_NUMBER() OVER (ORDER BY Population / GrandElectors DESC) AS RowNum
    FROM us_voters_data
    WHERE GrandElectors > 13 -- Focus on states with GrandElectors > 13
)

-- Select the states that, if convinced, guarantee a win based on the computed threshold
SELECT State, GrandElectors, Ratio
FROM RankedData
WHERE RowNum <= (SELECT COUNT(*) FROM RankedData WHERE Ratio >= 269) -- 269 is the requirement required for a candidate to secure a win
ORDER BY Ratio DESC;

