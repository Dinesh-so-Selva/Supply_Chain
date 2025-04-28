	CREATE DATABASE supply_chain;
    
    use supply_chain;
    
    SELECT * FROM final_cleaned_data LIMIT 10;

  -- Total Sales
SELECT SUM(Total_Sales) AS Total_Sales_Amount
FROM final_cleaned_data;  

-- Orders by Delivery Status
SELECT Delivery_Status, COUNT(*) AS Number_of_Orders
FROM final_cleaned_data
GROUP BY Delivery_Status;

-- Average Delivery Time by Transport Mode
SELECT Transport_Mode, AVG(Delivery_Time_days) AS Avg_Delivery_Days
FROM final_cleaned_data
GROUP BY Transport_Mode
ORDER BY Avg_Delivery_Days ASC;

-- Top 5 Product Categories by Sales
SELECT Product_Category, SUM(Total_Sales) AS Sales_Amount
FROM final_cleaned_data
GROUP BY Product_Category
ORDER BY Sales_Amount DESC
LIMIT 5;

-- Warehouses with Highest Cancelled Orders
SELECT Warehouse_ID, COUNT(*) AS Cancelled_Orders
FROM final_cleaned_data
WHERE Delivery_Status = 'Cancelled'
GROUP BY Warehouse_ID
ORDER BY Cancelled_Orders DESC
LIMIT 5;

-- Transport Mode Usage
SELECT Transport_Mode, COUNT(*) AS Total_Orders
FROM final_cleaned_data
GROUP BY Transport_Mode;

-- Stock Availability Impact
SELECT Stock_Availability, Delivery_Status, COUNT(*) AS Order_Count
FROM final_cleaned_data
GROUP BY Stock_Availability, Delivery_Status;

-- Orders with Highest Distance
SELECT Order_ID, Distance_km
FROM final_cleaned_data
ORDER BY Distance_km DESC
LIMIT 10;

-- Monthly Revenue Trend
SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Total_Sales) AS Monthly_Revenue
FROM final_cleaned_data
GROUP BY Year, Month
ORDER BY Year, Month;

-- View: Delivery Status Overview
CREATE VIEW view_delivery_status AS
SELECT Delivery_Status, COUNT(*) AS Number_of_Orders
FROM final_cleaned_data
GROUP BY Delivery_Status;