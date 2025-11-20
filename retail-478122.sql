
  ---Q1. Filter all transactions that occurred in the year 2023---
 SELECT
  *
FROM
  `retail-478122`.sales.Data
WHERE
  EXTRACT(YEAR FROM Date) = 2023;

---Q2. Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.

SELECT 
*
FROM
 `retail-478122`.sales.Data
WHERE `Total amount` > (
    SELECT
     AVG(`Total Amount`)
    FROM
     `retail-478122`.sales.Data
  );


---Q3. Calculate the total revenue (sum of Total Amount).

SELECT 
SUM(`Total Amount`) AS Total_Revenue
FROM `retail-478122`.sales.Data

---Q4. Display all distinct Product Categories in the dataset.

SELECT
 DISTINCT (`Product Category`)
FROM `retail-478122`.sales.Data

---Q5. For each Product Category, calculate the total quantity sold.

SELECT `Product Category`,
  SUM(`Quantity`) AS Total_Quantity
FROM
  `retail-478122`.sales.Data
GROUP BY
  `Product Category`;

---Q6. Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ (30–59), and ‘Senior’ (60+).

SELECT 
`Customer ID`,
 `Age`,
  CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group
FROM
`retail-478122`.sales.Data

---Q7. For each Gender, count how many high-value transactions occurred (where Total Amount > 500).

SELECT `Gender`,
  COUNT(*) AS High_Value_Transactions
FROM
  `retail-478122`.sales.Data
WHERE
  `Total Amount` > 500 
  GROUP BY
  `Gender`;

---Q8. For each Product Category, show only those categories where the total revenue exceeds 5,000.

SELECT `Product Category`,
  SUM(`Total Amount`) AS Total_Revenue
FROM
  `retail-478122`.sales.Data
GROUP BY
  `Product Category` HAVING
  Total_Revenue > 5000;

---Q9. Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – 'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200

SELECT
  `Transaction ID`,
  `Price per Unit`,
  CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
    END
    AS Unit_Cost_Category
FROM `retail-478122`.`sales`.`Data`

---Q10. Display all transactions from customers aged 40 or older and add a column Spending_Level showing ‘High’ if Total Amount > 1000, otherwise ‘Low’.

SELECT `Customer ID`,
`Age`,
`Total Amount`,
CASE
WHEN `Total Amount` > 1000 THEN 'High'
ELSE 'Low'
END AS Spending_Level
FROM `retail-478122`.`sales`.`Data`
WHERE `Age` >= 40
