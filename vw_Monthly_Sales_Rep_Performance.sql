
USE OBI_01_Sales_Territory_Intelligence;
GO

CREATE OR ALTER VIEW dbo.vw_Monthly_Sales_Rep_Performance
AS

SELECT
    h.Sales_Rep_ID,
    h.Territory_ID,

    DATEFROMPARTS(
        YEAR(h.Order_Date),
        MONTH(h.Order_Date),
        1
    ) AS Sales_Month,

    COUNT(DISTINCT h.Order_ID) AS Delivered_Orders,

    COUNT(l.Order_Line_ID) AS Order_Lines,

    SUM(CAST(l.Quantity AS BIGINT)) AS Units_Sold,

    SUM(CAST(l.Net_Amount AS DECIMAL(18,2)))
        AS Gross_Recognised_Sales,

    SUM(CAST(l.Gross_Profit AS DECIMAL(18,2)))
        AS Recorded_Gross_Profit

FROM dbo.Fact_Sales_Order_Header h

INNER JOIN dbo.Fact_Sales_Order_Lines l
    ON h.Order_ID = l.Order_ID

WHERE h.Order_Status = 'Delivered'
  AND h.Delivery_Status = 'Delivered'

GROUP BY
    h.Sales_Rep_ID,
    h.Territory_ID,
    DATEFROMPARTS(
        YEAR(h.Order_Date),
        MONTH(h.Order_Date),
        1
    );
GO

SELECT TOP 20 *
FROM dbo.vw_Monthly_Sales_Rep_Performance
ORDER BY Sales_Month, Gross_Recognised_Sales DESC;
GO
