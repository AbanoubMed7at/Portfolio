SELECT 
    *
FROM
    officesupplies.officesupplies;
    

# Office Supplies Sales in the West Region
SELECT 
    *
FROM
    officesupplies.officesupplies
WHERE
    region = 'west';
    

# Highest Office Supplies Sales per Region
SELECT 
    Region, ROUND(SUM(TotalSales)) AS TotalSales
FROM
    officesupplies.officesupplies
GROUP BY Region
ORDER BY totalsales DESC;


# Top Salesman
SELECT 
    Rep, ROUND(SUM(TotalSales)) AS TotalSales
FROM
    officesupplies.officesupplies
GROUP BY Rep
ORDER BY totalsales DESC;


# Top Item Sold
SELECT 
    item, ROUND(SUM(TotalSales)) AS TotalSales
FROM
    officesupplies.officesupplies
GROUP BY item
ORDER BY totalsales DESC;


# Total Units Sold for each Item
SELECT 
    item, sum(Units) as Units
FROM
    officesupplies.officesupplies
GROUP BY item
ORDER BY item;
