
USE OBI_01_Sales_Territory_Intelligence;
GO

CREATE OR ALTER VIEW dbo.vw_Monthly_Territory_Performance
AS

WITH Recognised_Order_Lines AS
(
    SELECT
        h.Order_ID,
        h.Territory_ID,
        CAST(h.Order_Date AS DATE) AS Order_Date,
        l.Order_Line_ID,
        CAST(l.Net_Amount AS DECIMAL(18,2)) AS Net_Amount,
        l.Quantity
    FROM dbo.Fact_Sales_Order_Header h
    INNER JOIN dbo.Fact_Sales_Order_Lines l
        ON h.Order_ID = l.Order_ID
    WHERE h.Order_Status = 'Delivered'
      AND h.Delivery_Status = 'Delivered'
),

Approved_Returns AS
(
    SELECT
        Original_Order_Line_ID,
        SUM(CAST(Return_Quantity AS DECIMAL(18,4)))
            AS Approved_Return_Quantity
    FROM dbo.Fact_Returns_Transactions
    WHERE Return_Status = 'Approved'
    GROUP BY Original_Order_Line_ID
),

Order_Line_Adjustments AS
(
    SELECT
        r.Order_ID,
        r.Territory_ID,
        r.Order_Date,
        r.Net_Amount,

        CASE
            WHEN ISNULL(ar.Approved_Return_Quantity, 0) = 0
                THEN CAST(0 AS DECIMAL(18,2))

            WHEN ar.Approved_Return_Quantity > r.Quantity
                THEN r.Net_Amount

            ELSE
                r.Net_Amount
                * ar.Approved_Return_Quantity
                / NULLIF(CAST(r.Quantity AS DECIMAL(18,4)), 0)
        END AS Eligible_Approved_Refund

    FROM Recognised_Order_Lines r
    LEFT JOIN Approved_Returns ar
        ON r.Order_Line_ID = ar.Original_Order_Line_ID
),

Monthly_Sales AS
(
    SELECT
        Territory_ID,
        DATEFROMPARTS(
            YEAR(Order_Date),
            MONTH(Order_Date),
            1
        ) AS Sales_Month,

        COUNT(DISTINCT Order_ID) AS Delivered_Orders,
        SUM(Net_Amount) AS Gross_Recognised_Sales,
        SUM(Eligible_Approved_Refund) AS Eligible_Approved_Refunds

    FROM Order_Line_Adjustments
    GROUP BY
        Territory_ID,
        DATEFROMPARTS(
            YEAR(Order_Date),
            MONTH(Order_Date),
            1
        )
),

Monthly_Targets AS
(
    SELECT
        Territory_ID,

        TRY_CONVERT(DATE, CONCAT(Month_ID, '-01'), 23)
            AS Sales_Month,

        SUM(CAST(Monthly_Sales_Target AS DECIMAL(18,2)))
            AS Sales_Target

    FROM dbo.Fact_Monthly_Sales_Targets
    GROUP BY
        Territory_ID,
        TRY_CONVERT(DATE, CONCAT(Month_ID, '-01'), 23)
),

Combined_Performance AS
(
    SELECT
        COALESCE(s.Territory_ID, mt.Territory_ID)
            AS Territory_ID,

        COALESCE(s.Sales_Month, mt.Sales_Month)
            AS Sales_Month,

        ISNULL(s.Delivered_Orders, 0) AS Delivered_Orders,

        ISNULL(s.Gross_Recognised_Sales, 0)
            AS Gross_Recognised_Sales,

        ISNULL(s.Eligible_Approved_Refunds, 0)
            AS Eligible_Approved_Refunds,

        ISNULL(mt.Sales_Target, 0) AS Sales_Target

    FROM Monthly_Sales s
    FULL OUTER JOIN Monthly_Targets mt
        ON s.Territory_ID = mt.Territory_ID
       AND s.Sales_Month = mt.Sales_Month
)

SELECT
    t.State,
    t.Territory_ID,
    t.Territory_Name,
    cp.Sales_Month,
    cp.Delivered_Orders,
    cp.Gross_Recognised_Sales,
    cp.Eligible_Approved_Refunds,

    cp.Gross_Recognised_Sales
        - cp.Eligible_Approved_Refunds
        AS Provisional_Adjusted_Sales,

    cp.Sales_Target,

    cp.Gross_Recognised_Sales
        - cp.Eligible_Approved_Refunds
        - cp.Sales_Target
        AS Sales_Variance,

    CASE
        WHEN cp.Sales_Target = 0 THEN NULL
        ELSE
            (
                cp.Gross_Recognised_Sales
                - cp.Eligible_Approved_Refunds
            ) * 100.0 / cp.Sales_Target
    END AS Target_Achievement_Percentage

FROM Combined_Performance cp
LEFT JOIN dbo.Dim_Territory t
    ON cp.Territory_ID = t.Territory_ID;
GO

SELECT TOP 20 *
FROM dbo.vw_Monthly_Territory_Performance
ORDER BY Sales_Month, State, Territory_Name;
GO
