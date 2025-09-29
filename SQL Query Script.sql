-- Query 1: Total Revenue by Location for the Previous Year
SELECT 
    b.Location, 
    SUM(s.Total_Amount) AS Total_Revenue
FROM 
    Sales s
JOIN 
    Orders o ON s.Order_ID = o.Order_ID
JOIN 
    Branch b ON o.Branch_ID = b.Branch_ID
WHERE 
    YEAR(s.Sales_Date) = YEAR(CURDATE()) - 1
GROUP BY 
    b.Location
ORDER BY 
    Total_Revenue DESC;

-- Query 2: Inventory Levels with Stock Status
SELECT 
    Ingredient_Name, 
    Quantity, 
    Unit, 
    Reorder_Level,
    CASE 
        WHEN Quantity <= Reorder_Level THEN 'Low Stock'
        ELSE 'Sufficient Stock'
    END AS Stock_Status
FROM 
    Inventory
ORDER BY 
    Stock_Status DESC, Ingredient_Name;

-- Query 3: Reservation Details with Customer Information
SELECT 
    r.Reservation_ID, 
    c.First_Name, 
    c.Last_Name, 
    r.Reservation_Date, 
    r.No_of_People, 
    r.Status
FROM 
    Reservation r
JOIN 
    Customer c ON r.Customer_ID = c.Customer_ID
ORDER BY 
    r.Reservation_Date DESC;

-- Query 4: Top 10 Most Popular Menu Items in January 2025
SELECT 
    m.Name AS Menu_Item, 
    SUM(o.Quantity) AS Total_Quantity
FROM 
    Orders o
JOIN 
    Menu m ON o.Menu_ID = m.Menu_ID
WHERE 
    o.Order_Date BETWEEN '2025-01-01' AND '2025-01-31'
GROUP BY 
    m.Name
ORDER BY 
    Total_Quantity DESC
LIMIT 10;

-- Query 5: Total Sales for Each Menu Category in January 2025
SELECT 
    c.Category_Name, 
    SUM(s.Total_Amount) AS Total_Sales
FROM 
    Sales s
JOIN 
    Orders o ON s.Order_ID = o.Order_ID
JOIN 
    Menu m ON o.Menu_ID = m.Menu_ID
JOIN 
    Category c ON m.Category_ID = c.Category_ID
WHERE 
    s.Sales_Date BETWEEN '2025-01-01' AND '2025-01-31'
GROUP BY 
    c.Category_Name
ORDER BY 
    Total_Sales DESC;

-- Query 6: Total Revenue by Location for 2025
SELECT 
    b.Location, 
    SUM(s.Total_Amount) AS Total_Revenue
FROM 
    Sales s
JOIN 
    Orders o ON s.Order_ID = o.Order_ID
JOIN 
    Branch b ON o.Branch_ID = b.Branch_ID
WHERE 
    YEAR(s.Sales_Date) = 2025
GROUP BY 
    b.Location
ORDER BY 
    Total_Revenue DESC;
