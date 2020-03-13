USE AdventureWorks2008R2
GO

-- Since we wanted to check the if the round trip is impacting IO and network cycle
-- Let's enable Statistics IO on

SET STATISTICS IO ON

--SET NOCOUNT ON 
-- Declaring some variables 
DECLARE @iOrderID INT
DECLARE @iOrderLineID INT
 
-- Query 1 - Let's capture value for OrderID into a variable
SET
	@iOrderID		=	(select [PurchaseOrderID]	
FROM Purchasing.PurchaseOrderDetail
where PurchaseOrderID = 34)
SELECT @iOrderID


-- Query 2 - Let's capture value for OrderLineID into a variable
SET
	@iOrderLineID	=	(select [PurchaseOrderDetailID] 
FROM Purchasing.PurchaseOrderDetail
where PurchaseOrderID = 34)

SELECT @iOrderLineID

--DBCC FREEPROCCACHE

-- Declaring some variables 
DECLARE @iOrderID1 INT
DECLARE @iOrderLineID1 INT


-- Query 3 - Let's capture value for OrderID and OrderLineID into a variable
SELECT
	@iOrderID1		=	[PurchaseOrderID],
	@iOrderLineID1	=	[PurchaseOrderDetailID]
FROM Purchasing.PurchaseOrderDetail
where PurchaseOrderID = 34
SELECT @iOrderID1, @iOrderLineID1