USE AdventureWorks2008R2
GO

SET STATISTICS IO ON

SELECT salesorderdetailID,orderqty
FROM sales.SalesOrderDetail sod
WHERE productid =
	(
		SELECT AVG(productid) FROM sales.SalesOrderDetail sod1
		WHERE sod.SalesOrderID=sod1.SalesOrderID
		GROUP BY SalesOrderID
	)

-- Index 1
CREATE NONCLUSTERED INDEX [IX_TestIndex1]
ON sales.salesorderdetail
(salesorderid ASC, productid ASC)
INCLUDE (salesorderdetailid,orderqty)


-- Index 2
CREATE NONCLUSTERED INDEX [IX_TestIndex2]
ON sales.salesorderdetail
(productid ASC, salesorderid ASC )
INCLUDE (salesorderdetailid,orderqty)

DROP INDEX  [IX_TestIndex1] ON [Sales].[SalesOrderDetail]
GO
DROP INDEX [IX_TestIndex2] ON SALES.SALESORDERDETAIL