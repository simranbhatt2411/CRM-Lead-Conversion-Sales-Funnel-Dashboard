USE crm_analytics;

#Create Leads Table
CREATE TABLE Leads (
    Lead_ID VARCHAR(10) PRIMARY KEY,
    Lead_Date DATE,
    Lead_Source VARCHAR(50),
    Industry VARCHAR(50),
    City VARCHAR(50),
    Assigned_To VARCHAR(50),
    Lead_Status VARCHAR(30)
);

#Create Followups Table
CREATE TABLE Followups (
    Lead_ID VARCHAR(10),
    Followup_Count INT,
    Last_Followup_Days_Ago INT,
    Response VARCHAR(50),

    FOREIGN KEY (Lead_ID)
    REFERENCES Leads(Lead_ID)
);

#Create Conversions Table
CREATE TABLE Conversions (
    Lead_ID VARCHAR(10),
    Converted INT,
    Revenue_INR DECIMAL(12,2),
    Days_To_Convert INT,

    FOREIGN KEY (Lead_ID)
    REFERENCES Leads(Lead_ID)
);

#Create Ads Table

CREATE TABLE Ads (
    Campaign VARCHAR(100),
    Month VARCHAR(20),
    Ad_Spend DECIMAL(12,2),
    Leads_Generated INT,
    Conversions INT
);

SHOW TABLES;

#Stucture

DESC Leads;
DESC Followups;
DESC Conversions;
DESC Ads;

DESC Leads;
TRUNCATE TABLE Leads;

# Total Leads

SELECT * from leads limit 10;

Select count(*) as Total_Leads
from leads;

#Leads by Source

SELECT
Lead_Source,
COUNT(*) AS Total_Leads
FROM Leads
GROUP BY Lead_Source
ORDER BY Total_Leads DESC;

#Leads by Industry

SELECT
Industry,
COUNT(*) AS Total_Leads
FROM Leads
GROUP BY Industry
ORDER BY Total_Leads DESC;

#Leads by City

SELECT
City,
COUNT(*) AS Total_Leads
FROM Leads
GROUP BY City
ORDER BY Total_Leads DESC;

#Lead Status Distribution

SELECT
Lead_Status,
COUNT(*) AS Count_Status
FROM Leads
GROUP BY Lead_Status
ORDER BY Count_Status DESC;

#Conversion Rate by Source

SELECT COUNT(*) FROM Conversions;

SELECT
l.Lead_Source,
COUNT(*) AS Total_Leads,
SUM(c.Converted) AS Converted_Leads,
ROUND(
SUM(c.Converted)*100.0/
COUNT(*),
2
) AS Conversion_Rate
FROM Leads l
JOIN Conversions c
ON l.Lead_ID = c.Lead_ID
GROUP BY l.Lead_Source
ORDER BY Conversion_Rate DESC;


#Revenue by source

SELECT
l.Lead_Source,
SUM(c.Revenue_INR) AS Revenue
FROM Leads l
JOIN Conversions c
ON l.Lead_ID = c.Lead_ID
WHERE c.Converted = 1
GROUP BY l.Lead_Source
ORDER BY Revenue DESC;

#Revenue by Industry

SELECT
l.Industry,
SUM(c.Revenue_INR) AS Revenue
FROM Leads l
JOIN Conversions c
ON l.Lead_ID = c.Lead_ID
WHERE c.Converted = 1
GROUP BY l.Industry
ORDER BY Revenue DESC;

#Salesperson Performance

SELECT
l.Assigned_To,
COUNT(*) AS Total_Leads,
SUM(c.Converted) AS Converted_Leads,
SUM(c.Revenue_INR) AS Revenue
FROM Leads l
JOIN Conversions c
ON l.Lead_ID = c.Lead_ID
GROUP BY l.Assigned_To
ORDER BY Revenue DESC;

#Average Days to Convert

SELECT
ROUND(AVG(Days_To_Convert),2)
AS Avg_Days_To_Convert
FROM Conversions
WHERE Converted = 1;

#Follow-up Effectiveness

SELECT
f.Followup_Count,
COUNT(*) AS Total_Leads,
SUM(c.Converted) AS Converted_Leads,
ROUND(
SUM(c.Converted)*100.0/
COUNT(*),
2
) AS Conversion_Rate
FROM Followups f
JOIN Conversions c
ON f.Lead_ID = c.Lead_ID
GROUP BY f.Followup_Count
ORDER BY f.Followup_Count;

#Best Performing City

SELECT
l.City,
SUM(c.Revenue_INR) AS Revenue
FROM Leads l
JOIN Conversions c
ON l.Lead_ID = c.Lead_ID
WHERE c.Converted = 1
GROUP BY l.City
ORDER BY Revenue DESC;

# Add campaign performance

SELECT
Campaign,
SUM(Ad_Spend) AS Total_Spend,
SUM(Leads_Generated) AS Total_Leads,
SUM(Conversions) AS Total_Conversions,
ROUND(
SUM(Conversions)*100.0/
SUM(Leads_Generated),
2
) AS Conversion_Rate
FROM Ads
GROUP BY Campaign;

#Best Campaign

SELECT
Campaign,
SUM(Conversions) AS Total_Conversions
FROM Ads
GROUP BY Campaign
ORDER BY Total_Conversions DESC;

#Cost per lead

SELECT
Campaign,
ROUND(
SUM(Ad_Spend)/
SUM(Leads_Generated),
2
) AS Cost_Per_Lead
FROM Ads
GROUP BY Campaign
ORDER BY Cost_Per_Lead;


# Lead source

SELECT
Lead_Source,
COUNT(*) AS Total_Leads,
SUM(
CASE
WHEN Lead_Status='Converted'
THEN 1
ELSE 0
END
) AS Converted_Leads
FROM Leads
GROUP BY Lead_Source;