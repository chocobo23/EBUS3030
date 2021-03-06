USE EBUS3030;

/*
DROP TABLE customer
DROP TABLE item
DROP TABLE office
DROP TABLE receipt
DROP TABLE receiptitem
DROP TABLE staff
*/

-- Create Price table from supplied data.
INSERT INTO Price(PriceId,Price)
SELECT DISTINCT [Item_ID],[Item_Price]
FROM [Assignment1Data]
ORDER BY [Item_ID];
GO

-- Create Item table from supplied data.
INSERT INTO Item (ItemId,ItemDescription)
SELECT DISTINCT [Item_ID],[Item_Description]
FROM [Assignment1Data]
ORDER BY [Item_ID];
GO

-- Update Item table to include relevant PriceId
UPDATE [Item] 
SET [Item].[PriceId] = (
	SELECT [Price].[PriceId]
	FROM [Price]
	WHERE [Price].[PriceId] = [Item].[ItemId]
);
GO

-- Create Office table from supplied data
INSERT INTO Office (OfficeId, OfficeLocation)
SELECT DISTINCT([Staff_office]),[Office_Location]
FROM [Assignment1Data]
ORDER BY [Staff_office]
GO

-- Create Staff table from supplied data
INSERT INTO Staff ([StaffId], [StaffFirstName],[StaffSurname],[StaffOfficeId])
SELECT DISTINCT([Staff_ID]),[Staff_First_Name],[Staff_Surname],[Staff_office]
FROM [Assignment1Data]
ORDER BY [Staff_office]
GO

-- Create Customer table from supplied data
INSERT INTO Customer ([CustomerId], [CustomerFirstName],[CustomerSurname])
SELECT DISTINCT([Customer_ID]),[Customer_First_Name],[Customer_Surname]
FROM [Assignment1Data]
ORDER BY [Customer_ID]
GO

-- Nicer method to clean record 51585
UPDATE Assignment1Data 
SET Reciept_Id=51585, 
Reciept_Transaction_Row_ID=(
    SELECT MAX(Reciept_Transaction_Row_ID)+1 
    FROM Assignment1Data
    WHERE Reciept_Id=51585)
WHERE Customer_ID='C32' 
AND Staff_ID='S15' 
AND Sale_Date='2017-11-12 00:00:00.0000000' 
AND Item_ID='14';
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0ee74976129cce87fb1558eb5586b1511f5c8d8f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51500
AND Item_ID = 20)
WHERE Reciept_Id=51500
AND Item_ID = 20
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0ee74976129cce87fb1558eb5586b1511f5c8d8f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51500
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51500
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b34383524a00eb2097c1c22f870ef2ad104b6b8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52316
AND Item_ID = 8)
WHERE Reciept_Id=52316
AND Item_ID = 8
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b34383524a00eb2097c1c22f870ef2ad104b6b8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52316
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52316
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f762efc52e8391f2992926985430a14dcd95e824
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52316
AND Item_ID = 17)
WHERE Reciept_Id=52316
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f762efc52e8391f2992926985430a14dcd95e824
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52316
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52316
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3dd17025c8ed902492f35f7c4dccce8b768e91d5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52316
AND Item_ID = 12)
WHERE Reciept_Id=52316
AND Item_ID = 12
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3dd17025c8ed902492f35f7c4dccce8b768e91d5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52316
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52316
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cbf82960f2234e024b5924439a77cbf0111b6a3c
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=51092
AND Item_ID = 3
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cbf82960f2234e024b5924439a77cbf0111b6a3c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51092
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51092
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8d7a0090296baf048420f41070a4cc71317b8c0d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51092
AND Item_ID = 7)
WHERE Reciept_Id=51092
AND Item_ID = 7
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8d7a0090296baf048420f41070a4cc71317b8c0d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51092
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51092
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 637caa67220ca4c440e1ed5595c983483dc01bd0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52414
AND Item_ID = 25)
WHERE Reciept_Id=52414
AND Item_ID = 25
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 637caa67220ca4c440e1ed5595c983483dc01bd0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52414
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52414
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 485453b424cfdd1b925c668f6d9c99953987e11b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52415
AND Item_ID = 17)
WHERE Reciept_Id=52415
AND Item_ID = 17
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 485453b424cfdd1b925c668f6d9c99953987e11b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52415
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52415
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d2b3c03686f9b3f20bea4e5145af4dc9c4bcc200
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50332
AND Item_ID = 30)
WHERE Reciept_Id=50332
AND Item_ID = 30
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d2b3c03686f9b3f20bea4e5145af4dc9c4bcc200
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50332
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50332
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e027ddb57585e446265aebc80a4594bb6e419c29
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51206
AND Item_ID = 2)
WHERE Reciept_Id=51206
AND Item_ID = 2
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e027ddb57585e446265aebc80a4594bb6e419c29
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51206
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51206
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 53798bd2989ea7e8ebf000b5506f0b6f0691a707
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51280
AND Item_ID = 27)
WHERE Reciept_Id=51280
AND Item_ID = 27
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 53798bd2989ea7e8ebf000b5506f0b6f0691a707
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51280
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51280
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 177ec4511ee0c248f5098d85f756d7e1df60106b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52012
AND Item_ID = 25)
WHERE Reciept_Id=52012
AND Item_ID = 25
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 177ec4511ee0c248f5098d85f756d7e1df60106b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52012
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52012
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dd1cec08d590fedf373a2bd1241aa669aa88dcd7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50236
AND Item_ID = 22)
WHERE Reciept_Id=50236
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dd1cec08d590fedf373a2bd1241aa669aa88dcd7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50236
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50236
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 35182e0636415bf29004a908b94db4c4b97c3c5c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50236
AND Item_ID = 15)
WHERE Reciept_Id=50236
AND Item_ID = 15
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 35182e0636415bf29004a908b94db4c4b97c3c5c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50236
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50236
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f6d69dca314c3af341ddc257354a3478839908b3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51849
AND Item_ID = 20)
WHERE Reciept_Id=51849
AND Item_ID = 20
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f6d69dca314c3af341ddc257354a3478839908b3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51849
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51849
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e6a4eef4c0b2e5f0f7adf16f6f9ace26f2cb1929
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52097
AND Item_ID = 28)
WHERE Reciept_Id=52097
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e6a4eef4c0b2e5f0f7adf16f6f9ace26f2cb1929
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52097
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52097
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 581407686c2865680bc6813ecfd849516ca62c89
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52097
AND Item_ID = 2)
WHERE Reciept_Id=52097
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 581407686c2865680bc6813ecfd849516ca62c89
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52097
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52097
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb9fe6ffe95b2aa545e53df04ce42da42a6d0d0f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52323
AND Item_ID = 28)
WHERE Reciept_Id=52323
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb9fe6ffe95b2aa545e53df04ce42da42a6d0d0f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52323
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52323
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d83fe996d3b2161609c8c8f8af9b5abd22b2fd5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50051
AND Item_ID = 30)
WHERE Reciept_Id=50051
AND Item_ID = 30
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d83fe996d3b2161609c8c8f8af9b5abd22b2fd5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50051
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50051
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 85ecb47dc6e6a9e13a832eee2201e2f79ad3c3ff
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50576
AND Item_ID = 23)
WHERE Reciept_Id=50576
AND Item_ID = 23
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 85ecb47dc6e6a9e13a832eee2201e2f79ad3c3ff
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50576
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50576
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1ba8c0f4e58a1d13b8c6a2767b20be1c22110de8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50642
AND Item_ID = 27)
WHERE Reciept_Id=50642
AND Item_ID = 27
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1ba8c0f4e58a1d13b8c6a2767b20be1c22110de8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50642
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50642
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1ad2350141699bbb757ed387f42ec21c3849c29f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50657
AND Item_ID = 28)
WHERE Reciept_Id=50657
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1ad2350141699bbb757ed387f42ec21c3849c29f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50657
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50657
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8d6af9afb5e1c12a868c6bba38f6bbb613e8c1ed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50949
AND Item_ID = 15)
WHERE Reciept_Id=50949
AND Item_ID = 15
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8d6af9afb5e1c12a868c6bba38f6bbb613e8c1ed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50949
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50949
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2bd4ca8ffee6800c10a11be729799b550ac6563e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50949
AND Item_ID = 9)
WHERE Reciept_Id=50949
AND Item_ID = 9
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2bd4ca8ffee6800c10a11be729799b550ac6563e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50949
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50949
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e6f1957a8e40f62cfb2fda56628748c87754c5b4
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=51452
AND Item_ID = 25
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e6f1957a8e40f62cfb2fda56628748c87754c5b4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51452
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51452
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a80253d47341f8ad604c28309a64aa4de978259e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51577
AND Item_ID = 12)
WHERE Reciept_Id=51577
AND Item_ID = 12
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a80253d47341f8ad604c28309a64aa4de978259e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51577
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51577
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1c8410481dfd19510119fd49ffbf918029d9712
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51577
AND Item_ID = 29)
WHERE Reciept_Id=51577
AND Item_ID = 29
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1c8410481dfd19510119fd49ffbf918029d9712
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51577
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51577
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4366f50f82104be65dd980e896424c576355201d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51674
AND Item_ID = 12)
WHERE Reciept_Id=51674
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4366f50f82104be65dd980e896424c576355201d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51674
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51674
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b98a74dfb0557e37cb4c8e2d80a4955f234fd92
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52153
AND Item_ID = 29)
WHERE Reciept_Id=52153
AND Item_ID = 29
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b98a74dfb0557e37cb4c8e2d80a4955f234fd92
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52153
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52153
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3542b7e448be49b978b75ff2c759af3d3eebc5f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50431
AND Item_ID = 16)
WHERE Reciept_Id=50431
AND Item_ID = 16
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3542b7e448be49b978b75ff2c759af3d3eebc5f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50431
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50431
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 27a53815a9d4582f0d0185074c5c7e89f7b6de3c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50431
AND Item_ID = 17)
WHERE Reciept_Id=50431
AND Item_ID = 17
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 27a53815a9d4582f0d0185074c5c7e89f7b6de3c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50431
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50431
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75f0b6ce0cabc5387f9b4dc2b91e8c38c9a5a132
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51569
AND Item_ID = 10)
WHERE Reciept_Id=51569
AND Item_ID = 10
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75f0b6ce0cabc5387f9b4dc2b91e8c38c9a5a132
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51569
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51569
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15c41732d0a49708fc000d5c21b6bee93978d190
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=50370
AND Item_ID = 12
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15c41732d0a49708fc000d5c21b6bee93978d190
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50370
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50370
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cae5dd51fbaa99463c90c397faa8fb44aec12b7b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50570
AND Item_ID = 26)
WHERE Reciept_Id=50570
AND Item_ID = 26
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cae5dd51fbaa99463c90c397faa8fb44aec12b7b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50570
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50570
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b3f6c58252831c057c7f3b3e6137ff507c82e6fc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51347
AND Item_ID = 10)
WHERE Reciept_Id=51347
AND Item_ID = 10
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b3f6c58252831c057c7f3b3e6137ff507c82e6fc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51347
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51347
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6219332d188b32bd11936fa49b81687fdc8ddf73
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50331
AND Item_ID = 27)
WHERE Reciept_Id=50331
AND Item_ID = 27
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6219332d188b32bd11936fa49b81687fdc8ddf73
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50331
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50331
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a6852608ae458d392e82d546c54a342750e59d8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52204
AND Item_ID = 14)
WHERE Reciept_Id=52204
AND Item_ID = 14
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a6852608ae458d392e82d546c54a342750e59d8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52204
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52204
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98c33d72027c407a143e4ef74eabe8336ee7891c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50680
AND Item_ID = 7)
WHERE Reciept_Id=50680
AND Item_ID = 7
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98c33d72027c407a143e4ef74eabe8336ee7891c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50680
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50680
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96bfde5a9fd48c7bd88d10ead9337353cac22950
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50680
AND Item_ID = 28)
WHERE Reciept_Id=50680
AND Item_ID = 28
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96bfde5a9fd48c7bd88d10ead9337353cac22950
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50680
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50680
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22b47d093d5ac4864f858a0872f820f9397d3045
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50498
AND Item_ID = 25)
WHERE Reciept_Id=50498
AND Item_ID = 25
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22b47d093d5ac4864f858a0872f820f9397d3045
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50498
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50498
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68ce6fb698a005bbebd624f9f473359653fa0c9c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50498
AND Item_ID = 4)
WHERE Reciept_Id=50498
AND Item_ID = 4
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68ce6fb698a005bbebd624f9f473359653fa0c9c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50498
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50498
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a0ecb421a7570e62c2dcc476c8e455f6f30bf762
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=50498
AND Item_ID = 20
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a0ecb421a7570e62c2dcc476c8e455f6f30bf762
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50498
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50498
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8d7f0d060a2b651c858d90b2d7bc2eaf41ae5c48
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50806
AND Item_ID = 15)
WHERE Reciept_Id=50806
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8d7f0d060a2b651c858d90b2d7bc2eaf41ae5c48
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50806
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50806
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 426a917d0d42a890734a666165ecbda6ead6abaf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50334
AND Item_ID = 13)
WHERE Reciept_Id=50334
AND Item_ID = 13
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 426a917d0d42a890734a666165ecbda6ead6abaf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50334
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50334
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf2d35619b0c2a7a4ab501e5698d3b721cac0f03
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50334
AND Item_ID = 25)
WHERE Reciept_Id=50334
AND Item_ID = 25
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf2d35619b0c2a7a4ab501e5698d3b721cac0f03
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50334
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50334
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7535238421feb94f4a46a95e5166272d823870eb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50599
AND Item_ID = 19)
WHERE Reciept_Id=50599
AND Item_ID = 19
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7535238421feb94f4a46a95e5166272d823870eb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50599
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50599
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f23f9b3e1961543a2be0e839d0ddbf99b36517b8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51917
AND Item_ID = 28)
WHERE Reciept_Id=51917
AND Item_ID = 28
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f23f9b3e1961543a2be0e839d0ddbf99b36517b8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51917
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51917
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66de8173ab8015ef96de6a2a52603d1ecf6cfee4
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=51939
AND Item_ID = 24
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66de8173ab8015ef96de6a2a52603d1ecf6cfee4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51939
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51939
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bca5f4d0d5975cc23f4186af98a089294f8feda4
UPDATE Assignment1Data 
SET [Item_Quantity]=12
WHERE Reciept_Id=51815
AND Item_ID = 12
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bca5f4d0d5975cc23f4186af98a089294f8feda4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51815
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51815
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e064c0470a86e7e10e293f8bf52c86c377888985
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50199
AND Item_ID = 19)
WHERE Reciept_Id=50199
AND Item_ID = 19
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e064c0470a86e7e10e293f8bf52c86c377888985
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50199
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50199
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a9bea6f60220605591ca14f5da74fc0ce0c2410b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50293
AND Item_ID = 10)
WHERE Reciept_Id=50293
AND Item_ID = 10
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a9bea6f60220605591ca14f5da74fc0ce0c2410b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50293
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50293
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1839aa490b3cde2e9cdf35593f148a08a48a3a8a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51437
AND Item_ID = 26)
WHERE Reciept_Id=51437
AND Item_ID = 26
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1839aa490b3cde2e9cdf35593f148a08a48a3a8a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51437
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51437
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 60be41530144aec0e8d7547f20d3c927f8a311d4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51453
AND Item_ID = 3)
WHERE Reciept_Id=51453
AND Item_ID = 3
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 60be41530144aec0e8d7547f20d3c927f8a311d4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51453
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51453
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9549a1aa262b5f212db014289f3c5db5b6969207
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51315
AND Item_ID = 22)
WHERE Reciept_Id=51315
AND Item_ID = 22
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9549a1aa262b5f212db014289f3c5db5b6969207
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51315
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51315
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c4b9673915dc596c4cfa28b6a0e6b169fae88e3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51862
AND Item_ID = 12)
WHERE Reciept_Id=51862
AND Item_ID = 12
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c4b9673915dc596c4cfa28b6a0e6b169fae88e3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51862
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51862
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9617558837926337af7a1c0289e4e9be6f5bb0c5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52159
AND Item_ID = 28)
WHERE Reciept_Id=52159
AND Item_ID = 28
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9617558837926337af7a1c0289e4e9be6f5bb0c5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52159
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52159
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86fb0b625113003240507f1fd451eccd9b55ae30
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52159
AND Item_ID = 20)
WHERE Reciept_Id=52159
AND Item_ID = 20
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86fb0b625113003240507f1fd451eccd9b55ae30
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52159
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52159
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec93dfbcc23a26597437fd3c8fdc35ba83625b0c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52172
AND Item_ID = 29)
WHERE Reciept_Id=52172
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec93dfbcc23a26597437fd3c8fdc35ba83625b0c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52172
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52172
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b96eca7b2f9977b67d97ed7ed564bc8840b833c2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52356
AND Item_ID = 29)
WHERE Reciept_Id=52356
AND Item_ID = 29
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b96eca7b2f9977b67d97ed7ed564bc8840b833c2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52356
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52356
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3f1bb5e8dcd64422964042bc69bca86f379b392c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50180
AND Item_ID = 3)
WHERE Reciept_Id=50180
AND Item_ID = 3
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3f1bb5e8dcd64422964042bc69bca86f379b392c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50180
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50180
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4806aacef942f5e95d77068d9f4edd7f4cd6e9ff
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50742
AND Item_ID = 3)
WHERE Reciept_Id=50742
AND Item_ID = 3
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4806aacef942f5e95d77068d9f4edd7f4cd6e9ff
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50742
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50742
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 881eb2a4a7a058fcb0944bf9a773ecd5092fae82
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50742
AND Item_ID = 29)
WHERE Reciept_Id=50742
AND Item_ID = 29
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 881eb2a4a7a058fcb0944bf9a773ecd5092fae82
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50742
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50742
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cef3b7c75e5dc83a3b1c7f448e149316812b0858
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51472
AND Item_ID = 24)
WHERE Reciept_Id=51472
AND Item_ID = 24
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cef3b7c75e5dc83a3b1c7f448e149316812b0858
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51472
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51472
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 818cfc70736a1bee5561a439b3c67d9e10a136d8
UPDATE Assignment1Data 
SET [Item_Quantity]=12
WHERE Reciept_Id=52122
AND Item_ID = 24
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 818cfc70736a1bee5561a439b3c67d9e10a136d8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52122
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52122
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: de0c83dbbf51ce6e8b7889ff0d29c5c7dcaffa3e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52157
AND Item_ID = 21)
WHERE Reciept_Id=52157
AND Item_ID = 21
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: de0c83dbbf51ce6e8b7889ff0d29c5c7dcaffa3e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52157
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52157
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b3b7f0f8fdf897a90609364018e106687eef523b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50781
AND Item_ID = 3)
WHERE Reciept_Id=50781
AND Item_ID = 3
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b3b7f0f8fdf897a90609364018e106687eef523b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50781
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50781
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1bb89d1ee40d9206adf1bdab16005c1c9a331c32
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50022
AND Item_ID = 1)
WHERE Reciept_Id=50022
AND Item_ID = 1
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1bb89d1ee40d9206adf1bdab16005c1c9a331c32
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50022
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50022
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f6cff5464537183eba51f7ca9b2e8a8a1225094a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51616
AND Item_ID = 4)
WHERE Reciept_Id=51616
AND Item_ID = 4
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f6cff5464537183eba51f7ca9b2e8a8a1225094a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51616
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51616
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1580c042b9e3ba6e4208bf1b7844c12887615f1a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51631
AND Item_ID = 26)
WHERE Reciept_Id=51631
AND Item_ID = 26
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1580c042b9e3ba6e4208bf1b7844c12887615f1a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51631
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51631
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b1e02a96466ee2675bf3206e2a70e020afefb72
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52056
AND Item_ID = 29)
WHERE Reciept_Id=52056
AND Item_ID = 29
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b1e02a96466ee2675bf3206e2a70e020afefb72
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52056
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52056
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 336cc0aa19e587c1538527c59fcedb843d49e472
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50057
AND Item_ID = 16)
WHERE Reciept_Id=50057
AND Item_ID = 16
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 336cc0aa19e587c1538527c59fcedb843d49e472
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50057
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50057
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4aa82a4b32f9677aee667359eb9066bc94eba7a5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50303
AND Item_ID = 10)
WHERE Reciept_Id=50303
AND Item_ID = 10
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4aa82a4b32f9677aee667359eb9066bc94eba7a5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50303
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50303
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96dd129eb6594eb3a170f9af2b3c59f3d7abb702
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50947
AND Item_ID = 6)
WHERE Reciept_Id=50947
AND Item_ID = 6
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96dd129eb6594eb3a170f9af2b3c59f3d7abb702
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50947
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50947
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d16114d62e6b46faae57a95ac4fdaa90f4dd240c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51796
AND Item_ID = 12)
WHERE Reciept_Id=51796
AND Item_ID = 12
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d16114d62e6b46faae57a95ac4fdaa90f4dd240c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51796
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51796
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e9563dfb925a497efff82b13a2f0211304c6a375
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50298
AND Item_ID = 2)
WHERE Reciept_Id=50298
AND Item_ID = 2
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e9563dfb925a497efff82b13a2f0211304c6a375
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50298
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50298
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 12182e28ed5f3189a1f24fc6daad1956e747cc71
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51605
AND Item_ID = 25)
WHERE Reciept_Id=51605
AND Item_ID = 25
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 12182e28ed5f3189a1f24fc6daad1956e747cc71
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51605
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51605
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d19aae747e245c0ad456e27825ad703c6b36d1d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51964
AND Item_ID = 14)
WHERE Reciept_Id=51964
AND Item_ID = 14
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d19aae747e245c0ad456e27825ad703c6b36d1d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51964
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51964
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a79ccc05d37fc05f5c481e4be3c37638db332f7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50773
AND Item_ID = 24)
WHERE Reciept_Id=50773
AND Item_ID = 24
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a79ccc05d37fc05f5c481e4be3c37638db332f7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50773
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50773
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f3a34c2e51edf32494c1c252b5690169c2973f80
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50494
AND Item_ID = 6)
WHERE Reciept_Id=50494
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f3a34c2e51edf32494c1c252b5690169c2973f80
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50494
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50494
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f0969df3955977fd4818637cbb9ba3d4c1c48f6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50494
AND Item_ID = 30)
WHERE Reciept_Id=50494
AND Item_ID = 30
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f0969df3955977fd4818637cbb9ba3d4c1c48f6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50494
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50494
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d102c8070741f0a9b7ef3b54d37f9ec13e8f159
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52276
AND Item_ID = 21)
WHERE Reciept_Id=52276
AND Item_ID = 21
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d102c8070741f0a9b7ef3b54d37f9ec13e8f159
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52276
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52276
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dd1601c46ab67736dfc959bed63d308ca5eae4c4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52276
AND Item_ID = 10)
WHERE Reciept_Id=52276
AND Item_ID = 10
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dd1601c46ab67736dfc959bed63d308ca5eae4c4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52276
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52276
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3cf410399bd5b5e963649e7979315f40b79fdd5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52296
AND Item_ID = 11)
WHERE Reciept_Id=52296
AND Item_ID = 11
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3cf410399bd5b5e963649e7979315f40b79fdd5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52296
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52296
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 851ddc2a920a83c1bd4874e2d98081ed3e212632
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52296
AND Item_ID = 3)
WHERE Reciept_Id=52296
AND Item_ID = 3
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 851ddc2a920a83c1bd4874e2d98081ed3e212632
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52296
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52296
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7298bb17d7a34b1fddefdb2da921aef13c20740f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50619
AND Item_ID = 16)
WHERE Reciept_Id=50619
AND Item_ID = 16
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7298bb17d7a34b1fddefdb2da921aef13c20740f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50619
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50619
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f9e46525fa0e32606c897d40bd1435f16b6c9d5a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50619
AND Item_ID = 22)
WHERE Reciept_Id=50619
AND Item_ID = 22
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f9e46525fa0e32606c897d40bd1435f16b6c9d5a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50619
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50619
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e36e7d4547bb4a00c7d6d2afe889a14d98982718
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50937
AND Item_ID = 25)
WHERE Reciept_Id=50937
AND Item_ID = 25
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e36e7d4547bb4a00c7d6d2afe889a14d98982718
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50937
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50937
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7dcaf8c6c0c22454a2580a35d8d8b000c2805e6b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51596
AND Item_ID = 11)
WHERE Reciept_Id=51596
AND Item_ID = 11
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7dcaf8c6c0c22454a2580a35d8d8b000c2805e6b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51596
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51596
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e5512c732aae53f1dc30aaf7bef9a4af9b4bc08e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51596
AND Item_ID = 24)
WHERE Reciept_Id=51596
AND Item_ID = 24
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e5512c732aae53f1dc30aaf7bef9a4af9b4bc08e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51596
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51596
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9cd4c3f21a3c688746ddfe78b05488c43c10bfec
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52117
AND Item_ID = 24)
WHERE Reciept_Id=52117
AND Item_ID = 24
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9cd4c3f21a3c688746ddfe78b05488c43c10bfec
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52117
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52117
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0fb1fdd5d3b7ce3415fedb17def9e47efc4c146d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50290
AND Item_ID = 16)
WHERE Reciept_Id=50290
AND Item_ID = 16
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0fb1fdd5d3b7ce3415fedb17def9e47efc4c146d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50290
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50290
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 45dbe9597a2d3bb4c11e65b31feffdd330107020
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50906
AND Item_ID = 30)
WHERE Reciept_Id=50906
AND Item_ID = 30
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 45dbe9597a2d3bb4c11e65b31feffdd330107020
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50906
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50906
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a7ffa3691e06d06c19df2aa1426921578ce2ca77
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50906
AND Item_ID = 17)
WHERE Reciept_Id=50906
AND Item_ID = 17
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a7ffa3691e06d06c19df2aa1426921578ce2ca77
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50906
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50906
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b6465c61b624b80f63f957b00ed09c1716088b21
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51095
AND Item_ID = 25)
WHERE Reciept_Id=51095
AND Item_ID = 25
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b6465c61b624b80f63f957b00ed09c1716088b21
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51095
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51095
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 25436c4c546ed3189fc1446eacec32879afe56a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51216
AND Item_ID = 14)
WHERE Reciept_Id=51216
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 25436c4c546ed3189fc1446eacec32879afe56a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51216
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51216
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9400f3fb5c5aa9f5bc35df8ad07f8598c1071bcf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51216
AND Item_ID = 4)
WHERE Reciept_Id=51216
AND Item_ID = 4
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9400f3fb5c5aa9f5bc35df8ad07f8598c1071bcf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51216
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51216
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 32cce169e5ca0b43d8553e0b413bccdcb83bbcc9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51216
AND Item_ID = 16)
WHERE Reciept_Id=51216
AND Item_ID = 16
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 32cce169e5ca0b43d8553e0b413bccdcb83bbcc9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51216
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51216
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a46ea7d9b2ce12fe216b21138fea649288f0c5d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51544
AND Item_ID = 21)
WHERE Reciept_Id=51544
AND Item_ID = 21
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a46ea7d9b2ce12fe216b21138fea649288f0c5d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51544
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51544
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 874390f7b4731fa01387c0ba2129b18582aa9dd5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51544
AND Item_ID = 24)
WHERE Reciept_Id=51544
AND Item_ID = 24
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 874390f7b4731fa01387c0ba2129b18582aa9dd5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51544
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51544
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9cd249f742dc53787df8e4e8b77ec0e78c850a09
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=52463
AND Item_ID = 23
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9cd249f742dc53787df8e4e8b77ec0e78c850a09
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52463
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52463
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4a033a37e51364217175a36bbbaa20e41563e935
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50426
AND Item_ID = 23)
WHERE Reciept_Id=50426
AND Item_ID = 23
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4a033a37e51364217175a36bbbaa20e41563e935
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50426
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50426
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e144697ab82704995d3d23e92d984e0be61c11bc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50426
AND Item_ID = 14)
WHERE Reciept_Id=50426
AND Item_ID = 14
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e144697ab82704995d3d23e92d984e0be61c11bc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50426
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50426
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0a4dc4b2ddbc9b1081c3658e68414e30f484a1d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51778
AND Item_ID = 15)
WHERE Reciept_Id=51778
AND Item_ID = 15
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0a4dc4b2ddbc9b1081c3658e68414e30f484a1d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51778
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51778
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7f507b49de86b5537dbbb19414030b20974a8a6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50034
AND Item_ID = 19)
WHERE Reciept_Id=50034
AND Item_ID = 19
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7f507b49de86b5537dbbb19414030b20974a8a6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50034
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50034
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9d24d3c61bbdb159d8c5968c0b8c1fe6c118c64e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50078
AND Item_ID = 1)
WHERE Reciept_Id=50078
AND Item_ID = 1
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9d24d3c61bbdb159d8c5968c0b8c1fe6c118c64e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50078
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50078
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da0c0a7e3475d25e80f8755a8d066223f151580a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51427
AND Item_ID = 1)
WHERE Reciept_Id=51427
AND Item_ID = 1
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da0c0a7e3475d25e80f8755a8d066223f151580a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51427
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51427
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c0102317dface0b86d063ba4366f733e27089f6f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51645
AND Item_ID = 27)
WHERE Reciept_Id=51645
AND Item_ID = 27
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c0102317dface0b86d063ba4366f733e27089f6f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51645
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51645
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c23e21c0d41751978dc99f6e2ccbd1a446359b1b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51911
AND Item_ID = 14)
WHERE Reciept_Id=51911
AND Item_ID = 14
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c23e21c0d41751978dc99f6e2ccbd1a446359b1b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51911
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51911
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4ec91c89eb97b23b0ee9fad678cfc2cbadcf9166
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50007
AND Item_ID = 22)
WHERE Reciept_Id=50007
AND Item_ID = 22
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4ec91c89eb97b23b0ee9fad678cfc2cbadcf9166
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50007
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50007
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db46aec31f0f01d6381e4ecb6d4284e6c2efe079
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50198
AND Item_ID = 27)
WHERE Reciept_Id=50198
AND Item_ID = 27
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db46aec31f0f01d6381e4ecb6d4284e6c2efe079
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50198
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50198
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c6d219ef578892459a84f9db74a9ca572b839e46
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50359
AND Item_ID = 19)
WHERE Reciept_Id=50359
AND Item_ID = 19
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c6d219ef578892459a84f9db74a9ca572b839e46
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50359
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50359
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 89c60c387f7feb43cb02f62c2eea0fe5533aa774
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50878
AND Item_ID = 26)
WHERE Reciept_Id=50878
AND Item_ID = 26
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 89c60c387f7feb43cb02f62c2eea0fe5533aa774
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50878
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50878
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d4e78a304d94a6dd670594ed4b0f8e9f1e50e3ef
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50878
AND Item_ID = 4)
WHERE Reciept_Id=50878
AND Item_ID = 4
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d4e78a304d94a6dd670594ed4b0f8e9f1e50e3ef
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50878
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50878
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1cd9c2389b845adf6b7d1c6a385193e253016e95
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51649
AND Item_ID = 17)
WHERE Reciept_Id=51649
AND Item_ID = 17
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1cd9c2389b845adf6b7d1c6a385193e253016e95
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51649
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51649
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f928ce65d9fc1f1796196fbefb16b4f9b8baad
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52345
AND Item_ID = 27)
WHERE Reciept_Id=52345
AND Item_ID = 27
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f928ce65d9fc1f1796196fbefb16b4f9b8baad
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52345
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52345
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2de505ed4e1ce2017104a2d8c8d636b240dd0017
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50142
AND Item_ID = 8)
WHERE Reciept_Id=50142
AND Item_ID = 8
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2de505ed4e1ce2017104a2d8c8d636b240dd0017
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50142
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50142
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 51ba18828426fae0e9b37b297d1ea27fd3a0f54d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50229
AND Item_ID = 18)
WHERE Reciept_Id=50229
AND Item_ID = 18
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 51ba18828426fae0e9b37b297d1ea27fd3a0f54d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50229
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50229
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92596419ba1af94dbd6be658ec2daff2907b68e2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50229
AND Item_ID = 27)
WHERE Reciept_Id=50229
AND Item_ID = 27
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92596419ba1af94dbd6be658ec2daff2907b68e2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50229
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50229
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 97802c14d71fe137a61420599cd9f68124391b65
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50787
AND Item_ID = 6)
WHERE Reciept_Id=50787
AND Item_ID = 6
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 97802c14d71fe137a61420599cd9f68124391b65
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50787
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50787
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 99c39536ae48f894938a0be63ac7004f3f35cedc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51179
AND Item_ID = 10)
WHERE Reciept_Id=51179
AND Item_ID = 10
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 99c39536ae48f894938a0be63ac7004f3f35cedc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51179
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51179
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1801df2c85cf9b49c8fa3f2c4c0b6f0455486aed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51179
AND Item_ID = 14)
WHERE Reciept_Id=51179
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1801df2c85cf9b49c8fa3f2c4c0b6f0455486aed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51179
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51179
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c9903c20db08b8904fe920a4ede48430858e8b3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51356
AND Item_ID = 16)
WHERE Reciept_Id=51356
AND Item_ID = 16
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c9903c20db08b8904fe920a4ede48430858e8b3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51356
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51356
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f1870d856b0ad37217eedf64db19265aab1736f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50849
AND Item_ID = 14)
WHERE Reciept_Id=50849
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f1870d856b0ad37217eedf64db19265aab1736f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50849
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50849
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e53ce3801e654a0bb33215f08a32f071cbd3878
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50849
AND Item_ID = 7)
WHERE Reciept_Id=50849
AND Item_ID = 7
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e53ce3801e654a0bb33215f08a32f071cbd3878
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50849
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50849
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 42bdd3a740b0b1ebb9ffec8a9d468cdde1df9174
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51431
AND Item_ID = 7)
WHERE Reciept_Id=51431
AND Item_ID = 7
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 42bdd3a740b0b1ebb9ffec8a9d468cdde1df9174
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51431
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51431
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a2d71a010f71a041eb46d7838f3c5b695a38c69
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51837
AND Item_ID = 7)
WHERE Reciept_Id=51837
AND Item_ID = 7
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a2d71a010f71a041eb46d7838f3c5b695a38c69
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51837
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51837
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 303ce679c1f12e487fe944b30070e99689852e1e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52021
AND Item_ID = 1)
WHERE Reciept_Id=52021
AND Item_ID = 1
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 303ce679c1f12e487fe944b30070e99689852e1e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52021
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52021
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b92e98bafd5e5dc1d59ab9a8fa8b7273512f2fa8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52095
AND Item_ID = 5)
WHERE Reciept_Id=52095
AND Item_ID = 5
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b92e98bafd5e5dc1d59ab9a8fa8b7273512f2fa8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52095
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52095
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be97a328cd18dbd9cf1382f0b1a455db9d667e11
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52137
AND Item_ID = 22)
WHERE Reciept_Id=52137
AND Item_ID = 22
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be97a328cd18dbd9cf1382f0b1a455db9d667e11
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52137
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52137
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 588e060daa435c8e9c0495907daa95a3a98cd103
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52137
AND Item_ID = 10)
WHERE Reciept_Id=52137
AND Item_ID = 10
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 588e060daa435c8e9c0495907daa95a3a98cd103
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52137
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52137
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d699ef80171d9e9215ecaa16b0861dc812406749
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52137
AND Item_ID = 5)
WHERE Reciept_Id=52137
AND Item_ID = 5
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d699ef80171d9e9215ecaa16b0861dc812406749
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52137
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52137
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b48fab3a1e7a974b86c59bd104492cfe99d6012
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51173
AND Item_ID = 14)
WHERE Reciept_Id=51173
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b48fab3a1e7a974b86c59bd104492cfe99d6012
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51173
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51173
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7f827d5825b7bb30c7820e3e77f94560053b1a4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50158
AND Item_ID = 10)
WHERE Reciept_Id=50158
AND Item_ID = 10
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7f827d5825b7bb30c7820e3e77f94560053b1a4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50158
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50158
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 974652f17efa918b12329b9bd19282a258895770
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51417
AND Item_ID = 21)
WHERE Reciept_Id=51417
AND Item_ID = 21
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 974652f17efa918b12329b9bd19282a258895770
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51417
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51417
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a29b9f50c344a0f82545e0ab06b13dbcaed3ea7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52014
AND Item_ID = 5)
WHERE Reciept_Id=52014
AND Item_ID = 5
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a29b9f50c344a0f82545e0ab06b13dbcaed3ea7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52014
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52014
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 462f234dab7198d00cb6ff9cdd8dd5e740bddba1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50922
AND Item_ID = 9)
WHERE Reciept_Id=50922
AND Item_ID = 9
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 462f234dab7198d00cb6ff9cdd8dd5e740bddba1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50922
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50922
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 44d47fc1e04b34de2de403bb9e63b83cca023b6a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50922
AND Item_ID = 22)
WHERE Reciept_Id=50922
AND Item_ID = 22
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 44d47fc1e04b34de2de403bb9e63b83cca023b6a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50922
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50922
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f2e1d359b47c95dbb53baef4ee63199f1836fa3b
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=52132
AND Item_ID = 25
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f2e1d359b47c95dbb53baef4ee63199f1836fa3b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52132
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52132
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ea799d7edd422fd6a4189c36dc32f2c48407f044
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51863
AND Item_ID = 14)
WHERE Reciept_Id=51863
AND Item_ID = 14
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ea799d7edd422fd6a4189c36dc32f2c48407f044
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51863
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51863
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cfe8756fc4c0e27005e41b8aef559c82106fa590
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52340
AND Item_ID = 11)
WHERE Reciept_Id=52340
AND Item_ID = 11
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cfe8756fc4c0e27005e41b8aef559c82106fa590
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52340
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52340
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1048b95c70352a1b299b03791227873626ebe559
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52340
AND Item_ID = 15)
WHERE Reciept_Id=52340
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1048b95c70352a1b299b03791227873626ebe559
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52340
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52340
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb45faba14aed93d7f9b02abba2b0a1789d715d5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51228
AND Item_ID = 22)
WHERE Reciept_Id=51228
AND Item_ID = 22
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb45faba14aed93d7f9b02abba2b0a1789d715d5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51228
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51228
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 598459498a1c4bd5be4d965f0b4d794d4c93c342
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51228
AND Item_ID = 14)
WHERE Reciept_Id=51228
AND Item_ID = 14
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 598459498a1c4bd5be4d965f0b4d794d4c93c342
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51228
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51228
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 474fb26012fc77ea69430eecd67a539f2417e3b6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51228
AND Item_ID = 29)
WHERE Reciept_Id=51228
AND Item_ID = 29
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 474fb26012fc77ea69430eecd67a539f2417e3b6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51228
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51228
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 673d8754056574565cab4f6cd816a7f7fe17df79
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50114
AND Item_ID = 5)
WHERE Reciept_Id=50114
AND Item_ID = 5
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 673d8754056574565cab4f6cd816a7f7fe17df79
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50114
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50114
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e6fc9a070e13669e9269ee2d78b5a146726e983
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50160
AND Item_ID = 6)
WHERE Reciept_Id=50160
AND Item_ID = 6
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e6fc9a070e13669e9269ee2d78b5a146726e983
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50160
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50160
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b92914c02b593f4151f82af57907d15ba258af86
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50160
AND Item_ID = 18)
WHERE Reciept_Id=50160
AND Item_ID = 18
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b92914c02b593f4151f82af57907d15ba258af86
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50160
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50160
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4e4a37a628a7e2d5ef564e74b6831ebb0587a829
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50406
AND Item_ID = 8)
WHERE Reciept_Id=50406
AND Item_ID = 8
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4e4a37a628a7e2d5ef564e74b6831ebb0587a829
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50406
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50406
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2b318e6b915d0d5231686b98655e9b0a14b24a3a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51628
AND Item_ID = 14)
WHERE Reciept_Id=51628
AND Item_ID = 14
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2b318e6b915d0d5231686b98655e9b0a14b24a3a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51628
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51628
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7612e3905331bcc83b5d0f9c6ea3deb9a2a29c6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51628
AND Item_ID = 21)
WHERE Reciept_Id=51628
AND Item_ID = 21
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7612e3905331bcc83b5d0f9c6ea3deb9a2a29c6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51628
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51628
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4331b1baafca07453453b411f3125b014f37d3ad
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52070
AND Item_ID = 27)
WHERE Reciept_Id=52070
AND Item_ID = 27
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4331b1baafca07453453b411f3125b014f37d3ad
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52070
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52070
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ab9ac4503afb843f141700d83e2ca396bc7375ef
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=51154
AND Item_ID = 18
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ab9ac4503afb843f141700d83e2ca396bc7375ef
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51154
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51154
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bfa2052cc7aa6aac3e49ab2c23d81158f8d60eda
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51523
AND Item_ID = 26)
WHERE Reciept_Id=51523
AND Item_ID = 26
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bfa2052cc7aa6aac3e49ab2c23d81158f8d60eda
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51523
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51523
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96c99f0d1affcfacbf4473ad6d593a25297cc94e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52000
AND Item_ID = 8)
WHERE Reciept_Id=52000
AND Item_ID = 8
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96c99f0d1affcfacbf4473ad6d593a25297cc94e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52000
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52000
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68660d1cff5b5f73de3011696e26f00c32b435a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51056
AND Item_ID = 18)
WHERE Reciept_Id=51056
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68660d1cff5b5f73de3011696e26f00c32b435a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51056
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51056
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd0da99a72f5d8b3199ab666a1347b4837d371a6
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=51618
AND Item_ID = 19
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd0da99a72f5d8b3199ab666a1347b4837d371a6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51618
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51618
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0d459538a397fb3f25bae17673ec4476c9989369
UPDATE Assignment1Data 
SET [Item_Quantity]=18
WHERE Reciept_Id=51254
AND Item_ID = 18
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0d459538a397fb3f25bae17673ec4476c9989369
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51254
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51254
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f0e846a5f5f6018dc7c95e5cce2c6c7bc01b4a7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51390
AND Item_ID = 6)
WHERE Reciept_Id=51390
AND Item_ID = 6
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f0e846a5f5f6018dc7c95e5cce2c6c7bc01b4a7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51390
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51390
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4b77613f785c9907436d029365777a326d849240
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51776
AND Item_ID = 21)
WHERE Reciept_Id=51776
AND Item_ID = 21
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4b77613f785c9907436d029365777a326d849240
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51776
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51776
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f8d3c3ff12ffe3ffdca514c440d4615c014c3967
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51776
AND Item_ID = 3)
WHERE Reciept_Id=51776
AND Item_ID = 3
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f8d3c3ff12ffe3ffdca514c440d4615c014c3967
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51776
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51776
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87af4602f98ea8687eec40e23a012993ad7c80de
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50121
AND Item_ID = 8)
WHERE Reciept_Id=50121
AND Item_ID = 8
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87af4602f98ea8687eec40e23a012993ad7c80de
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50121
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50121
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3b464a1e35d319c93161cd2db09039366beb37ed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50265
AND Item_ID = 2)
WHERE Reciept_Id=50265
AND Item_ID = 2
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3b464a1e35d319c93161cd2db09039366beb37ed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50265
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50265
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 554ed408e3407c3422a5024cc71f24ccd98da7fb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50807
AND Item_ID = 14)
WHERE Reciept_Id=50807
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 554ed408e3407c3422a5024cc71f24ccd98da7fb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50807
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50807
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6105b2fe9624c66637ac7f96313e9a749805c9a9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51581
AND Item_ID = 8)
WHERE Reciept_Id=51581
AND Item_ID = 8
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6105b2fe9624c66637ac7f96313e9a749805c9a9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51581
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51581
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7e6f2c60f9f74ca4c884f94cc09ef9c1e6953526
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50077
AND Item_ID = 7)
WHERE Reciept_Id=50077
AND Item_ID = 7
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7e6f2c60f9f74ca4c884f94cc09ef9c1e6953526
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50077
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50077
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22d7515d0884bb9f69db1ad6f9689594bdce5bf6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51712
AND Item_ID = 3)
WHERE Reciept_Id=51712
AND Item_ID = 3
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22d7515d0884bb9f69db1ad6f9689594bdce5bf6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51712
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51712
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e421421942292acff9eef668557987328a387bbb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51712
AND Item_ID = 10)
WHERE Reciept_Id=51712
AND Item_ID = 10
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e421421942292acff9eef668557987328a387bbb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51712
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51712
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59bd58f9cd0614a13771c5025bc6d479b28a17ad
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52400
AND Item_ID = 30)
WHERE Reciept_Id=52400
AND Item_ID = 30
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59bd58f9cd0614a13771c5025bc6d479b28a17ad
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52400
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52400
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 56b7777f281fa0eb8af2ea2da2a64a3052d26024
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50810
AND Item_ID = 3)
WHERE Reciept_Id=50810
AND Item_ID = 3
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 56b7777f281fa0eb8af2ea2da2a64a3052d26024
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50810
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50810
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2defceaaa5545fdf357e5bc4ab5b89c11b22d095
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50810
AND Item_ID = 30)
WHERE Reciept_Id=50810
AND Item_ID = 30
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2defceaaa5545fdf357e5bc4ab5b89c11b22d095
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50810
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50810
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b65d111e6ee59d834a50ec0df2fdbc6b048af97
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50883
AND Item_ID = 22)
WHERE Reciept_Id=50883
AND Item_ID = 22
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b65d111e6ee59d834a50ec0df2fdbc6b048af97
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50883
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50883
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3374f56d1f44bcfe4c4b7f670d683c91fdca7f59
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50883
AND Item_ID = 15)
WHERE Reciept_Id=50883
AND Item_ID = 15
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3374f56d1f44bcfe4c4b7f670d683c91fdca7f59
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50883
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50883
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 02fcc84bbcfb112327fb16f681aeaf9288b3bcc7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50883
AND Item_ID = 19)
WHERE Reciept_Id=50883
AND Item_ID = 19
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 02fcc84bbcfb112327fb16f681aeaf9288b3bcc7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50883
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50883
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2edc4625dff923adce4481c2d6d3cc6ff39152ab
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51410
AND Item_ID = 26)
WHERE Reciept_Id=51410
AND Item_ID = 26
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2edc4625dff923adce4481c2d6d3cc6ff39152ab
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51410
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51410
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3ae4fb41a55dd8c22cad93671e24b858bc67ff9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51410
AND Item_ID = 17)
WHERE Reciept_Id=51410
AND Item_ID = 17
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3ae4fb41a55dd8c22cad93671e24b858bc67ff9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51410
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51410
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7174d297b6990a934b2ba90cad72a9a38da930c4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51800
AND Item_ID = 4)
WHERE Reciept_Id=51800
AND Item_ID = 4
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7174d297b6990a934b2ba90cad72a9a38da930c4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51800
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51800
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3e77ef1270544c2519aa1852cb9d5fd96a7f6516
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50399
AND Item_ID = 9)
WHERE Reciept_Id=50399
AND Item_ID = 9
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3e77ef1270544c2519aa1852cb9d5fd96a7f6516
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50399
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50399
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 41fb06cb352a3be507d7d5fa75142d060888a4a3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51141
AND Item_ID = 2)
WHERE Reciept_Id=51141
AND Item_ID = 2
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 41fb06cb352a3be507d7d5fa75142d060888a4a3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51141
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51141
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 078268762ec68c8c3afd1d7940a8a50add58359c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51142
AND Item_ID = 4)
WHERE Reciept_Id=51142
AND Item_ID = 4
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 078268762ec68c8c3afd1d7940a8a50add58359c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51142
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51142
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 03539565bc3d3e60dca52d9a81cb5ba478e04661
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50045
AND Item_ID = 19)
WHERE Reciept_Id=50045
AND Item_ID = 19
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 03539565bc3d3e60dca52d9a81cb5ba478e04661
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50045
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50045
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ca97ff79f2b2f67e2fe8e90e6b17f994139265f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50339
AND Item_ID = 6)
WHERE Reciept_Id=50339
AND Item_ID = 6
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ca97ff79f2b2f67e2fe8e90e6b17f994139265f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50339
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50339
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 540299976f8ee401fde2c51a671a063179d8f7e1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50453
AND Item_ID = 3)
WHERE Reciept_Id=50453
AND Item_ID = 3
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 540299976f8ee401fde2c51a671a063179d8f7e1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50453
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50453
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e191bd1fdd0764a2e356f36252526dcdbd3bf8c5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52355
AND Item_ID = 22)
WHERE Reciept_Id=52355
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e191bd1fdd0764a2e356f36252526dcdbd3bf8c5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52355
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52355
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 494e9b823b0a99002e3d48ea573a2b29240909f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50001
AND Item_ID = 17)
WHERE Reciept_Id=50001
AND Item_ID = 17
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 494e9b823b0a99002e3d48ea573a2b29240909f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50001
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50001
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ab3d024d11ae474544b41e47dc9d5467927bc922
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50689
AND Item_ID = 16)
WHERE Reciept_Id=50689
AND Item_ID = 16
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ab3d024d11ae474544b41e47dc9d5467927bc922
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50689
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50689
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 55f6c8366f3ccc756eb364d0cd6177876dbd0ad7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50893
AND Item_ID = 18)
WHERE Reciept_Id=50893
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 55f6c8366f3ccc756eb364d0cd6177876dbd0ad7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50893
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50893
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 82ec9a42942f3bc73e71148ad374c22ea95898ab
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50346
AND Item_ID = 20)
WHERE Reciept_Id=50346
AND Item_ID = 20
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 82ec9a42942f3bc73e71148ad374c22ea95898ab
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50346
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50346
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a8759191fd98e097eaa620c56d9d281f9ab35f89
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50343
AND Item_ID = 2)
WHERE Reciept_Id=50343
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a8759191fd98e097eaa620c56d9d281f9ab35f89
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50343
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50343
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f98e244c5295931c465fbdfb4ceccd3967ba81f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50473
AND Item_ID = 18)
WHERE Reciept_Id=50473
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f98e244c5295931c465fbdfb4ceccd3967ba81f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50473
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50473
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f03cfcb5f4ccec51e3a4edf5ed7f0d1a3c9966a1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50824
AND Item_ID = 16)
WHERE Reciept_Id=50824
AND Item_ID = 16
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f03cfcb5f4ccec51e3a4edf5ed7f0d1a3c9966a1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50824
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50824
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06d7c13e1ff7e9edbdab588828fcead6b3dd1321
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50824
AND Item_ID = 21)
WHERE Reciept_Id=50824
AND Item_ID = 21
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06d7c13e1ff7e9edbdab588828fcead6b3dd1321
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50824
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50824
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d20f627281dac3b40938c24b99334e68122d60d4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51374
AND Item_ID = 20)
WHERE Reciept_Id=51374
AND Item_ID = 20
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d20f627281dac3b40938c24b99334e68122d60d4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51374
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51374
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40243f12cde99b265b8a950b72bf07b78fbf6b15
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52002
AND Item_ID = 15)
WHERE Reciept_Id=52002
AND Item_ID = 15
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40243f12cde99b265b8a950b72bf07b78fbf6b15
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52002
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52002
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a5979dd1ac6599bb3adb2da07665f595273fd727
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52438
AND Item_ID = 14)
WHERE Reciept_Id=52438
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a5979dd1ac6599bb3adb2da07665f595273fd727
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52438
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52438
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 95c9d973180fd5f28473b1e33df548416b1caae9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50187
AND Item_ID = 15)
WHERE Reciept_Id=50187
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 95c9d973180fd5f28473b1e33df548416b1caae9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50187
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50187
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 012fae712c7cb24fe938066dd42578745262bb79
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51575
AND Item_ID = 28)
WHERE Reciept_Id=51575
AND Item_ID = 28
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 012fae712c7cb24fe938066dd42578745262bb79
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51575
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51575
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 534bd62f1a2d5583fac420965fe1744801a89f91
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52210
AND Item_ID = 23)
WHERE Reciept_Id=52210
AND Item_ID = 23
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 534bd62f1a2d5583fac420965fe1744801a89f91
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52210
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52210
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a43484c65d4af8bf5ddec8dac408294a403393c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52210
AND Item_ID = 18)
WHERE Reciept_Id=52210
AND Item_ID = 18
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a43484c65d4af8bf5ddec8dac408294a403393c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52210
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52210
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64fa6ee669ea08e8d1f778d94cc78d3d56e27bcd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52479
AND Item_ID = 30)
WHERE Reciept_Id=52479
AND Item_ID = 30
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64fa6ee669ea08e8d1f778d94cc78d3d56e27bcd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52479
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52479
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fc7c0b6a8d9f8e4027aa5accb3e2e14c08e5f638
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50920
AND Item_ID = 10)
WHERE Reciept_Id=50920
AND Item_ID = 10
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fc7c0b6a8d9f8e4027aa5accb3e2e14c08e5f638
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50920
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50920
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3c0717cdfa40a176ce10d8f2ea01f11870e74bee
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50505
AND Item_ID = 12)
WHERE Reciept_Id=50505
AND Item_ID = 12
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3c0717cdfa40a176ce10d8f2ea01f11870e74bee
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50505
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50505
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7eec5307adab13d9a39ca692c7ec75ff5f087782
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50848
AND Item_ID = 13)
WHERE Reciept_Id=50848
AND Item_ID = 13
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7eec5307adab13d9a39ca692c7ec75ff5f087782
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50848
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50848
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b16c5d7773f3ab23df021f4e4eae3da8a51ce628
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=50848
AND Item_ID = 4
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b16c5d7773f3ab23df021f4e4eae3da8a51ce628
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50848
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50848
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 318c2e0720489496c29fa45f13312cb271180697
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51771
AND Item_ID = 20)
WHERE Reciept_Id=51771
AND Item_ID = 20
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 318c2e0720489496c29fa45f13312cb271180697
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51771
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51771
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d33c7bd892a0fe3e7c4ea77fb0f2e512c069081e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51941
AND Item_ID = 20)
WHERE Reciept_Id=51941
AND Item_ID = 20
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d33c7bd892a0fe3e7c4ea77fb0f2e512c069081e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51941
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51941
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f40c21b6e4a61042192ec2470ae2a952c1d2bb5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52439
AND Item_ID = 19)
WHERE Reciept_Id=52439
AND Item_ID = 19
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f40c21b6e4a61042192ec2470ae2a952c1d2bb5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52439
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52439
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 179dbf699a84f8defb87a60f55706b429ebf0d0e
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=50668
AND Item_ID = 23
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 179dbf699a84f8defb87a60f55706b429ebf0d0e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50668
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50668
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 37873b8b94968fc1a8311cedc23ea3b6db536455
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50668
AND Item_ID = 29)
WHERE Reciept_Id=50668
AND Item_ID = 29
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 37873b8b94968fc1a8311cedc23ea3b6db536455
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50668
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50668
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 39e3be81c78e6d75d1424111770873efd501fd39
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50709
AND Item_ID = 14)
WHERE Reciept_Id=50709
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 39e3be81c78e6d75d1424111770873efd501fd39
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50709
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50709
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e050d09c50c5652598393130194ad202320e9e5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51919
AND Item_ID = 22)
WHERE Reciept_Id=51919
AND Item_ID = 22
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e050d09c50c5652598393130194ad202320e9e5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51919
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51919
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a9506c777fa0b514e1883fae2fb25d413b91800
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52068
AND Item_ID = 10)
WHERE Reciept_Id=52068
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a9506c777fa0b514e1883fae2fb25d413b91800
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52068
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52068
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8073adefea996e07fd427ce0a6b37614e1cb05e5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50101
AND Item_ID = 12)
WHERE Reciept_Id=50101
AND Item_ID = 12
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8073adefea996e07fd427ce0a6b37614e1cb05e5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50101
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50101
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ca2d82ba59f7de5edcd83c792ba48cd9a5e43d5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50101
AND Item_ID = 11)
WHERE Reciept_Id=50101
AND Item_ID = 11
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ca2d82ba59f7de5edcd83c792ba48cd9a5e43d5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50101
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50101
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 105bedd41e83c35cfa2d7ca90d71f170d32986db
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51177
AND Item_ID = 15)
WHERE Reciept_Id=51177
AND Item_ID = 15
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 105bedd41e83c35cfa2d7ca90d71f170d32986db
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51177
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51177
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5074a03c6a44029e6bbde97804274dde509878f1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51267
AND Item_ID = 29)
WHERE Reciept_Id=51267
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5074a03c6a44029e6bbde97804274dde509878f1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51267
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51267
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1c4a30e55700ea1899d9d7c41e20b7c7cfb321d6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51595
AND Item_ID = 5)
WHERE Reciept_Id=51595
AND Item_ID = 5
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1c4a30e55700ea1899d9d7c41e20b7c7cfb321d6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51595
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51595
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7aecf77cd4bc1438d4b19ca8323ec257e0c909fe
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51595
AND Item_ID = 8)
WHERE Reciept_Id=51595
AND Item_ID = 8
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7aecf77cd4bc1438d4b19ca8323ec257e0c909fe
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51595
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51595
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49fe4fffc6d0b56882776b988b94f550e32ecd56
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51885
AND Item_ID = 21)
WHERE Reciept_Id=51885
AND Item_ID = 21
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49fe4fffc6d0b56882776b988b94f550e32ecd56
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51885
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51885
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06d495c7be472eb51820d7d588df06992ff9e128
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51180
AND Item_ID = 22)
WHERE Reciept_Id=51180
AND Item_ID = 22
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06d495c7be472eb51820d7d588df06992ff9e128
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51180
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51180
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0654862c54e04a0fc47c8548717f356e0584277a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51304
AND Item_ID = 9)
WHERE Reciept_Id=51304
AND Item_ID = 9
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0654862c54e04a0fc47c8548717f356e0584277a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51304
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51304
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ba0e4232bd389cbf136f799a0009f1e7e1e788c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51304
AND Item_ID = 25)
WHERE Reciept_Id=51304
AND Item_ID = 25
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ba0e4232bd389cbf136f799a0009f1e7e1e788c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51304
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51304
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f25aa1c49380b95a43eb9864cab202c67b24a4e9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52046
AND Item_ID = 22)
WHERE Reciept_Id=52046
AND Item_ID = 22
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f25aa1c49380b95a43eb9864cab202c67b24a4e9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52046
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52046
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 97b7a060b08a1b59fd50197ac41c5341b1513967
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50514
AND Item_ID = 4)
WHERE Reciept_Id=50514
AND Item_ID = 4
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 97b7a060b08a1b59fd50197ac41c5341b1513967
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50514
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50514
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d71b897c912af626b254436e9b4050231204278e
UPDATE Assignment1Data 
SET [Item_Quantity]=6
WHERE Reciept_Id=50514
AND Item_ID = 26
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d71b897c912af626b254436e9b4050231204278e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50514
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50514
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15b36025ae75c865e5e077babe1f1568c4a2aed1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50514
AND Item_ID = 10)
WHERE Reciept_Id=50514
AND Item_ID = 10
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15b36025ae75c865e5e077babe1f1568c4a2aed1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50514
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50514
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be2a4cc75dbe60bcc0b7cecea9dcecbf43be161b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50757
AND Item_ID = 28)
WHERE Reciept_Id=50757
AND Item_ID = 28
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be2a4cc75dbe60bcc0b7cecea9dcecbf43be161b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50757
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50757
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a307ab7a9289a1aa328815b28c6579d3cd2f2e94
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50855
AND Item_ID = 9)
WHERE Reciept_Id=50855
AND Item_ID = 9
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a307ab7a9289a1aa328815b28c6579d3cd2f2e94
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50855
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50855
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d232537b8cf53919a93f439e0dde7acaf452ee62
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51341
AND Item_ID = 6)
WHERE Reciept_Id=51341
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d232537b8cf53919a93f439e0dde7acaf452ee62
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51341
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51341
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 72f5233a5195887d5cbaeae25650850b2ed5bbdf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51341
AND Item_ID = 4)
WHERE Reciept_Id=51341
AND Item_ID = 4
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 72f5233a5195887d5cbaeae25650850b2ed5bbdf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51341
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51341
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bbb555b69110e468be229756d7c124b7c4cbe168
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51341
AND Item_ID = 21)
WHERE Reciept_Id=51341
AND Item_ID = 21
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bbb555b69110e468be229756d7c124b7c4cbe168
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51341
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51341
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ba6aaded350e1505018a4a1cefa7a0b635ed6b8a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52314
AND Item_ID = 6)
WHERE Reciept_Id=52314
AND Item_ID = 6
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ba6aaded350e1505018a4a1cefa7a0b635ed6b8a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52314
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52314
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6181d82c708c4a9644cd7739b9db8b51e32cd516
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51155
AND Item_ID = 9)
WHERE Reciept_Id=51155
AND Item_ID = 9
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6181d82c708c4a9644cd7739b9db8b51e32cd516
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51155
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51155
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a445ca0eb3e2ec76dca1151008b8caab3f819e12
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51014
AND Item_ID = 12)
WHERE Reciept_Id=51014
AND Item_ID = 12
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a445ca0eb3e2ec76dca1151008b8caab3f819e12
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51014
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51014
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19fc6e0b77eb0fa9d10902cbf677112266e4610a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51250
AND Item_ID = 12)
WHERE Reciept_Id=51250
AND Item_ID = 12
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19fc6e0b77eb0fa9d10902cbf677112266e4610a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51250
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51250
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a8f950dd28f89a7ea7cf0bfd128df1df6a29017b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51250
AND Item_ID = 29)
WHERE Reciept_Id=51250
AND Item_ID = 29
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a8f950dd28f89a7ea7cf0bfd128df1df6a29017b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51250
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51250
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e651fe61787e67c58b453f75b449c1d52bb718a
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=51053
AND Item_ID = 3
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e651fe61787e67c58b453f75b449c1d52bb718a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51053
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51053
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15283a5e0f80bbe1701863386cfd550c845e55dd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51053
AND Item_ID = 23)
WHERE Reciept_Id=51053
AND Item_ID = 23
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15283a5e0f80bbe1701863386cfd550c845e55dd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51053
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51053
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7621c8c5125ffa209fde58c3269f9c28bc53289b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52373
AND Item_ID = 26)
WHERE Reciept_Id=52373
AND Item_ID = 26
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7621c8c5125ffa209fde58c3269f9c28bc53289b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52373
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52373
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 65a4374e20a10a56152c5e179c3ce535353997ac
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50464
AND Item_ID = 19)
WHERE Reciept_Id=50464
AND Item_ID = 19
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 65a4374e20a10a56152c5e179c3ce535353997ac
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50464
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50464
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ea7382154a3d7819859068877c46947b0d58208
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51446
AND Item_ID = 10)
WHERE Reciept_Id=51446
AND Item_ID = 10
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ea7382154a3d7819859068877c46947b0d58208
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51446
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51446
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 426351d62f9b675c9d402ee3f74e12125b447e7b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50774
AND Item_ID = 22)
WHERE Reciept_Id=50774
AND Item_ID = 22
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 426351d62f9b675c9d402ee3f74e12125b447e7b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50774
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50774
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7d4dd9535533193857ab527f4136904d51964db5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50774
AND Item_ID = 17)
WHERE Reciept_Id=50774
AND Item_ID = 17
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7d4dd9535533193857ab527f4136904d51964db5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50774
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50774
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ce3057275eb31520cd849276bde100b3524bab0b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51244
AND Item_ID = 29)
WHERE Reciept_Id=51244
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ce3057275eb31520cd849276bde100b3524bab0b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51244
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51244
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 48e40ca9b66345651dd645c9e8b05176c4b0bb14
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52010
AND Item_ID = 25)
WHERE Reciept_Id=52010
AND Item_ID = 25
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 48e40ca9b66345651dd645c9e8b05176c4b0bb14
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52010
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52010
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ec27847dce32e768790f9c9d3325119c53f055b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50046
AND Item_ID = 15)
WHERE Reciept_Id=50046
AND Item_ID = 15
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ec27847dce32e768790f9c9d3325119c53f055b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50046
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50046
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16daeeec4ad9bbb51afc8909ce12aba007e7895e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50256
AND Item_ID = 7)
WHERE Reciept_Id=50256
AND Item_ID = 7
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16daeeec4ad9bbb51afc8909ce12aba007e7895e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50256
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50256
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d61206015c59da9474627efd499ca64e3b6ca184
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50504
AND Item_ID = 2)
WHERE Reciept_Id=50504
AND Item_ID = 2
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d61206015c59da9474627efd499ca64e3b6ca184
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50504
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50504
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f1f650e01762998aeb2e0940c70483a9fbe4cf1c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50300
AND Item_ID = 20)
WHERE Reciept_Id=50300
AND Item_ID = 20
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f1f650e01762998aeb2e0940c70483a9fbe4cf1c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50300
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50300
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f17b159d86a97add0682511ce43feeec128b262b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50488
AND Item_ID = 8)
WHERE Reciept_Id=50488
AND Item_ID = 8
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f17b159d86a97add0682511ce43feeec128b262b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50488
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50488
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2e9601b5ee093d65dbb7f7137a87dae13d4e3b9c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50488
AND Item_ID = 12)
WHERE Reciept_Id=50488
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2e9601b5ee093d65dbb7f7137a87dae13d4e3b9c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50488
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50488
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19864840384ec31c201063364e4a466360d61fb5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50618
AND Item_ID = 12)
WHERE Reciept_Id=50618
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19864840384ec31c201063364e4a466360d61fb5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50618
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50618
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7faf326027dfed47e119514030e47647bd41942c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50630
AND Item_ID = 26)
WHERE Reciept_Id=50630
AND Item_ID = 26
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7faf326027dfed47e119514030e47647bd41942c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50630
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50630
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bfd07d015b2b1c55c4b105cf5227040c28397660
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51852
AND Item_ID = 20)
WHERE Reciept_Id=51852
AND Item_ID = 20
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bfd07d015b2b1c55c4b105cf5227040c28397660
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51852
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51852
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e7fd50cbbfad845072235f234369c24cadec7d25
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=51852
AND Item_ID = 19
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e7fd50cbbfad845072235f234369c24cadec7d25
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51852
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51852
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b472fafdd05310b020039c545c6587b0f1c1c350
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52023
AND Item_ID = 25)
WHERE Reciept_Id=52023
AND Item_ID = 25
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b472fafdd05310b020039c545c6587b0f1c1c350
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52023
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52023
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b40f477390fd946c8bc8dff5bbde7325f1765f63
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50813
AND Item_ID = 3)
WHERE Reciept_Id=50813
AND Item_ID = 3
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b40f477390fd946c8bc8dff5bbde7325f1765f63
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50813
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50813
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a584726ed5c47df5a86b0ea8d6f7e37562d5bb0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50813
AND Item_ID = 26)
WHERE Reciept_Id=50813
AND Item_ID = 26
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a584726ed5c47df5a86b0ea8d6f7e37562d5bb0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50813
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50813
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e7a6751da6ae7a9939d6cbcfbb10ddd920c18bd0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51702
AND Item_ID = 11)
WHERE Reciept_Id=51702
AND Item_ID = 11
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e7a6751da6ae7a9939d6cbcfbb10ddd920c18bd0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51702
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51702
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a748543b99b0e93e00bfa4d1ea644929ebadf410
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50188
AND Item_ID = 26)
WHERE Reciept_Id=50188
AND Item_ID = 26
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a748543b99b0e93e00bfa4d1ea644929ebadf410
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50188
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50188
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a71e00ca721fac29414e76e7bbc9ae25ef91e70c
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=52164
AND Item_ID = 19
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a71e00ca721fac29414e76e7bbc9ae25ef91e70c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52164
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52164
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9acb18d34673f7bfcf289e5ee4f1b27279e67d37
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50118
AND Item_ID = 19)
WHERE Reciept_Id=50118
AND Item_ID = 19
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9acb18d34673f7bfcf289e5ee4f1b27279e67d37
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50118
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50118
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 01638236d78c9755d184a02bb0c85f6e5058b0e0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50454
AND Item_ID = 15)
WHERE Reciept_Id=50454
AND Item_ID = 15
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 01638236d78c9755d184a02bb0c85f6e5058b0e0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50454
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50454
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 88da3c44733a3ee8b843e8c2943ddecb43086ee5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51042
AND Item_ID = 21)
WHERE Reciept_Id=51042
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 88da3c44733a3ee8b843e8c2943ddecb43086ee5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51042
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51042
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c440005962d1654533375dd2b2f7b2be1db9024c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51109
AND Item_ID = 9)
WHERE Reciept_Id=51109
AND Item_ID = 9
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c440005962d1654533375dd2b2f7b2be1db9024c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51109
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51109
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ed43c7d40141f2109a48499c913e165ed1a38758
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51361
AND Item_ID = 9)
WHERE Reciept_Id=51361
AND Item_ID = 9
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ed43c7d40141f2109a48499c913e165ed1a38758
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51361
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51361
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5123a0ef5e4292827299820d420d5f65cc0f1fa7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51361
AND Item_ID = 7)
WHERE Reciept_Id=51361
AND Item_ID = 7
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5123a0ef5e4292827299820d420d5f65cc0f1fa7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51361
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51361
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b73cdb28a3b2e418215cbaf51a9510e9d4a684ad
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52489
AND Item_ID = 7)
WHERE Reciept_Id=52489
AND Item_ID = 7
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b73cdb28a3b2e418215cbaf51a9510e9d4a684ad
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52489
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52489
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f3252c65d40ed61ba6b5d1bbf7dc430e05f78c69
UPDATE Assignment1Data 
SET [Item_Quantity]=12
WHERE Reciept_Id=52489
AND Item_ID = 25
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f3252c65d40ed61ba6b5d1bbf7dc430e05f78c69
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52489
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52489
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a87ba6e13de782567144d5edc2d51284fa58c5e0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52178
AND Item_ID = 2)
WHERE Reciept_Id=52178
AND Item_ID = 2
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a87ba6e13de782567144d5edc2d51284fa58c5e0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52178
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52178
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9cdda4b2a1bc5b0de06f26e51532f131195e4bf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51443
AND Item_ID = 2)
WHERE Reciept_Id=51443
AND Item_ID = 2
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9cdda4b2a1bc5b0de06f26e51532f131195e4bf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51443
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51443
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 546253e97dca588ac2060324cfbd17b90cfeeb3a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51443
AND Item_ID = 30)
WHERE Reciept_Id=51443
AND Item_ID = 30
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 546253e97dca588ac2060324cfbd17b90cfeeb3a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51443
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51443
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ee3d2ff0c6bb43a29ed233399e5967fb77dc28df
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52086
AND Item_ID = 18)
WHERE Reciept_Id=52086
AND Item_ID = 18
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ee3d2ff0c6bb43a29ed233399e5967fb77dc28df
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52086
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52086
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e46df7f5cacaea7f858b8c9830fbd062ac3b78e5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50013
AND Item_ID = 29)
WHERE Reciept_Id=50013
AND Item_ID = 29
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e46df7f5cacaea7f858b8c9830fbd062ac3b78e5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50013
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50013
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f01751c290348af9cf6e511e370f445e7039aed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51040
AND Item_ID = 3)
WHERE Reciept_Id=51040
AND Item_ID = 3
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f01751c290348af9cf6e511e370f445e7039aed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51040
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51040
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e9afc09c40bdd56c1919384709c6d2b95303ee6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51246
AND Item_ID = 28)
WHERE Reciept_Id=51246
AND Item_ID = 28
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e9afc09c40bdd56c1919384709c6d2b95303ee6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51246
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51246
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e412c6143b2dfff7e286fc5b27083019e36c73e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51260
AND Item_ID = 26)
WHERE Reciept_Id=51260
AND Item_ID = 26
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e412c6143b2dfff7e286fc5b27083019e36c73e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51260
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51260
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d4af57b404b1c4cee3e5b8e41860d1ea3a8dbd88
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51287
AND Item_ID = 28)
WHERE Reciept_Id=51287
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d4af57b404b1c4cee3e5b8e41860d1ea3a8dbd88
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51287
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51287
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68b36a35aee618ae709bb8c4282cc4da399db841
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50094
AND Item_ID = 16)
WHERE Reciept_Id=50094
AND Item_ID = 16
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68b36a35aee618ae709bb8c4282cc4da399db841
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50094
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50094
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7857cdc17bcd655c8cc520229987b4738c5a8e52
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50635
AND Item_ID = 11)
WHERE Reciept_Id=50635
AND Item_ID = 11
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7857cdc17bcd655c8cc520229987b4738c5a8e52
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50635
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50635
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 02f74d0a1f7f06cb49068156e23644bc7ada7a88
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52065
AND Item_ID = 14)
WHERE Reciept_Id=52065
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 02f74d0a1f7f06cb49068156e23644bc7ada7a88
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52065
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52065
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5e2ed8e63714e2f3f9c6865b67d941955274b365
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51436
AND Item_ID = 3)
WHERE Reciept_Id=51436
AND Item_ID = 3
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5e2ed8e63714e2f3f9c6865b67d941955274b365
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51436
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51436
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 45ac2760097a05b2d39a8a602f8edbf0e5e9fb0b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50119
AND Item_ID = 29)
WHERE Reciept_Id=50119
AND Item_ID = 29
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 45ac2760097a05b2d39a8a602f8edbf0e5e9fb0b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50119
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50119
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4bf70de8190b357029d4cab3640a84b2841ba78c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51978
AND Item_ID = 25)
WHERE Reciept_Id=51978
AND Item_ID = 25
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4bf70de8190b357029d4cab3640a84b2841ba78c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51978
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51978
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b4595da7fa32a9b03a7e91437e625cc1260d57f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51978
AND Item_ID = 20)
WHERE Reciept_Id=51978
AND Item_ID = 20
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b4595da7fa32a9b03a7e91437e625cc1260d57f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51978
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51978
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a278098d02bba62ab8aedcc40d3a2c80fb4254c2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50204
AND Item_ID = 15)
WHERE Reciept_Id=50204
AND Item_ID = 15
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a278098d02bba62ab8aedcc40d3a2c80fb4254c2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50204
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50204
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cbe716cc4b6ef8c462cc989abdc0134435e7ac1e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51136
AND Item_ID = 2)
WHERE Reciept_Id=51136
AND Item_ID = 2
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cbe716cc4b6ef8c462cc989abdc0134435e7ac1e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51136
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51136
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75d369ed2a6e9bcba01252a885ab99edc5c17816
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51844
AND Item_ID = 30)
WHERE Reciept_Id=51844
AND Item_ID = 30
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75d369ed2a6e9bcba01252a885ab99edc5c17816
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51844
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51844
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5874fa4e65e77719aba722e4e5bcd4916d7309a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51844
AND Item_ID = 8)
WHERE Reciept_Id=51844
AND Item_ID = 8
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5874fa4e65e77719aba722e4e5bcd4916d7309a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51844
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51844
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 603ea08907139fde2fae70bc7878776865624418
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51869
AND Item_ID = 11)
WHERE Reciept_Id=51869
AND Item_ID = 11
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 603ea08907139fde2fae70bc7878776865624418
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51869
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51869
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 11f350386d4867fecf37ee66124f8aa60ab0f614
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50010
AND Item_ID = 24)
WHERE Reciept_Id=50010
AND Item_ID = 24
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 11f350386d4867fecf37ee66124f8aa60ab0f614
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50010
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50010
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 48ff2bdf496e0a333b1489640e757b66101f34ed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50010
AND Item_ID = 9)
WHERE Reciept_Id=50010
AND Item_ID = 9
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 48ff2bdf496e0a333b1489640e757b66101f34ed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50010
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50010
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1817b623c7818c95ccf5efb2a53931ea12c7c96b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50374
AND Item_ID = 7)
WHERE Reciept_Id=50374
AND Item_ID = 7
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1817b623c7818c95ccf5efb2a53931ea12c7c96b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50374
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50374
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b4f8ab0c148357f8f23a8923d61f44b5c8f3092
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50670
AND Item_ID = 23)
WHERE Reciept_Id=50670
AND Item_ID = 23
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b4f8ab0c148357f8f23a8923d61f44b5c8f3092
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50670
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50670
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 31ff21bf35b0d7e9ccaa85333147c7f04cea4535
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52038
AND Item_ID = 28)
WHERE Reciept_Id=52038
AND Item_ID = 28
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 31ff21bf35b0d7e9ccaa85333147c7f04cea4535
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52038
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52038
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3e3b4c17c7b954c8f79f70ce845805c2b8cddc12
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52206
AND Item_ID = 2)
WHERE Reciept_Id=52206
AND Item_ID = 2
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3e3b4c17c7b954c8f79f70ce845805c2b8cddc12
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52206
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52206
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 977fad7a49b9ded875cc3638c527a16f5ff0babb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51320
AND Item_ID = 13)
WHERE Reciept_Id=51320
AND Item_ID = 13
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 977fad7a49b9ded875cc3638c527a16f5ff0babb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51320
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51320
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 765e4628b9c10ad2022b41b76597eb0adca7fa96
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50032
AND Item_ID = 24)
WHERE Reciept_Id=50032
AND Item_ID = 24
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 765e4628b9c10ad2022b41b76597eb0adca7fa96
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50032
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50032
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71b9e3bf537cc5429e328bb0ce5fa895d1e55f31
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51004
AND Item_ID = 20)
WHERE Reciept_Id=51004
AND Item_ID = 20
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71b9e3bf537cc5429e328bb0ce5fa895d1e55f31
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51004
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51004
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9009aa23b09b8f801303d1b023adeb5a4fe5c244
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50286
AND Item_ID = 28)
WHERE Reciept_Id=50286
AND Item_ID = 28
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9009aa23b09b8f801303d1b023adeb5a4fe5c244
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50286
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50286
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1485fc5c85d2d0617ae465ee598c74bf695bb8d4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51429
AND Item_ID = 22)
WHERE Reciept_Id=51429
AND Item_ID = 22
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1485fc5c85d2d0617ae465ee598c74bf695bb8d4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51429
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51429
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c0c221ff590d88749346c8047200cf05017e9e87
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51948
AND Item_ID = 1)
WHERE Reciept_Id=51948
AND Item_ID = 1
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c0c221ff590d88749346c8047200cf05017e9e87
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51948
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51948
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b495dec88199dfae5b582120305d8cdcb188af7e
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=51948
AND Item_ID = 12
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b495dec88199dfae5b582120305d8cdcb188af7e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51948
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51948
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a2a6aaae68a8c78959a74b6999d64ed99246c4b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52396
AND Item_ID = 18)
WHERE Reciept_Id=52396
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a2a6aaae68a8c78959a74b6999d64ed99246c4b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52396
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52396
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ffdb418498bd253b4db9c356b97a9e9fd86722a1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52396
AND Item_ID = 13)
WHERE Reciept_Id=52396
AND Item_ID = 13
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ffdb418498bd253b4db9c356b97a9e9fd86722a1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52396
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52396
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4c692427c7407435bcfb492c1200e0a0c227725
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50703
AND Item_ID = 12)
WHERE Reciept_Id=50703
AND Item_ID = 12
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4c692427c7407435bcfb492c1200e0a0c227725
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50703
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50703
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 595021ffeb66e34a1b4d015c377471df8d35be3d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50259
AND Item_ID = 23)
WHERE Reciept_Id=50259
AND Item_ID = 23
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 595021ffeb66e34a1b4d015c377471df8d35be3d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50259
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50259
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22729289741774fd716dbf4db67b29573ab73621
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50347
AND Item_ID = 18)
WHERE Reciept_Id=50347
AND Item_ID = 18
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22729289741774fd716dbf4db67b29573ab73621
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50347
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50347
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59ef1aec02ac120f39bd4fd35ddcce519a2f3bec
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50913
AND Item_ID = 15)
WHERE Reciept_Id=50913
AND Item_ID = 15
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59ef1aec02ac120f39bd4fd35ddcce519a2f3bec
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50913
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50913
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75cce79885cb485240cc70119c37d1275a12df8c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51165
AND Item_ID = 11)
WHERE Reciept_Id=51165
AND Item_ID = 11
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75cce79885cb485240cc70119c37d1275a12df8c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51165
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51165
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3dee6eae445546dcd887946a37b60f5937511f7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51174
AND Item_ID = 16)
WHERE Reciept_Id=51174
AND Item_ID = 16
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3dee6eae445546dcd887946a37b60f5937511f7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51174
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51174
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b19f441216b11554fab728d55a4ac20ba208f874
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51573
AND Item_ID = 22)
WHERE Reciept_Id=51573
AND Item_ID = 22
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b19f441216b11554fab728d55a4ac20ba208f874
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51573
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51573
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 34ee3d80888473279830e7d96ab91feb0fd5ee78
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51573
AND Item_ID = 18)
WHERE Reciept_Id=51573
AND Item_ID = 18
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 34ee3d80888473279830e7d96ab91feb0fd5ee78
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51573
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51573
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 067c98c53eef283b4dd90264e76b8f57da93b72f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51797
AND Item_ID = 23)
WHERE Reciept_Id=51797
AND Item_ID = 23
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 067c98c53eef283b4dd90264e76b8f57da93b72f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51797
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51797
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 439104671c1a9ce253d9bf137533ab902d6d7541
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52083
AND Item_ID = 30)
WHERE Reciept_Id=52083
AND Item_ID = 30
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 439104671c1a9ce253d9bf137533ab902d6d7541
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52083
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52083
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3c93f808d7f50198204ce5ee7826e9483c17348c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50462
AND Item_ID = 25)
WHERE Reciept_Id=50462
AND Item_ID = 25
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3c93f808d7f50198204ce5ee7826e9483c17348c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50462
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50462
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 270f7eb468cf9303a108ebfcaa21719ba59c9675
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52386
AND Item_ID = 20)
WHERE Reciept_Id=52386
AND Item_ID = 20
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 270f7eb468cf9303a108ebfcaa21719ba59c9675
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52386
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52386
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0fa4985a7dc0ebcc4390d4a3d8bc6098548eeeda
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51423
AND Item_ID = 28)
WHERE Reciept_Id=51423
AND Item_ID = 28
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0fa4985a7dc0ebcc4390d4a3d8bc6098548eeeda
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51423
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51423
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 42248aefa9205fdaafcc4a0867d0e07cceb81414
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52016
AND Item_ID = 21)
WHERE Reciept_Id=52016
AND Item_ID = 21
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 42248aefa9205fdaafcc4a0867d0e07cceb81414
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52016
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52016
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a3a3cfac80765e68a7143e1c331a72750ed9a3dd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52016
AND Item_ID = 26)
WHERE Reciept_Id=52016
AND Item_ID = 26
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a3a3cfac80765e68a7143e1c331a72750ed9a3dd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52016
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52016
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1bcddce16b961f1f074955f78c196c23f7d36b54
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51223
AND Item_ID = 17)
WHERE Reciept_Id=51223
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1bcddce16b961f1f074955f78c196c23f7d36b54
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51223
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51223
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2f3a3164ce5cb5755f7b26be9797bca52dcc2a12
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52273
AND Item_ID = 29)
WHERE Reciept_Id=52273
AND Item_ID = 29
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2f3a3164ce5cb5755f7b26be9797bca52dcc2a12
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52273
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52273
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04ea801a317ba9ab12c64ea6fdf21fc5e830bd4f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51793
AND Item_ID = 16)
WHERE Reciept_Id=51793
AND Item_ID = 16
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04ea801a317ba9ab12c64ea6fdf21fc5e830bd4f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51793
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51793
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f74aca36a38664f4fe62fcd1f01824e24763d1a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51880
AND Item_ID = 2)
WHERE Reciept_Id=51880
AND Item_ID = 2
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f74aca36a38664f4fe62fcd1f01824e24763d1a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51880
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51880
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ee4644f397a5088e7243883cc4b30a964fc87505
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51880
AND Item_ID = 11)
WHERE Reciept_Id=51880
AND Item_ID = 11
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ee4644f397a5088e7243883cc4b30a964fc87505
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51880
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51880
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a4b6713d16d5be839bcc30a1edc022cc5d01319
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51293
AND Item_ID = 18)
WHERE Reciept_Id=51293
AND Item_ID = 18
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a4b6713d16d5be839bcc30a1edc022cc5d01319
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51293
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51293
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3054b87998d4e34723e0bd410173b3a15d3e41cb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51309
AND Item_ID = 12)
WHERE Reciept_Id=51309
AND Item_ID = 12
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3054b87998d4e34723e0bd410173b3a15d3e41cb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51309
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51309
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8fe0324e0af1a22c857d144ff61565d7d463b23b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52429
AND Item_ID = 24)
WHERE Reciept_Id=52429
AND Item_ID = 24
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8fe0324e0af1a22c857d144ff61565d7d463b23b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52429
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52429
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3fb797ef9a6f980ef7d5e1d53c1bde2d625da2eb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52429
AND Item_ID = 26)
WHERE Reciept_Id=52429
AND Item_ID = 26
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3fb797ef9a6f980ef7d5e1d53c1bde2d625da2eb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52429
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52429
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 426576a65c273d7dc40885c5737a903001c295fe
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51936
AND Item_ID = 4)
WHERE Reciept_Id=51936
AND Item_ID = 4
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 426576a65c273d7dc40885c5737a903001c295fe
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51936
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51936
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5600d062ce2f2826527984d52ca28a828a226bfb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51936
AND Item_ID = 3)
WHERE Reciept_Id=51936
AND Item_ID = 3
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5600d062ce2f2826527984d52ca28a828a226bfb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51936
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51936
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49565716ea473c51d56deb67c5692e1a570e7008
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51936
AND Item_ID = 25)
WHERE Reciept_Id=51936
AND Item_ID = 25
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49565716ea473c51d56deb67c5692e1a570e7008
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51936
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51936
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 120c807d3074e0a8d555ad176fe2dd53e8175934
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50098
AND Item_ID = 12)
WHERE Reciept_Id=50098
AND Item_ID = 12
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 120c807d3074e0a8d555ad176fe2dd53e8175934
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50098
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50098
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3c7bc3a1bbf12429a34883e19413c1cfb27ae30
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=51255
AND Item_ID = 21
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3c7bc3a1bbf12429a34883e19413c1cfb27ae30
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51255
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51255
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c6a0923b9c0c91066c24811f79f661a22996bb81
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50294
AND Item_ID = 2)
WHERE Reciept_Id=50294
AND Item_ID = 2
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c6a0923b9c0c91066c24811f79f661a22996bb81
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50294
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50294
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e1d98a4164ca6929760a69a52062e49ca98f6bd1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50294
AND Item_ID = 30)
WHERE Reciept_Id=50294
AND Item_ID = 30
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e1d98a4164ca6929760a69a52062e49ca98f6bd1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50294
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50294
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 08413f4ffb485455cef2ed39c55a743ac18b9cd8
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=50591
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 08413f4ffb485455cef2ed39c55a743ac18b9cd8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50591
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50591
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18b7d613c6a8705d76e7e26934fd37986a8cc72b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50732
AND Item_ID = 12)
WHERE Reciept_Id=50732
AND Item_ID = 12
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18b7d613c6a8705d76e7e26934fd37986a8cc72b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50732
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50732
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7fc514a87dc741cb1e6a8abfb7a902ae7a8fc405
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50996
AND Item_ID = 4)
WHERE Reciept_Id=50996
AND Item_ID = 4
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7fc514a87dc741cb1e6a8abfb7a902ae7a8fc405
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50996
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50996
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8c0cb03ff0db2881638a193badb99849c5e3805f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51719
AND Item_ID = 15)
WHERE Reciept_Id=51719
AND Item_ID = 15
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8c0cb03ff0db2881638a193badb99849c5e3805f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51719
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51719
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cd336eabe26c638088abd0e68c1bdc77cfc00f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51719
AND Item_ID = 1)
WHERE Reciept_Id=51719
AND Item_ID = 1
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cd336eabe26c638088abd0e68c1bdc77cfc00f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51719
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51719
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9b3b1e1e7f4031d94d63f34758ee25a61a9d4d42
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52109
AND Item_ID = 6)
WHERE Reciept_Id=52109
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9b3b1e1e7f4031d94d63f34758ee25a61a9d4d42
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52109
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52109
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6c81b0ab1f4e1ddcd76a0ebb3c658e3373dc219d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52118
AND Item_ID = 9)
WHERE Reciept_Id=52118
AND Item_ID = 9
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6c81b0ab1f4e1ddcd76a0ebb3c658e3373dc219d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52118
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52118
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d6e7a6ab44f546d9485ceb0656ec85cb0f29686
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52459
AND Item_ID = 24)
WHERE Reciept_Id=52459
AND Item_ID = 24
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d6e7a6ab44f546d9485ceb0656ec85cb0f29686
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52459
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52459
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5804922ec5ed5e7809df8ac420813e686de09577
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50170
AND Item_ID = 12)
WHERE Reciept_Id=50170
AND Item_ID = 12
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5804922ec5ed5e7809df8ac420813e686de09577
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50170
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50170
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1472991f5a3c45077be0a61e675dedb4816c7b22
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50170
AND Item_ID = 28)
WHERE Reciept_Id=50170
AND Item_ID = 28
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1472991f5a3c45077be0a61e675dedb4816c7b22
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50170
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50170
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf407db428873b2bf4186c96e2dcb71fbd766508
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50393
AND Item_ID = 1)
WHERE Reciept_Id=50393
AND Item_ID = 1
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf407db428873b2bf4186c96e2dcb71fbd766508
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50393
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50393
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae4fab012fc5d054e61cdd87f5433a8b14ba14a9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50393
AND Item_ID = 16)
WHERE Reciept_Id=50393
AND Item_ID = 16
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae4fab012fc5d054e61cdd87f5433a8b14ba14a9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50393
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50393
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4875e20f922e2bea221d26a8db06f3ab7179b8b0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51669
AND Item_ID = 13)
WHERE Reciept_Id=51669
AND Item_ID = 13
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4875e20f922e2bea221d26a8db06f3ab7179b8b0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51669
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51669
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b8c351cf91baaef8a9845cee45d0c1bb7942ca1f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52103
AND Item_ID = 3)
WHERE Reciept_Id=52103
AND Item_ID = 3
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b8c351cf91baaef8a9845cee45d0c1bb7942ca1f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52103
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52103
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5856cf2cf2f5ec447162864fd1c70640fbdee062
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52103
AND Item_ID = 17)
WHERE Reciept_Id=52103
AND Item_ID = 17
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5856cf2cf2f5ec447162864fd1c70640fbdee062
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52103
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52103
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04ab3fcae88339aa827db9ecb22219b34d047adb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50104
AND Item_ID = 5)
WHERE Reciept_Id=50104
AND Item_ID = 5
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04ab3fcae88339aa827db9ecb22219b34d047adb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50104
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50104
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0a8dcc5cde1c2d886beb3db1240e60f018ce4bbf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50631
AND Item_ID = 7)
WHERE Reciept_Id=50631
AND Item_ID = 7
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0a8dcc5cde1c2d886beb3db1240e60f018ce4bbf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50631
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50631
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: efff5e613b5de06d4abf87103b1dd1a1727894d6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50631
AND Item_ID = 17)
WHERE Reciept_Id=50631
AND Item_ID = 17
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: efff5e613b5de06d4abf87103b1dd1a1727894d6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50631
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50631
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 229e5a7953733dcbf29208f07aa17114c4d3fa7f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51073
AND Item_ID = 16)
WHERE Reciept_Id=51073
AND Item_ID = 16
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 229e5a7953733dcbf29208f07aa17114c4d3fa7f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51073
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51073
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae1a0504b06b7c0a0eaffbad8149157b4f401669
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51687
AND Item_ID = 22)
WHERE Reciept_Id=51687
AND Item_ID = 22
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae1a0504b06b7c0a0eaffbad8149157b4f401669
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51687
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51687
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4c8603965062353527bd8124c4506ba71b967475
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51249
AND Item_ID = 11)
WHERE Reciept_Id=51249
AND Item_ID = 11
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4c8603965062353527bd8124c4506ba71b967475
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51249
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51249
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dc1e3e2ce1dca7061a47ff558229413099983dcb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50333
AND Item_ID = 15)
WHERE Reciept_Id=50333
AND Item_ID = 15
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dc1e3e2ce1dca7061a47ff558229413099983dcb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50333
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50333
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1d6d7f3899638929271d5a8fdc4fe80de90829c4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50830
AND Item_ID = 28)
WHERE Reciept_Id=50830
AND Item_ID = 28
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1d6d7f3899638929271d5a8fdc4fe80de90829c4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50830
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50830
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f59fc3d57a92d8d0e26e8ff2346d1fb72a839159
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=50830
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f59fc3d57a92d8d0e26e8ff2346d1fb72a839159
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50830
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50830
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e9c84eba68b3870ab0a8286d29dc73e92b7cb0e7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51593
AND Item_ID = 30)
WHERE Reciept_Id=51593
AND Item_ID = 30
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e9c84eba68b3870ab0a8286d29dc73e92b7cb0e7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51593
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51593
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 370bb5443b86df9c2238dc7dba5219a3794f60aa
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=51860
AND Item_ID = 20
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 370bb5443b86df9c2238dc7dba5219a3794f60aa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51860
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51860
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c27fc97871055d1624c658910f08d97201704817
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50310
AND Item_ID = 23)
WHERE Reciept_Id=50310
AND Item_ID = 23
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c27fc97871055d1624c658910f08d97201704817
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50310
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50310
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6355a8e4f2f51c2f880d158405046aa64989c8fd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50468
AND Item_ID = 12)
WHERE Reciept_Id=50468
AND Item_ID = 12
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6355a8e4f2f51c2f880d158405046aa64989c8fd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50468
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50468
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 163c2fdc87f6d09877f100921e87753e239deab6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50943
AND Item_ID = 12)
WHERE Reciept_Id=50943
AND Item_ID = 12
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 163c2fdc87f6d09877f100921e87753e239deab6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50943
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50943
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c8cf3507fa5d56abab09a6de587b734a2b5c5e4
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=51297
AND Item_ID = 11
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c8cf3507fa5d56abab09a6de587b734a2b5c5e4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51297
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51297
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 12dfe11cb39dcbc1439d7a32ab6bc8a0c6c3c995
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51397
AND Item_ID = 1)
WHERE Reciept_Id=51397
AND Item_ID = 1
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 12dfe11cb39dcbc1439d7a32ab6bc8a0c6c3c995
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51397
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51397
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96e40a7c69c4b5db989c658015058a748c30f94d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51608
AND Item_ID = 2)
WHERE Reciept_Id=51608
AND Item_ID = 2
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96e40a7c69c4b5db989c658015058a748c30f94d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51608
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51608
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4c8cdaa8c679ba24f5507594a4d402b86535840a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52022
AND Item_ID = 13)
WHERE Reciept_Id=52022
AND Item_ID = 13
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4c8cdaa8c679ba24f5507594a4d402b86535840a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52022
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52022
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d24a82f232de489c833002590e8d7f862bb3b33e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52426
AND Item_ID = 2)
WHERE Reciept_Id=52426
AND Item_ID = 2
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d24a82f232de489c833002590e8d7f862bb3b33e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52426
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52426
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b945aefd5a87e7ddd282314a05d9567bfe62fa0f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50456
AND Item_ID = 28)
WHERE Reciept_Id=50456
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b945aefd5a87e7ddd282314a05d9567bfe62fa0f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50456
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50456
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cc1a3a415070413d5d3ec43be6fa69b4e39e4af3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51609
AND Item_ID = 16)
WHERE Reciept_Id=51609
AND Item_ID = 16
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cc1a3a415070413d5d3ec43be6fa69b4e39e4af3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51609
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51609
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db0ff97b2f6895471622cfddc21f7f59cb638b45
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51859
AND Item_ID = 28)
WHERE Reciept_Id=51859
AND Item_ID = 28
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db0ff97b2f6895471622cfddc21f7f59cb638b45
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51859
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51859
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bff3bf302732d54b640bb3409911123cf48a6f83
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51627
AND Item_ID = 18)
WHERE Reciept_Id=51627
AND Item_ID = 18
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bff3bf302732d54b640bb3409911123cf48a6f83
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51627
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51627
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6b98cea1faf915a23f7e3284b28178ad5c17f71e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51627
AND Item_ID = 12)
WHERE Reciept_Id=51627
AND Item_ID = 12
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6b98cea1faf915a23f7e3284b28178ad5c17f71e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51627
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51627
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9d66082de05583d1013a4120cde4ac4cbbf90a7a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52300
AND Item_ID = 21)
WHERE Reciept_Id=52300
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9d66082de05583d1013a4120cde4ac4cbbf90a7a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52300
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52300
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 457074a69e7b7495249ba5794bda42c81c0b96ea
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52410
AND Item_ID = 26)
WHERE Reciept_Id=52410
AND Item_ID = 26
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 457074a69e7b7495249ba5794bda42c81c0b96ea
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52410
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52410
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e34dfbf82f98081678ab771cb79df1488901a1e3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51233
AND Item_ID = 9)
WHERE Reciept_Id=51233
AND Item_ID = 9
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e34dfbf82f98081678ab771cb79df1488901a1e3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51233
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51233
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b317e883cd3ac9ad07cd00dcffe203a042b17ae
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50138
AND Item_ID = 21)
WHERE Reciept_Id=50138
AND Item_ID = 21
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b317e883cd3ac9ad07cd00dcffe203a042b17ae
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50138
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50138
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3cc8bea9298fa8d8960d133ff02926a50352e2c1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50698
AND Item_ID = 3)
WHERE Reciept_Id=50698
AND Item_ID = 3
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3cc8bea9298fa8d8960d133ff02926a50352e2c1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50698
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50698
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66b3a69075907aa99a326ba351f7aaadb71abded
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51035
AND Item_ID = 29)
WHERE Reciept_Id=51035
AND Item_ID = 29
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66b3a69075907aa99a326ba351f7aaadb71abded
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51035
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51035
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f1449ff2d9558a59f827b5626fcec8d1c279aca7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52059
AND Item_ID = 11)
WHERE Reciept_Id=52059
AND Item_ID = 11
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f1449ff2d9558a59f827b5626fcec8d1c279aca7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52059
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52059
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b26bc40d6031994c013150e4ef5f96de2ffd4d0d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50317
AND Item_ID = 12)
WHERE Reciept_Id=50317
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b26bc40d6031994c013150e4ef5f96de2ffd4d0d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50317
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50317
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23e05a139644357fc5832f5d13355e6a9b652988
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50317
AND Item_ID = 15)
WHERE Reciept_Id=50317
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23e05a139644357fc5832f5d13355e6a9b652988
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50317
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50317
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 01271aa240642585d33097d606167e7f5aaca876
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50835
AND Item_ID = 12)
WHERE Reciept_Id=50835
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 01271aa240642585d33097d606167e7f5aaca876
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50835
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50835
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d835e351842ad74e30e6a8a89b1645c4896bdd11
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52245
AND Item_ID = 23)
WHERE Reciept_Id=52245
AND Item_ID = 23
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d835e351842ad74e30e6a8a89b1645c4896bdd11
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52245
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52245
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e46bd9fbbe41c91cfb9f03d6fe4ac27e4cfbf740
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52245
AND Item_ID = 6)
WHERE Reciept_Id=52245
AND Item_ID = 6
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e46bd9fbbe41c91cfb9f03d6fe4ac27e4cfbf740
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52245
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52245
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 33e91b4fd419b92d1b42a93c97b7596bdf1af018
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50513
AND Item_ID = 11)
WHERE Reciept_Id=50513
AND Item_ID = 11
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 33e91b4fd419b92d1b42a93c97b7596bdf1af018
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50513
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50513
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9734c2f495ade748ec1162f72caae4bd4f6bfed0
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=50941
AND Item_ID = 1
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9734c2f495ade748ec1162f72caae4bd4f6bfed0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50941
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50941
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 93119095efbccd4018f4c8a8715559f950dd4a65
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50941
AND Item_ID = 18)
WHERE Reciept_Id=50941
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 93119095efbccd4018f4c8a8715559f950dd4a65
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50941
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50941
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b747f2e95d260ca06c51afdd7d9e7e240bd11290
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51758
AND Item_ID = 18)
WHERE Reciept_Id=51758
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b747f2e95d260ca06c51afdd7d9e7e240bd11290
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51758
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51758
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5787ed93441be9980f5c4a3969770a4541470d51
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50181
AND Item_ID = 30)
WHERE Reciept_Id=50181
AND Item_ID = 30
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5787ed93441be9980f5c4a3969770a4541470d51
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50181
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50181
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e83677d91bc5bc7ba6efb2791ab8dd9fda37c9d8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50172
AND Item_ID = 8)
WHERE Reciept_Id=50172
AND Item_ID = 8
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e83677d91bc5bc7ba6efb2791ab8dd9fda37c9d8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50172
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50172
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 35cdddb3933c5da50d1797dfdec836e6a44d7456
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51647
AND Item_ID = 14)
WHERE Reciept_Id=51647
AND Item_ID = 14
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 35cdddb3933c5da50d1797dfdec836e6a44d7456
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51647
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51647
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4115c286036c215c0e239eee3ba5ef4a1eea77a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51957
AND Item_ID = 29)
WHERE Reciept_Id=51957
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4115c286036c215c0e239eee3ba5ef4a1eea77a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51957
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51957
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e55a430aeeea739beaf29a914554cd9b7e1146e4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51957
AND Item_ID = 22)
WHERE Reciept_Id=51957
AND Item_ID = 22
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e55a430aeeea739beaf29a914554cd9b7e1146e4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51957
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51957
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1812b6f89322f6fce4e1ae8b4bb7631adaf747f1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50079
AND Item_ID = 4)
WHERE Reciept_Id=50079
AND Item_ID = 4
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1812b6f89322f6fce4e1ae8b4bb7631adaf747f1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50079
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50079
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e18163a16f3b483c886e7c8a30bf98f5454e7a59
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51597
AND Item_ID = 11)
WHERE Reciept_Id=51597
AND Item_ID = 11
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e18163a16f3b483c886e7c8a30bf98f5454e7a59
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51597
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51597
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4ee8e038a82d575766e790c846b9e7c22777315
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51660
AND Item_ID = 17)
WHERE Reciept_Id=51660
AND Item_ID = 17
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4ee8e038a82d575766e790c846b9e7c22777315
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51660
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51660
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 69bdcfc20f896f7cea7c4d8327353cf78552aa6a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52308
AND Item_ID = 6)
WHERE Reciept_Id=52308
AND Item_ID = 6
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 69bdcfc20f896f7cea7c4d8327353cf78552aa6a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52308
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52308
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6580309d720840821f38a8680d3b4eae087ba27c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52448
AND Item_ID = 13)
WHERE Reciept_Id=52448
AND Item_ID = 13
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6580309d720840821f38a8680d3b4eae087ba27c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52448
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52448
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 958bb6304b4d6ec0274e5d5a9f60ae6bca1482b0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50754
AND Item_ID = 8)
WHERE Reciept_Id=50754
AND Item_ID = 8
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 958bb6304b4d6ec0274e5d5a9f60ae6bca1482b0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50754
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50754
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40b405c63eee7fc20cfdbdfff37a6cad8ebfcb7a
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=50754
AND Item_ID = 14
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40b405c63eee7fc20cfdbdfff37a6cad8ebfcb7a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50754
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50754
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb45f53cb8b8126a5dbb62f8a10e03e94679a4f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51414
AND Item_ID = 28)
WHERE Reciept_Id=51414
AND Item_ID = 28
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb45f53cb8b8126a5dbb62f8a10e03e94679a4f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51414
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51414
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0ca9ab3a2aca97086102890a6056b1a71e131b6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51414
AND Item_ID = 21)
WHERE Reciept_Id=51414
AND Item_ID = 21
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0ca9ab3a2aca97086102890a6056b1a71e131b6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51414
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51414
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13cec24da096819d3d2ea05c16a986ae531f626f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52234
AND Item_ID = 21)
WHERE Reciept_Id=52234
AND Item_ID = 21
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13cec24da096819d3d2ea05c16a986ae531f626f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52234
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52234
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7e538b79c3748ff58a19842b7fad1d91c353f780
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52388
AND Item_ID = 2)
WHERE Reciept_Id=52388
AND Item_ID = 2
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7e538b79c3748ff58a19842b7fad1d91c353f780
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52388
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52388
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 545c9d2fca5fea7d5718f53f4ec2b4ed1657749b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50974
AND Item_ID = 13)
WHERE Reciept_Id=50974
AND Item_ID = 13
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 545c9d2fca5fea7d5718f53f4ec2b4ed1657749b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50974
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50974
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 55e4f75c3b1c83e1dfbae1d8008eadd525d36a63
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52352
AND Item_ID = 16)
WHERE Reciept_Id=52352
AND Item_ID = 16
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 55e4f75c3b1c83e1dfbae1d8008eadd525d36a63
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52352
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52352
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b58fa7528f93fa946b3764a890cf9e189ad3a73
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52352
AND Item_ID = 24)
WHERE Reciept_Id=52352
AND Item_ID = 24
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b58fa7528f93fa946b3764a890cf9e189ad3a73
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52352
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52352
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b5e15afd70b7779d414d08f0590d6047121c5e0d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50225
AND Item_ID = 1)
WHERE Reciept_Id=50225
AND Item_ID = 1
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b5e15afd70b7779d414d08f0590d6047121c5e0d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50225
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50225
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7a794aec96089286bf1d471fdba63a426207a90
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50766
AND Item_ID = 19)
WHERE Reciept_Id=50766
AND Item_ID = 19
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7a794aec96089286bf1d471fdba63a426207a90
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50766
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50766
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c55a8de910b507b678f60c03d3229616f7b7a727
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51281
AND Item_ID = 3)
WHERE Reciept_Id=51281
AND Item_ID = 3
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c55a8de910b507b678f60c03d3229616f7b7a727
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51281
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51281
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 05693284f40c40a3fa21401d8e1ccbd9d1b4583b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51281
AND Item_ID = 29)
WHERE Reciept_Id=51281
AND Item_ID = 29
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 05693284f40c40a3fa21401d8e1ccbd9d1b4583b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51281
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51281
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cb760f7d15d0e001224bf425eb276de5b3b784d5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51970
AND Item_ID = 21)
WHERE Reciept_Id=51970
AND Item_ID = 21
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cb760f7d15d0e001224bf425eb276de5b3b784d5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51970
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51970
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2299a0d65b0935ee4cd4ecd704a0fc9350b03af6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51065
AND Item_ID = 6)
WHERE Reciept_Id=51065
AND Item_ID = 6
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2299a0d65b0935ee4cd4ecd704a0fc9350b03af6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51065
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51065
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0a5771e4efd2a516cc6ccab02a7e3b1129647526
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52169
AND Item_ID = 16)
WHERE Reciept_Id=52169
AND Item_ID = 16
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0a5771e4efd2a516cc6ccab02a7e3b1129647526
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52169
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52169
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bdf7b56b8651423b02cba6de2146ae160c95d1a9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52389
AND Item_ID = 25)
WHERE Reciept_Id=52389
AND Item_ID = 25
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bdf7b56b8651423b02cba6de2146ae160c95d1a9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52389
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52389
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 312a958b5d8b28ea40b80cd295641c2856ab5bed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50270
AND Item_ID = 21)
WHERE Reciept_Id=50270
AND Item_ID = 21
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 312a958b5d8b28ea40b80cd295641c2856ab5bed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50270
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50270
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 767bdd025ca4dd1fe0c34ac129676db52ed69581
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52371
AND Item_ID = 18)
WHERE Reciept_Id=52371
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 767bdd025ca4dd1fe0c34ac129676db52ed69581
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52371
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52371
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0d85e699f5e916f717b11fe9b731d080ccc44927
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50638
AND Item_ID = 14)
WHERE Reciept_Id=50638
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0d85e699f5e916f717b11fe9b731d080ccc44927
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50638
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50638
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d67b48c99f16873d367d6566b389e5409e723a79
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51068
AND Item_ID = 19)
WHERE Reciept_Id=51068
AND Item_ID = 19
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d67b48c99f16873d367d6566b389e5409e723a79
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51068
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51068
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a18bc10199156e1c2603dba2bebf2aee45389a6b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52350
AND Item_ID = 9)
WHERE Reciept_Id=52350
AND Item_ID = 9
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a18bc10199156e1c2603dba2bebf2aee45389a6b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52350
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52350
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18abe1cdc9173780e97579e40b2b9f193ea9b41d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52350
AND Item_ID = 11)
WHERE Reciept_Id=52350
AND Item_ID = 11
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18abe1cdc9173780e97579e40b2b9f193ea9b41d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52350
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52350
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb85a0ffb90b27af53ece35df450ea457084996f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51135
AND Item_ID = 16)
WHERE Reciept_Id=51135
AND Item_ID = 16
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb85a0ffb90b27af53ece35df450ea457084996f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51135
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51135
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cef38673a542c21585e8ff32ce4c700ba6d7cdc4
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=51442
AND Item_ID = 17
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cef38673a542c21585e8ff32ce4c700ba6d7cdc4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51442
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51442
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 29030556f72cdb8bf48676db10165189bb0c094b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51442
AND Item_ID = 14)
WHERE Reciept_Id=51442
AND Item_ID = 14
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 29030556f72cdb8bf48676db10165189bb0c094b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51442
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51442
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e705d085d93ce6a39998e09484dfbc7b3806b2df
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51399
AND Item_ID = 28)
WHERE Reciept_Id=51399
AND Item_ID = 28
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e705d085d93ce6a39998e09484dfbc7b3806b2df
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51399
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51399
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a1e6f18bb38a3bf3a9ac740cd7b177f136d2e7f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51823
AND Item_ID = 7)
WHERE Reciept_Id=51823
AND Item_ID = 7
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a1e6f18bb38a3bf3a9ac740cd7b177f136d2e7f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51823
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51823
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d59d1559d44bfcddf8b94528900c9343328d8b51
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50064
AND Item_ID = 11)
WHERE Reciept_Id=50064
AND Item_ID = 11
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d59d1559d44bfcddf8b94528900c9343328d8b51
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50064
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50064
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5aaabc33facfdef4072bd262c5205b87881b801d
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=50064
AND Item_ID = 25
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5aaabc33facfdef4072bd262c5205b87881b801d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50064
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50064
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71722ca5b40f8b0124e645770a250f60fd3160ea
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50322
AND Item_ID = 12)
WHERE Reciept_Id=50322
AND Item_ID = 12
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71722ca5b40f8b0124e645770a250f60fd3160ea
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50322
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50322
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cf60236e0dc881dc2985cd261dba1434ebd3ec6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50566
AND Item_ID = 18)
WHERE Reciept_Id=50566
AND Item_ID = 18
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cf60236e0dc881dc2985cd261dba1434ebd3ec6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50566
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50566
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4e9786d710c42bd1ed4ab97a15098d7664458a92
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51612
AND Item_ID = 10)
WHERE Reciept_Id=51612
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4e9786d710c42bd1ed4ab97a15098d7664458a92
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51612
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51612
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e2127059b30fcece3a4f98843aa4362bb3b6ce54
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51574
AND Item_ID = 20)
WHERE Reciept_Id=51574
AND Item_ID = 20
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e2127059b30fcece3a4f98843aa4362bb3b6ce54
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51574
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51574
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0451574c42457fb3facb66918043f4875129e37a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52309
AND Item_ID = 2)
WHERE Reciept_Id=52309
AND Item_ID = 2
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0451574c42457fb3facb66918043f4875129e37a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52309
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52309
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fde629d56f9ff467e8cf1af8eb1baf740457696b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51300
AND Item_ID = 9)
WHERE Reciept_Id=51300
AND Item_ID = 9
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fde629d56f9ff467e8cf1af8eb1baf740457696b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51300
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51300
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 95430ca8a21b8c2582c3bed9b9c0061a807996a5
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=51300
AND Item_ID = 20
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 95430ca8a21b8c2582c3bed9b9c0061a807996a5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51300
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51300
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18816495a1aec62cb40280309e5019bf38e99ff9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51485
AND Item_ID = 21)
WHERE Reciept_Id=51485
AND Item_ID = 21
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18816495a1aec62cb40280309e5019bf38e99ff9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51485
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51485
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6e632491a49a65ab687303fdca5d296c608dbc7d
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=51546
AND Item_ID = 13
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6e632491a49a65ab687303fdca5d296c608dbc7d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51546
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51546
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b80f973cda8b9a33f333fac1c1e625bc10ba976
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51546
AND Item_ID = 30)
WHERE Reciept_Id=51546
AND Item_ID = 30
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b80f973cda8b9a33f333fac1c1e625bc10ba976
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51546
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51546
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16cc214d7170668349b554686a7888dba92fdb50
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50167
AND Item_ID = 10)
WHERE Reciept_Id=50167
AND Item_ID = 10
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16cc214d7170668349b554686a7888dba92fdb50
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50167
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50167
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0e3bf32c9435afcb117af62e2d0463ac013711d3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50167
AND Item_ID = 13)
WHERE Reciept_Id=50167
AND Item_ID = 13
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0e3bf32c9435afcb117af62e2d0463ac013711d3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50167
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50167
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d5f24582289c6fae9d7072e6a04de0de2d430886
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50191
AND Item_ID = 10)
WHERE Reciept_Id=50191
AND Item_ID = 10
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d5f24582289c6fae9d7072e6a04de0de2d430886
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50191
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50191
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b91384b2585299a14674fa2e2013f1802833635b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50725
AND Item_ID = 26)
WHERE Reciept_Id=50725
AND Item_ID = 26
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b91384b2585299a14674fa2e2013f1802833635b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50725
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50725
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 51d601ce556b9f294105aa2b4c9a0f7f5da67ae9
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=50725
AND Item_ID = 12
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 51d601ce556b9f294105aa2b4c9a0f7f5da67ae9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50725
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50725
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2e2216b371cadc58c0c8b50c0034296db27b229c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52151
AND Item_ID = 27)
WHERE Reciept_Id=52151
AND Item_ID = 27
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2e2216b371cadc58c0c8b50c0034296db27b229c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52151
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52151
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6063f891213ec9d1a2046dc92be44bb49f122bb4
UPDATE Assignment1Data 
SET [Item_Quantity]=12
WHERE Reciept_Id=50047
AND Item_ID = 17
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6063f891213ec9d1a2046dc92be44bb49f122bb4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50047
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50047
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6246f8d8ca0e98e762dab72c226f7ee98798b2f2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50047
AND Item_ID = 1)
WHERE Reciept_Id=50047
AND Item_ID = 1
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6246f8d8ca0e98e762dab72c226f7ee98798b2f2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50047
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50047
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f4364be4eb30e376f193dc3b2052940de732a7b
UPDATE Assignment1Data 
SET [Item_Quantity]=12
WHERE Reciept_Id=50388
AND Item_ID = 19
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f4364be4eb30e376f193dc3b2052940de732a7b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50388
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50388
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 345c8e52c7e21dbf91a05ed8512f803d1c62d5d6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50388
AND Item_ID = 12)
WHERE Reciept_Id=50388
AND Item_ID = 12
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 345c8e52c7e21dbf91a05ed8512f803d1c62d5d6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50388
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50388
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4451e8e405338b0cf9f7787b98148ff52513bef9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50973
AND Item_ID = 2)
WHERE Reciept_Id=50973
AND Item_ID = 2
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4451e8e405338b0cf9f7787b98148ff52513bef9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50973
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50973
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a076d7626bfc31dece03bfc592a67dd42827752
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51085
AND Item_ID = 20)
WHERE Reciept_Id=51085
AND Item_ID = 20
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a076d7626bfc31dece03bfc592a67dd42827752
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51085
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51085
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 329ee2deca48455f82b4fe2d4cc29b86ef0f30e0
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=51276
AND Item_ID = 23
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 329ee2deca48455f82b4fe2d4cc29b86ef0f30e0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51276
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51276
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a0f511123ef68771dbf592db45e7b4e53c255c9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51323
AND Item_ID = 12)
WHERE Reciept_Id=51323
AND Item_ID = 12
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a0f511123ef68771dbf592db45e7b4e53c255c9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51323
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51323
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a7091e8afd6eef38f5bb4517532877bb7b14d5a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51323
AND Item_ID = 22)
WHERE Reciept_Id=51323
AND Item_ID = 22
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a7091e8afd6eef38f5bb4517532877bb7b14d5a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51323
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51323
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eea8394192e4a79de73dff36ba48ac696647b45e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50586
AND Item_ID = 10)
WHERE Reciept_Id=50586
AND Item_ID = 10
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eea8394192e4a79de73dff36ba48ac696647b45e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50586
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50586
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2562fb5bc0146bb8cf0ea58eb26ab2678b2c9446
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50780
AND Item_ID = 29)
WHERE Reciept_Id=50780
AND Item_ID = 29
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2562fb5bc0146bb8cf0ea58eb26ab2678b2c9446
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50780
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50780
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3217c2e4de07d8b091f92bb5c61fa7a37c7ec02f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52377
AND Item_ID = 6)
WHERE Reciept_Id=52377
AND Item_ID = 6
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3217c2e4de07d8b091f92bb5c61fa7a37c7ec02f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52377
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52377
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 99de1c65f6881ca7b7cf29cc310625817dcf9c61
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50857
AND Item_ID = 25)
WHERE Reciept_Id=50857
AND Item_ID = 25
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 99de1c65f6881ca7b7cf29cc310625817dcf9c61
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50857
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50857
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b6ceb8ff8e68d1444f1d53d2bb494a93dda73283
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51220
AND Item_ID = 19)
WHERE Reciept_Id=51220
AND Item_ID = 19
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b6ceb8ff8e68d1444f1d53d2bb494a93dda73283
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51220
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51220
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 463760f3dd721d703594e6c70cdc7474cc272590
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51220
AND Item_ID = 6)
WHERE Reciept_Id=51220
AND Item_ID = 6
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 463760f3dd721d703594e6c70cdc7474cc272590
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51220
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51220
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 650cf2f7d46e4f78991c8727c2fa52084e35c905
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52138
AND Item_ID = 10)
WHERE Reciept_Id=52138
AND Item_ID = 10
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 650cf2f7d46e4f78991c8727c2fa52084e35c905
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52138
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52138
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa9e87b3519a7b22d67bdc1e9ca89e066ee2c322
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52138
AND Item_ID = 14)
WHERE Reciept_Id=52138
AND Item_ID = 14
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa9e87b3519a7b22d67bdc1e9ca89e066ee2c322
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52138
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52138
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07acc4905d9f5c554e65a1c5e49c80e9fd229b41
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52207
AND Item_ID = 10)
WHERE Reciept_Id=52207
AND Item_ID = 10
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07acc4905d9f5c554e65a1c5e49c80e9fd229b41
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52207
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52207
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68787c65e5c6c566c878929a35b71c0bdca1f4c9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51119
AND Item_ID = 4)
WHERE Reciept_Id=51119
AND Item_ID = 4
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68787c65e5c6c566c878929a35b71c0bdca1f4c9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51119
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51119
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bcf7ac7afaecf07ed1f317cbad508d47e2d2ebb9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51185
AND Item_ID = 14)
WHERE Reciept_Id=51185
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bcf7ac7afaecf07ed1f317cbad508d47e2d2ebb9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51185
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51185
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74ed816bd33cc9600d616370d156c9c13895e4f7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52144
AND Item_ID = 27)
WHERE Reciept_Id=52144
AND Item_ID = 27
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74ed816bd33cc9600d616370d156c9c13895e4f7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52144
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52144
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 559274a5110c6e908d9ceaef5a02a67922a0f3a6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52144
AND Item_ID = 23)
WHERE Reciept_Id=52144
AND Item_ID = 23
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 559274a5110c6e908d9ceaef5a02a67922a0f3a6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52144
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52144
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 933897003c1c377595c611f2618d3efe9c4869eb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50123
AND Item_ID = 12)
WHERE Reciept_Id=50123
AND Item_ID = 12
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 933897003c1c377595c611f2618d3efe9c4869eb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50123
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50123
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 457e7191d4b42d25f90a8a081404ee714f03b2be
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50202
AND Item_ID = 14)
WHERE Reciept_Id=50202
AND Item_ID = 14
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 457e7191d4b42d25f90a8a081404ee714f03b2be
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50202
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50202
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f84e27ece39acc72267d82215bd2f561f1f0737c
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=50500
AND Item_ID = 11
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f84e27ece39acc72267d82215bd2f561f1f0737c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50500
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50500
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e89025f079ae26b8c887ea906d980f7bd848cfbd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50843
AND Item_ID = 5)
WHERE Reciept_Id=50843
AND Item_ID = 5
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e89025f079ae26b8c887ea906d980f7bd848cfbd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50843
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50843
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c5b8965ef58c22fc6c256dc0ae7b4c9a3812d2c7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50843
AND Item_ID = 1)
WHERE Reciept_Id=50843
AND Item_ID = 1
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c5b8965ef58c22fc6c256dc0ae7b4c9a3812d2c7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50843
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50843
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ef0ad679bea6978dc26cab0073b667561549c703
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50899
AND Item_ID = 17)
WHERE Reciept_Id=50899
AND Item_ID = 17
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ef0ad679bea6978dc26cab0073b667561549c703
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50899
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50899
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d30f7a61bdac2701b2e45f88cb01cf6770838341
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51303
AND Item_ID = 3)
WHERE Reciept_Id=51303
AND Item_ID = 3
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d30f7a61bdac2701b2e45f88cb01cf6770838341
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51303
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51303
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f37d66ddf927c330265edfb9f74c3144025d9607
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51662
AND Item_ID = 9)
WHERE Reciept_Id=51662
AND Item_ID = 9
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f37d66ddf927c330265edfb9f74c3144025d9607
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51662
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51662
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a461cd120ef08273ac6c6afecda94974b0e17b09
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52260
AND Item_ID = 17)
WHERE Reciept_Id=52260
AND Item_ID = 17
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a461cd120ef08273ac6c6afecda94974b0e17b09
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52260
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52260
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f79109538847117aa8fad603ffffa6f2baa85109
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52379
AND Item_ID = 24)
WHERE Reciept_Id=52379
AND Item_ID = 24
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f79109538847117aa8fad603ffffa6f2baa85109
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52379
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52379
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 052133b0ba82fc6de9baacfda83367d6727fe123
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52379
AND Item_ID = 5)
WHERE Reciept_Id=52379
AND Item_ID = 5
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 052133b0ba82fc6de9baacfda83367d6727fe123
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52379
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52379
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b3432acaf5b4b7e77d622b09c7cd5c8dfd86f3fc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52457
AND Item_ID = 19)
WHERE Reciept_Id=52457
AND Item_ID = 19
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b3432acaf5b4b7e77d622b09c7cd5c8dfd86f3fc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52457
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52457
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c1a3aad0c4fd96946263cbb6c8efedd4a265a8d1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51461
AND Item_ID = 24)
WHERE Reciept_Id=51461
AND Item_ID = 24
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c1a3aad0c4fd96946263cbb6c8efedd4a265a8d1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51461
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51461
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 145d4a53c9846b689bbd68b9e3163c309a74318b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51461
AND Item_ID = 4)
WHERE Reciept_Id=51461
AND Item_ID = 4
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 145d4a53c9846b689bbd68b9e3163c309a74318b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51461
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51461
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da73b597431ef1d1969b10b09371f13a3712603a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50053
AND Item_ID = 23)
WHERE Reciept_Id=50053
AND Item_ID = 23
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da73b597431ef1d1969b10b09371f13a3712603a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50053
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50053
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d3cc459ab7c7127420248ff00752dd53faf4e3c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50600
AND Item_ID = 16)
WHERE Reciept_Id=50600
AND Item_ID = 16
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d3cc459ab7c7127420248ff00752dd53faf4e3c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50600
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50600
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 130558cd8b2a4f571d0d6fd847d5c3cd50a96311
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50640
AND Item_ID = 26)
WHERE Reciept_Id=50640
AND Item_ID = 26
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 130558cd8b2a4f571d0d6fd847d5c3cd50a96311
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50640
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50640
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 114c77e7a84a9d9d7820fd3268af7c67a2471042
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50640
AND Item_ID = 10)
WHERE Reciept_Id=50640
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 114c77e7a84a9d9d7820fd3268af7c67a2471042
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50640
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50640
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5994d328f4c6be0cb93f362480f66c7706e749be
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51686
AND Item_ID = 24)
WHERE Reciept_Id=51686
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5994d328f4c6be0cb93f362480f66c7706e749be
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51686
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51686
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 81b26c73bbf0dd0f695d50a4ae3ca920b152b22e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51686
AND Item_ID = 19)
WHERE Reciept_Id=51686
AND Item_ID = 19
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 81b26c73bbf0dd0f695d50a4ae3ca920b152b22e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51686
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51686
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 572beade728930013b8d94f8589934eea3894814
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=51773
AND Item_ID = 2
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 572beade728930013b8d94f8589934eea3894814
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51773
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51773
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3c912839b5d33ee066879347bd97a82da7f1fe8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52440
AND Item_ID = 10)
WHERE Reciept_Id=52440
AND Item_ID = 10
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3c912839b5d33ee066879347bd97a82da7f1fe8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52440
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52440
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 962eb9fc2ced26a0974be2c155ba4e95e6c6b211
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50369
AND Item_ID = 17)
WHERE Reciept_Id=50369
AND Item_ID = 17
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 962eb9fc2ced26a0974be2c155ba4e95e6c6b211
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50369
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50369
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7544329800e26a9e26ab0c388efcb19ea91b863
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50555
AND Item_ID = 8)
WHERE Reciept_Id=50555
AND Item_ID = 8
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7544329800e26a9e26ab0c388efcb19ea91b863
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50555
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50555
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ba5d0f46762c9b9f51e8975d1433e025d5720983
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50555
AND Item_ID = 18)
WHERE Reciept_Id=50555
AND Item_ID = 18
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ba5d0f46762c9b9f51e8975d1433e025d5720983
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50555
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50555
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 05812cc6ae008cb073ecda557608637a2b2b74b9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51380
AND Item_ID = 17)
WHERE Reciept_Id=51380
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 05812cc6ae008cb073ecda557608637a2b2b74b9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51380
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51380
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7373fc9a6ef03f575ee65be2cc52c75d49c7f61f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52246
AND Item_ID = 6)
WHERE Reciept_Id=52246
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7373fc9a6ef03f575ee65be2cc52c75d49c7f61f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52246
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52246
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96e438f4529050a59a1b994c061a2cb47e117a90
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50844
AND Item_ID = 6)
WHERE Reciept_Id=50844
AND Item_ID = 6
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96e438f4529050a59a1b994c061a2cb47e117a90
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50844
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50844
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 73828827d379c2708dab7cf50b1535981fdd4daf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50844
AND Item_ID = 22)
WHERE Reciept_Id=50844
AND Item_ID = 22
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 73828827d379c2708dab7cf50b1535981fdd4daf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50844
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50844
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 646f33ce23bff1ec8aa08053eae83744d4056987
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50982
AND Item_ID = 7)
WHERE Reciept_Id=50982
AND Item_ID = 7
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 646f33ce23bff1ec8aa08053eae83744d4056987
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50982
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50982
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb582deaec3a61fe0a9ca8f4809403e73992d082
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50982
AND Item_ID = 10)
WHERE Reciept_Id=50982
AND Item_ID = 10
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb582deaec3a61fe0a9ca8f4809403e73992d082
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50982
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50982
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 342a7df4ae63e74b2d5d15c1883861e5d2f2f2a1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51958
AND Item_ID = 5)
WHERE Reciept_Id=51958
AND Item_ID = 5
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 342a7df4ae63e74b2d5d15c1883861e5d2f2f2a1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51958
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51958
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 063942a5f45e0b587a49f5637607f6edd534d4c2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52093
AND Item_ID = 24)
WHERE Reciept_Id=52093
AND Item_ID = 24
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 063942a5f45e0b587a49f5637607f6edd534d4c2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52093
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52093
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2dee6e298e5580299df32a3e80bfe62067a9aba5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52093
AND Item_ID = 14)
WHERE Reciept_Id=52093
AND Item_ID = 14
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2dee6e298e5580299df32a3e80bfe62067a9aba5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52093
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52093
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e4fd02961d37614f46a30867178ca0942a3220b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50277
AND Item_ID = 21)
WHERE Reciept_Id=50277
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e4fd02961d37614f46a30867178ca0942a3220b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50277
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50277
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 231b957718a1f551cd621fe6c83d2421bffa9df7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50277
AND Item_ID = 12)
WHERE Reciept_Id=50277
AND Item_ID = 12
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 231b957718a1f551cd621fe6c83d2421bffa9df7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50277
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50277
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b4954b1c93a5796dc33318a29b71384239182575
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50750
AND Item_ID = 23)
WHERE Reciept_Id=50750
AND Item_ID = 23
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b4954b1c93a5796dc33318a29b71384239182575
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50750
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50750
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18c1536c0145b8b9e46402900f1174e845a6562e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50750
AND Item_ID = 8)
WHERE Reciept_Id=50750
AND Item_ID = 8
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18c1536c0145b8b9e46402900f1174e845a6562e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50750
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50750
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d96e59a4161cfda0bef55e973d03d80e3d3d767a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50908
AND Item_ID = 13)
WHERE Reciept_Id=50908
AND Item_ID = 13
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d96e59a4161cfda0bef55e973d03d80e3d3d767a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50908
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50908
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6fb563ce51da38d6ff47fcf3be1b1ee0cd8d27fe
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50925
AND Item_ID = 24)
WHERE Reciept_Id=50925
AND Item_ID = 24
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6fb563ce51da38d6ff47fcf3be1b1ee0cd8d27fe
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50925
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50925
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ced84f1b409adf4fdb8b5ace216a60451e972417
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=50925
AND Item_ID = 3
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ced84f1b409adf4fdb8b5ace216a60451e972417
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50925
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50925
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b6d5c304dedf9f34df13a8f5280f79764f6e02fc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51253
AND Item_ID = 24)
WHERE Reciept_Id=51253
AND Item_ID = 24
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b6d5c304dedf9f34df13a8f5280f79764f6e02fc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51253
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51253
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d4eea2982335584cfca6b4ff27c93ebf5c11b3ce
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50711
AND Item_ID = 29)
WHERE Reciept_Id=50711
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d4eea2982335584cfca6b4ff27c93ebf5c11b3ce
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50711
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50711
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 342cb8bb8cfad52e0298843f83a3562b494997ac
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50711
AND Item_ID = 20)
WHERE Reciept_Id=50711
AND Item_ID = 20
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 342cb8bb8cfad52e0298843f83a3562b494997ac
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50711
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50711
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15ca1fe2d920585e51f8315b65bba609f447679d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50991
AND Item_ID = 29)
WHERE Reciept_Id=50991
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15ca1fe2d920585e51f8315b65bba609f447679d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50991
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50991
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 336d1c20efac4968a5ee0e9305b4a5ef564fb3a4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51128
AND Item_ID = 1)
WHERE Reciept_Id=51128
AND Item_ID = 1
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 336d1c20efac4968a5ee0e9305b4a5ef564fb3a4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51128
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51128
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2249386995d0d9243575239b9839415aeed1f90e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51879
AND Item_ID = 27)
WHERE Reciept_Id=51879
AND Item_ID = 27
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2249386995d0d9243575239b9839415aeed1f90e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51879
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51879
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ada8942b2a44d54055cf77acaac211056596f23
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51897
AND Item_ID = 24)
WHERE Reciept_Id=51897
AND Item_ID = 24
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ada8942b2a44d54055cf77acaac211056596f23
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51897
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51897
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4dbf3e1d01cf9779450fc84799f12d10abd5046f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50102
AND Item_ID = 27)
WHERE Reciept_Id=50102
AND Item_ID = 27
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4dbf3e1d01cf9779450fc84799f12d10abd5046f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50102
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50102
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 88f69f2a45494e3dbd4d27f1238165fd1f69dc65
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50758
AND Item_ID = 18)
WHERE Reciept_Id=50758
AND Item_ID = 18
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 88f69f2a45494e3dbd4d27f1238165fd1f69dc65
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50758
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50758
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f241ca5fa707452389de2d6bf1b6d702dd9d4c44
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50758
AND Item_ID = 21)
WHERE Reciept_Id=50758
AND Item_ID = 21
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f241ca5fa707452389de2d6bf1b6d702dd9d4c44
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50758
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50758
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15fed2e9a7712dd3ffcdede75d99ecab56d754e4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51049
AND Item_ID = 10)
WHERE Reciept_Id=51049
AND Item_ID = 10
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15fed2e9a7712dd3ffcdede75d99ecab56d754e4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51049
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51049
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 795a743e71dd0d1322601119a51295a6c9bb3254
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51049
AND Item_ID = 21)
WHERE Reciept_Id=51049
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 795a743e71dd0d1322601119a51295a6c9bb3254
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51049
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51049
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d19ff5fb4ed0f662c2104817f0c630c0eb476754
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51138
AND Item_ID = 27)
WHERE Reciept_Id=51138
AND Item_ID = 27
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d19ff5fb4ed0f662c2104817f0c630c0eb476754
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51138
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51138
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4b7baff264ea32bbfb6d572d9dc214893224daee
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51717
AND Item_ID = 25)
WHERE Reciept_Id=51717
AND Item_ID = 25
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4b7baff264ea32bbfb6d572d9dc214893224daee
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51717
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51717
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4359ab5d03b89ee1530a4c0aaf2bd8e4ee8bc8e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51459
AND Item_ID = 24)
WHERE Reciept_Id=51459
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4359ab5d03b89ee1530a4c0aaf2bd8e4ee8bc8e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51459
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51459
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86569c6d7445c4fd74adec1a588180d6aa91027d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50455
AND Item_ID = 27)
WHERE Reciept_Id=50455
AND Item_ID = 27
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86569c6d7445c4fd74adec1a588180d6aa91027d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50455
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50455
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 377f618964d410305f498feaa1f1263d577a0eaa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51359
AND Item_ID = 16)
WHERE Reciept_Id=51359
AND Item_ID = 16
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 377f618964d410305f498feaa1f1263d577a0eaa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51359
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51359
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e84e2ea808ce787b0e071b4344d82fc985933b08
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52009
AND Item_ID = 2)
WHERE Reciept_Id=52009
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e84e2ea808ce787b0e071b4344d82fc985933b08
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52009
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52009
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 37785023a6395d42138daa178b8d7ed2500596ac
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=51036
AND Item_ID = 30
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 37785023a6395d42138daa178b8d7ed2500596ac
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51036
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51036
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cb669c731c3888c17a5264e0515237da3515922a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51275
AND Item_ID = 6)
WHERE Reciept_Id=51275
AND Item_ID = 6
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cb669c731c3888c17a5264e0515237da3515922a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51275
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51275
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4c081de8372c68145110e0b6e8ac071aaf94ece
UPDATE Assignment1Data 
SET [Item_Quantity]=18
WHERE Reciept_Id=51602
AND Item_ID = 10
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4c081de8372c68145110e0b6e8ac071aaf94ece
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51602
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51602
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 768c31b9bc91d5c5a6105be6cfcd75c7d80d7b00
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51683
AND Item_ID = 2)
WHERE Reciept_Id=51683
AND Item_ID = 2
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 768c31b9bc91d5c5a6105be6cfcd75c7d80d7b00
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51683
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51683
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5254c5c3a97a67e65602a58af19f760e985f74c4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52121
AND Item_ID = 6)
WHERE Reciept_Id=52121
AND Item_ID = 6
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5254c5c3a97a67e65602a58af19f760e985f74c4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52121
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52121
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2da702d74cb301caf001c8c47ef17a5d9f7ea3b0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50597
AND Item_ID = 3)
WHERE Reciept_Id=50597
AND Item_ID = 3
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2da702d74cb301caf001c8c47ef17a5d9f7ea3b0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50597
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50597
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04da0a3079a45a7ce68ffebda473db6dba131092
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52218
AND Item_ID = 16)
WHERE Reciept_Id=52218
AND Item_ID = 16
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04da0a3079a45a7ce68ffebda473db6dba131092
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52218
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52218
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c91bf87a35256b7b6ba61de8ca55cabff432234c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52218
AND Item_ID = 2)
WHERE Reciept_Id=52218
AND Item_ID = 2
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c91bf87a35256b7b6ba61de8ca55cabff432234c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52218
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52218
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7ef2fd1dac2533efc88f21a71cc2bff1c93b9f0
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=52337
AND Item_ID = 20
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7ef2fd1dac2533efc88f21a71cc2bff1c93b9f0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52337
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52337
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 11835ca449a742a6df93a31b1289e3a6824bba42
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52337
AND Item_ID = 7)
WHERE Reciept_Id=52337
AND Item_ID = 7
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 11835ca449a742a6df93a31b1289e3a6824bba42
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52337
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52337
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9cf23a053255daa46f4981d3aa21c33a5b0be4b1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50201
AND Item_ID = 30)
WHERE Reciept_Id=50201
AND Item_ID = 30
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9cf23a053255daa46f4981d3aa21c33a5b0be4b1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50201
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50201
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 53e7cff4b32f93df7ab62a5494a08c993c47880d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50201
AND Item_ID = 10)
WHERE Reciept_Id=50201
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 53e7cff4b32f93df7ab62a5494a08c993c47880d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50201
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50201
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96f0c9c8b9e3f97cd53c0623e73f762004e55bab
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50257
AND Item_ID = 11)
WHERE Reciept_Id=50257
AND Item_ID = 11
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96f0c9c8b9e3f97cd53c0623e73f762004e55bab
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50257
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50257
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4b7ab349a73a42a78a4ee87930b49b1f037987fe
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50299
AND Item_ID = 4)
WHERE Reciept_Id=50299
AND Item_ID = 4
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4b7ab349a73a42a78a4ee87930b49b1f037987fe
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50299
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50299
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6db8c0600d5bd60e867922902e7f1585266dd37e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50299
AND Item_ID = 11)
WHERE Reciept_Id=50299
AND Item_ID = 11
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6db8c0600d5bd60e867922902e7f1585266dd37e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50299
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50299
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cee1e4af8f46331159e1aa61f7c8e4bcb1b7b798
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50616
AND Item_ID = 28)
WHERE Reciept_Id=50616
AND Item_ID = 28
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cee1e4af8f46331159e1aa61f7c8e4bcb1b7b798
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50616
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50616
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abd697758716a0fc3d7f81260bfaebba54ff7e5a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50616
AND Item_ID = 23)
WHERE Reciept_Id=50616
AND Item_ID = 23
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abd697758716a0fc3d7f81260bfaebba54ff7e5a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50616
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50616
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 78a51391e9863a1220c2ce49c73249a8da8015bf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51006
AND Item_ID = 10)
WHERE Reciept_Id=51006
AND Item_ID = 10
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 78a51391e9863a1220c2ce49c73249a8da8015bf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51006
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51006
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: baea039636bd3dcdd477a9a9e1eb54ecc248b397
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52152
AND Item_ID = 3)
WHERE Reciept_Id=52152
AND Item_ID = 3
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: baea039636bd3dcdd477a9a9e1eb54ecc248b397
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52152
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52152
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 629756bb2dc9d0735b4f69bc047eabd11a45b834
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50068
AND Item_ID = 11)
WHERE Reciept_Id=50068
AND Item_ID = 11
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 629756bb2dc9d0735b4f69bc047eabd11a45b834
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50068
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50068
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9dc24361442d079f06d0addd378ad0a8adc1d5c4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50156
AND Item_ID = 6)
WHERE Reciept_Id=50156
AND Item_ID = 6
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9dc24361442d079f06d0addd378ad0a8adc1d5c4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50156
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50156
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 024e196e8e17584b8d22bbebc3d04aa11a103088
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50156
AND Item_ID = 30)
WHERE Reciept_Id=50156
AND Item_ID = 30
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 024e196e8e17584b8d22bbebc3d04aa11a103088
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50156
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50156
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bbdcba4856632853cc52aa3527b735860c49bfe0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50746
AND Item_ID = 30)
WHERE Reciept_Id=50746
AND Item_ID = 30
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bbdcba4856632853cc52aa3527b735860c49bfe0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50746
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50746
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 162b38d3e8d5bf1b7c7de52f8c9e8f127b1cb5aa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50979
AND Item_ID = 7)
WHERE Reciept_Id=50979
AND Item_ID = 7
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 162b38d3e8d5bf1b7c7de52f8c9e8f127b1cb5aa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50979
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50979
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0debd9da73f1e6c54307b57069ded52fbb8941a4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51147
AND Item_ID = 5)
WHERE Reciept_Id=51147
AND Item_ID = 5
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0debd9da73f1e6c54307b57069ded52fbb8941a4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51147
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51147
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a6d5a8fda442c5597ffe073ee12a485dda6d5f0b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51696
AND Item_ID = 14)
WHERE Reciept_Id=51696
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a6d5a8fda442c5597ffe073ee12a485dda6d5f0b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51696
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51696
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16d4a3213cf9974016470a6c29c8cc50c636f737
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51708
AND Item_ID = 24)
WHERE Reciept_Id=51708
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16d4a3213cf9974016470a6c29c8cc50c636f737
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51708
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51708
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b32dd5855fb67e761b8f5b70705f9564ac3adfaa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50526
AND Item_ID = 9)
WHERE Reciept_Id=50526
AND Item_ID = 9
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b32dd5855fb67e761b8f5b70705f9564ac3adfaa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50526
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50526
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 469bb7d2f67d270aecd04bb40ee5d070694d4a30
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50526
AND Item_ID = 5)
WHERE Reciept_Id=50526
AND Item_ID = 5
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 469bb7d2f67d270aecd04bb40ee5d070694d4a30
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50526
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50526
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 02d75c2f630532fadd62a916d16ab2fcf6afc4a5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51751
AND Item_ID = 22)
WHERE Reciept_Id=51751
AND Item_ID = 22
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 02d75c2f630532fadd62a916d16ab2fcf6afc4a5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51751
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51751
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f6209fa9a83deb27bc3d067dea562286d9c7e91
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51751
AND Item_ID = 28)
WHERE Reciept_Id=51751
AND Item_ID = 28
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f6209fa9a83deb27bc3d067dea562286d9c7e91
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51751
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51751
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7408f33e4ef6a66c3354aa7a1223ff624ab68bad
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=52061
AND Item_ID = 24
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7408f33e4ef6a66c3354aa7a1223ff624ab68bad
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52061
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52061
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a71df5ce1f97796641a187abbc342df2ad783099
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52089
AND Item_ID = 14)
WHERE Reciept_Id=52089
AND Item_ID = 14
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a71df5ce1f97796641a187abbc342df2ad783099
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52089
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52089
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dab1b5b8d71247aed5c4e2435da76873d0ee0f2b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50324
AND Item_ID = 9)
WHERE Reciept_Id=50324
AND Item_ID = 9
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dab1b5b8d71247aed5c4e2435da76873d0ee0f2b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50324
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50324
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98c8ae8fe97062308c684c12e3df4f438b63cc5f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50324
AND Item_ID = 1)
WHERE Reciept_Id=50324
AND Item_ID = 1
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98c8ae8fe97062308c684c12e3df4f438b63cc5f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50324
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50324
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 79bc76d0d9826957048a3c30f34db9b3430b2712
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50672
AND Item_ID = 19)
WHERE Reciept_Id=50672
AND Item_ID = 19
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 79bc76d0d9826957048a3c30f34db9b3430b2712
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50672
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50672
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0af1f1631d3bd18cba9008f632f201ddb18c51de
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50723
AND Item_ID = 10)
WHERE Reciept_Id=50723
AND Item_ID = 10
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0af1f1631d3bd18cba9008f632f201ddb18c51de
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50723
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50723
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7516abca9e9314b2227369da297b64644d7af81
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51700
AND Item_ID = 13)
WHERE Reciept_Id=51700
AND Item_ID = 13
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b7516abca9e9314b2227369da297b64644d7af81
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51700
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51700
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8bfd3460f043f4d4cad5c3174b510e1b990efe0d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51907
AND Item_ID = 1)
WHERE Reciept_Id=51907
AND Item_ID = 1
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8bfd3460f043f4d4cad5c3174b510e1b990efe0d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51907
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51907
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4fd67d07312207b8755e5c49da962e0a42af7f0f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52375
AND Item_ID = 10)
WHERE Reciept_Id=52375
AND Item_ID = 10
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4fd67d07312207b8755e5c49da962e0a42af7f0f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52375
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52375
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13db09671834bb4c6f002a9c169f4fb50b9e04fb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50027
AND Item_ID = 22)
WHERE Reciept_Id=50027
AND Item_ID = 22
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13db09671834bb4c6f002a9c169f4fb50b9e04fb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50027
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50027
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92a09dace8d2a3f21e0e6d03b0fe2938eadd448f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50828
AND Item_ID = 28)
WHERE Reciept_Id=50828
AND Item_ID = 28
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92a09dace8d2a3f21e0e6d03b0fe2938eadd448f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50828
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50828
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f769106ae1bfd15c5dbd5cf05f6e461188ba4cf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50828
AND Item_ID = 29)
WHERE Reciept_Id=50828
AND Item_ID = 29
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f769106ae1bfd15c5dbd5cf05f6e461188ba4cf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50828
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50828
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74eaf03a242e7aaf88478a5e265cdda7900d61b0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51648
AND Item_ID = 11)
WHERE Reciept_Id=51648
AND Item_ID = 11
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74eaf03a242e7aaf88478a5e265cdda7900d61b0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51648
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51648
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 93d76e5be46180ab5b63cc9f6283a5c22d394cc4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51802
AND Item_ID = 6)
WHERE Reciept_Id=51802
AND Item_ID = 6
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 93d76e5be46180ab5b63cc9f6283a5c22d394cc4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51802
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51802
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b263114a239468865659e1138a22504ba561d9c3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51404
AND Item_ID = 14)
WHERE Reciept_Id=51404
AND Item_ID = 14
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b263114a239468865659e1138a22504ba561d9c3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51404
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51404
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 36ad3fd954c58479b1f90f0ed2102ec159d122fa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50036
AND Item_ID = 23)
WHERE Reciept_Id=50036
AND Item_ID = 23
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 36ad3fd954c58479b1f90f0ed2102ec159d122fa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50036
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50036
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f89c419966339b98e327da30f48f7ce6ae45f74
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50036
AND Item_ID = 11)
WHERE Reciept_Id=50036
AND Item_ID = 11
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f89c419966339b98e327da30f48f7ce6ae45f74
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50036
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50036
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cd5f04c1e750907029b447703c4098fe49c57c4e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51599
AND Item_ID = 8)
WHERE Reciept_Id=51599
AND Item_ID = 8
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cd5f04c1e750907029b447703c4098fe49c57c4e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51599
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51599
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e56bdb2726ebb3668746f351b58d27f65e75deee
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52033
AND Item_ID = 3)
WHERE Reciept_Id=52033
AND Item_ID = 3
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e56bdb2726ebb3668746f351b58d27f65e75deee
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52033
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52033
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 38f276de2fddf96d5bcc088490d342bd650d39cb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50207
AND Item_ID = 18)
WHERE Reciept_Id=50207
AND Item_ID = 18
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 38f276de2fddf96d5bcc088490d342bd650d39cb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50207
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50207
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7728a11147bd7fb8c0add0764afd4b8ed736800b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50207
AND Item_ID = 17)
WHERE Reciept_Id=50207
AND Item_ID = 17
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7728a11147bd7fb8c0add0764afd4b8ed736800b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50207
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50207
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa45d4544720c663584fde26fce1af859854c7cb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50706
AND Item_ID = 3)
WHERE Reciept_Id=50706
AND Item_ID = 3
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa45d4544720c663584fde26fce1af859854c7cb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50706
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50706
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cf222c0160ddb8839276c9454df0ed1abcb806bf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50762
AND Item_ID = 21)
WHERE Reciept_Id=50762
AND Item_ID = 21
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cf222c0160ddb8839276c9454df0ed1abcb806bf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50762
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50762
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c66f31372b9a6b5661b4a629f376b7d1b2dfa1e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51448
AND Item_ID = 23)
WHERE Reciept_Id=51448
AND Item_ID = 23
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c66f31372b9a6b5661b4a629f376b7d1b2dfa1e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51448
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51448
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aed3b9bfdadd766005d220afeabc9f68d03eeeb2
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=51448
AND Item_ID = 20
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aed3b9bfdadd766005d220afeabc9f68d03eeeb2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51448
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51448
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ab50151e6fb94d1955002d5d20f79068bf0ee31
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52029
AND Item_ID = 5)
WHERE Reciept_Id=52029
AND Item_ID = 5
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ab50151e6fb94d1955002d5d20f79068bf0ee31
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52029
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52029
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 670fc7c81dc76cfbcf7e483311726766b665ff81
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52187
AND Item_ID = 21)
WHERE Reciept_Id=52187
AND Item_ID = 21
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 670fc7c81dc76cfbcf7e483311726766b665ff81
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52187
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52187
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fcb5beb3f2278d435d6c7b6a3057548d0a8f404e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50137
AND Item_ID = 28)
WHERE Reciept_Id=50137
AND Item_ID = 28
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fcb5beb3f2278d435d6c7b6a3057548d0a8f404e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50137
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50137
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 89834f31c0e151ab4cf6abc5042720e89b4796d6
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=50162
AND Item_ID = 8
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 89834f31c0e151ab4cf6abc5042720e89b4796d6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50162
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50162
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 73158bc5cf8706cf083d4d0a72ab65b62d2eedc8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50162
AND Item_ID = 14)
WHERE Reciept_Id=50162
AND Item_ID = 14
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 73158bc5cf8706cf083d4d0a72ab65b62d2eedc8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50162
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50162
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 652f0c3b5edda94b96f80c336efe37a7584a19f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50786
AND Item_ID = 2)
WHERE Reciept_Id=50786
AND Item_ID = 2
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 652f0c3b5edda94b96f80c336efe37a7584a19f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50786
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50786
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 659512b4c47ab4d2ec3952bb76480d90550695ae
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50884
AND Item_ID = 15)
WHERE Reciept_Id=50884
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 659512b4c47ab4d2ec3952bb76480d90550695ae
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50884
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50884
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dbd05bbf9b781063ea4ee8cf93b5079fadbeb8b0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50953
AND Item_ID = 30)
WHERE Reciept_Id=50953
AND Item_ID = 30
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dbd05bbf9b781063ea4ee8cf93b5079fadbeb8b0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50953
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50953
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 05b198cc9c1de8afbc4e97187c6e325ca11907ed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50953
AND Item_ID = 29)
WHERE Reciept_Id=50953
AND Item_ID = 29
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 05b198cc9c1de8afbc4e97187c6e325ca11907ed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50953
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50953
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75a08ebd2832ab4b58a8aaaeb429775bd2464606
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51487
AND Item_ID = 22)
WHERE Reciept_Id=51487
AND Item_ID = 22
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75a08ebd2832ab4b58a8aaaeb429775bd2464606
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51487
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51487
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9b8f79ef16652f8e54831e18b6374eee604c6884
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52363
AND Item_ID = 2)
WHERE Reciept_Id=52363
AND Item_ID = 2
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9b8f79ef16652f8e54831e18b6374eee604c6884
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52363
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52363
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b312c50846a630e026b2b9381bd637f79b8def23
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50186
AND Item_ID = 6)
WHERE Reciept_Id=50186
AND Item_ID = 6
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b312c50846a630e026b2b9381bd637f79b8def23
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50186
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50186
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f5c3852cf20ca565c17735e27d73a699399c49
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51012
AND Item_ID = 14)
WHERE Reciept_Id=51012
AND Item_ID = 14
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f5c3852cf20ca565c17735e27d73a699399c49
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51012
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51012
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f5d5e69f8a9172d25a2ed0adca282b8cef5001
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51012
AND Item_ID = 19)
WHERE Reciept_Id=51012
AND Item_ID = 19
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f5d5e69f8a9172d25a2ed0adca282b8cef5001
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51012
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51012
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b8fb4d1645c92c12abe478b9f4f9a322eb133d2a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51012
AND Item_ID = 7)
WHERE Reciept_Id=51012
AND Item_ID = 7
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b8fb4d1645c92c12abe478b9f4f9a322eb133d2a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51012
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51012
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d68ce9da414880d97e8bb474fa6064356b6cba61
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51757
AND Item_ID = 20)
WHERE Reciept_Id=51757
AND Item_ID = 20
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d68ce9da414880d97e8bb474fa6064356b6cba61
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51757
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51757
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1f963f6371a41934a60a9153175f6aa9562e5d3f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52182
AND Item_ID = 28)
WHERE Reciept_Id=52182
AND Item_ID = 28
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1f963f6371a41934a60a9153175f6aa9562e5d3f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52182
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52182
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ac5cb34e5fbf589ec1160010744c1b9eee90eaad
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=52338
AND Item_ID = 2
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ac5cb34e5fbf589ec1160010744c1b9eee90eaad
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52338
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52338
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59f312ac3fee2a74e23bbbf0879951699de38f03
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52338
AND Item_ID = 8)
WHERE Reciept_Id=52338
AND Item_ID = 8
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59f312ac3fee2a74e23bbbf0879951699de38f03
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52338
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52338
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: acfb19961fb9ed5aa16ae1176df46b3350eb3b84
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50262
AND Item_ID = 8)
WHERE Reciept_Id=50262
AND Item_ID = 8
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: acfb19961fb9ed5aa16ae1176df46b3350eb3b84
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50262
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50262
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3dfc4b301dab81dfb424c8b229343776eaee456d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50262
AND Item_ID = 28)
WHERE Reciept_Id=50262
AND Item_ID = 28
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3dfc4b301dab81dfb424c8b229343776eaee456d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50262
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50262
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abad2fe207402cff505ff493718c86c995797cfe
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51338
AND Item_ID = 15)
WHERE Reciept_Id=51338
AND Item_ID = 15
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abad2fe207402cff505ff493718c86c995797cfe
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51338
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51338
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e685076dabc8f5e4eeb1c81b68fa08bf272388bd
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=51762
AND Item_ID = 30
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e685076dabc8f5e4eeb1c81b68fa08bf272388bd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51762
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51762
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 85f175405fb938d359c8de0343c3045ff2c76203
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51762
AND Item_ID = 5)
WHERE Reciept_Id=51762
AND Item_ID = 5
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 85f175405fb938d359c8de0343c3045ff2c76203
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51762
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51762
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 010a486088bcd84a0ea9f96d503ef59238fb4343
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51284
AND Item_ID = 12)
WHERE Reciept_Id=51284
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 010a486088bcd84a0ea9f96d503ef59238fb4343
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51284
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51284
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a6bf44c245b19966e7ddee0ec009c0c7c0cc82a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51578
AND Item_ID = 16)
WHERE Reciept_Id=51578
AND Item_ID = 16
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a6bf44c245b19966e7ddee0ec009c0c7c0cc82a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51578
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51578
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49537114cd768fdc9ca8339e5e4229b4e9b5142d
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=51692
AND Item_ID = 11
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49537114cd768fdc9ca8339e5e4229b4e9b5142d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51692
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51692
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49d5ff096511e45d65119213cc8616dfb696fb97
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50316
AND Item_ID = 29)
WHERE Reciept_Id=50316
AND Item_ID = 29
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49d5ff096511e45d65119213cc8616dfb696fb97
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50316
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50316
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1f8640467a1df512fa814aa75ec18f4993904b8a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51344
AND Item_ID = 30)
WHERE Reciept_Id=51344
AND Item_ID = 30
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1f8640467a1df512fa814aa75ec18f4993904b8a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51344
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51344
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 99f295318b1a14355c550dff668b25031f97de0c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52336
AND Item_ID = 20)
WHERE Reciept_Id=52336
AND Item_ID = 20
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 99f295318b1a14355c550dff668b25031f97de0c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52336
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52336
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aab61b5d64c9b677d1dac26a0a9b27d757c379aa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52192
AND Item_ID = 11)
WHERE Reciept_Id=52192
AND Item_ID = 11
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aab61b5d64c9b677d1dac26a0a9b27d757c379aa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52192
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52192
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1d6a7812daf5156cdca8e5df3e66201a1efee5f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52192
AND Item_ID = 14)
WHERE Reciept_Id=52192
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1d6a7812daf5156cdca8e5df3e66201a1efee5f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52192
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52192
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e310093275395cf29edc7df8d36e2c34ced86da9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50193
AND Item_ID = 14)
WHERE Reciept_Id=50193
AND Item_ID = 14
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e310093275395cf29edc7df8d36e2c34ced86da9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50193
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50193
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d49a16022131a3ac0aae3fe9a14120f18322a9c0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51069
AND Item_ID = 15)
WHERE Reciept_Id=51069
AND Item_ID = 15
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d49a16022131a3ac0aae3fe9a14120f18322a9c0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51069
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51069
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fdf72a8e97f3c5d4d53105b643eb0c5d67e2e107
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51763
AND Item_ID = 18)
WHERE Reciept_Id=51763
AND Item_ID = 18
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fdf72a8e97f3c5d4d53105b643eb0c5d67e2e107
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51763
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51763
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 80791dfc9126fc099c8b017920d0c6a1e8128b85
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=51330
AND Item_ID = 17
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 80791dfc9126fc099c8b017920d0c6a1e8128b85
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51330
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51330
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f99e20e2c80b9e46aa0f872bb476ee9de10a7245
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51330
AND Item_ID = 24)
WHERE Reciept_Id=51330
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f99e20e2c80b9e46aa0f872bb476ee9de10a7245
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51330
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51330
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7b5422668be58860fe0ca5ed9a387afd853e3e5e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51733
AND Item_ID = 14)
WHERE Reciept_Id=51733
AND Item_ID = 14
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7b5422668be58860fe0ca5ed9a387afd853e3e5e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51733
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51733
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf7e72b7ae7b16489291249d3c449350f1fd5bc8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52395
AND Item_ID = 25)
WHERE Reciept_Id=52395
AND Item_ID = 25
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf7e72b7ae7b16489291249d3c449350f1fd5bc8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52395
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52395
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3eab99a27f9f516254bdf78e697f6c7a11a38c3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52466
AND Item_ID = 7)
WHERE Reciept_Id=52466
AND Item_ID = 7
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3eab99a27f9f516254bdf78e697f6c7a11a38c3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52466
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52466
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07529be3ce8fd9e48cf7e8440358e412ad6750ec
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50677
AND Item_ID = 25)
WHERE Reciept_Id=50677
AND Item_ID = 25
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07529be3ce8fd9e48cf7e8440358e412ad6750ec
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50677
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50677
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d9268b3eb9002cf4746842315696f11aa789e9e2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50677
AND Item_ID = 21)
WHERE Reciept_Id=50677
AND Item_ID = 21
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d9268b3eb9002cf4746842315696f11aa789e9e2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50677
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50677
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bc1c2b584b6e298b505b1218672e0b4cef94bcef
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51024
AND Item_ID = 2)
WHERE Reciept_Id=51024
AND Item_ID = 2
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bc1c2b584b6e298b505b1218672e0b4cef94bcef
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51024
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51024
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da5a2b81a6666b9bd4562ab7e59a6dcc20e892ce
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51024
AND Item_ID = 5)
WHERE Reciept_Id=51024
AND Item_ID = 5
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da5a2b81a6666b9bd4562ab7e59a6dcc20e892ce
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51024
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51024
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 52a0d82f63a9b87d61e910e8bb66cf3b33a57f53
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51312
AND Item_ID = 7)
WHERE Reciept_Id=51312
AND Item_ID = 7
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 52a0d82f63a9b87d61e910e8bb66cf3b33a57f53
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51312
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51312
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0f447140ffc7317df0f1e1f3eb480b5f604c3a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50760
AND Item_ID = 7)
WHERE Reciept_Id=50760
AND Item_ID = 7
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0f447140ffc7317df0f1e1f3eb480b5f604c3a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50760
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50760
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: af3465b2b5f04ae98242a01c119a4fe11866d31b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50969
AND Item_ID = 7)
WHERE Reciept_Id=50969
AND Item_ID = 7
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: af3465b2b5f04ae98242a01c119a4fe11866d31b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50969
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50969
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7516354a65942031bd58e398fb7ed950ff68f1a2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51411
AND Item_ID = 26)
WHERE Reciept_Id=51411
AND Item_ID = 26
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7516354a65942031bd58e398fb7ed950ff68f1a2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51411
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51411
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad9ec725576c395e752686ad76f37c72c84ed8ea
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51411
AND Item_ID = 4)
WHERE Reciept_Id=51411
AND Item_ID = 4
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad9ec725576c395e752686ad76f37c72c84ed8ea
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51411
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51411
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1880bfb385bcfd3f4fe0a74115c0d0583a7105b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51495
AND Item_ID = 7)
WHERE Reciept_Id=51495
AND Item_ID = 7
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1880bfb385bcfd3f4fe0a74115c0d0583a7105b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51495
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51495
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9e49d94ab56c8d1a47338b7bfdc90a3fd16b054a
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=51552
AND Item_ID = 3
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9e49d94ab56c8d1a47338b7bfdc90a3fd16b054a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51552
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51552
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 78f18cdccfea0f5addf2b508043d335820cbfe19
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52120
AND Item_ID = 24)
WHERE Reciept_Id=52120
AND Item_ID = 24
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 78f18cdccfea0f5addf2b508043d335820cbfe19
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52120
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52120
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 399d44f3208702880dd637ce8ecdad264b5a03e5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50353
AND Item_ID = 11)
WHERE Reciept_Id=50353
AND Item_ID = 11
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 399d44f3208702880dd637ce8ecdad264b5a03e5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50353
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50353
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c07720b3060bea3c0d6885815a41ce6f1ab888be
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51406
AND Item_ID = 29)
WHERE Reciept_Id=51406
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c07720b3060bea3c0d6885815a41ce6f1ab888be
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51406
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51406
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c67f69efa81c7572f9e23582aa271686f1b3d44
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51407
AND Item_ID = 21)
WHERE Reciept_Id=51407
AND Item_ID = 21
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c67f69efa81c7572f9e23582aa271686f1b3d44
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51407
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51407
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 639969b3459a9a940976e3e5fb3b2afb1f063650
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51698
AND Item_ID = 26)
WHERE Reciept_Id=51698
AND Item_ID = 26
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 639969b3459a9a940976e3e5fb3b2afb1f063650
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51698
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51698
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c6728e586aa74b89388fe030e7f5f84772366f72
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=50646
AND Item_ID = 14
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c6728e586aa74b89388fe030e7f5f84772366f72
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50646
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50646
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 606d3cfe454c47009233e14f55ca0e208e92e130
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=52202
AND Item_ID = 2
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 606d3cfe454c47009233e14f55ca0e208e92e130
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52202
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52202
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cd279fedde53f019bd75b74f3e085addb252bc22
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52202
AND Item_ID = 28)
WHERE Reciept_Id=52202
AND Item_ID = 28
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cd279fedde53f019bd75b74f3e085addb252bc22
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52202
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52202
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d9f2cb01d4c3233354d9cf93ac42014feb8d6f1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52251
AND Item_ID = 6)
WHERE Reciept_Id=52251
AND Item_ID = 6
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d9f2cb01d4c3233354d9cf93ac42014feb8d6f1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52251
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52251
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0d8ead25d695927a2bfa5e1e5aa252755ef0f726
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50491
AND Item_ID = 20)
WHERE Reciept_Id=50491
AND Item_ID = 20
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0d8ead25d695927a2bfa5e1e5aa252755ef0f726
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50491
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50491
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa6cef30ae0a9a43775d5eca272c8c05fd712b15
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=50491
AND Item_ID = 21
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa6cef30ae0a9a43775d5eca272c8c05fd712b15
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50491
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50491
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 382f2dea5c12b6636f14aba3cf7ec068b476ab48
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51777
AND Item_ID = 13)
WHERE Reciept_Id=51777
AND Item_ID = 13
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 382f2dea5c12b6636f14aba3cf7ec068b476ab48
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51777
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51777
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c087e5a15dbd9e8bdd56e7f1f45714775478cadf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51898
AND Item_ID = 29)
WHERE Reciept_Id=51898
AND Item_ID = 29
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c087e5a15dbd9e8bdd56e7f1f45714775478cadf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51898
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51898
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ff60311dcb158151528fbbd55489ff94e5e83917
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50070
AND Item_ID = 22)
WHERE Reciept_Id=50070
AND Item_ID = 22
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ff60311dcb158151528fbbd55489ff94e5e83917
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50070
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50070
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 839a87eb7b593c3b198780c5b04c47e0b85c6254
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51756
AND Item_ID = 21)
WHERE Reciept_Id=51756
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 839a87eb7b593c3b198780c5b04c47e0b85c6254
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51756
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51756
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64ac02330d7153d12f79ddac4392f9cdd86046b0
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=51955
AND Item_ID = 23
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64ac02330d7153d12f79ddac4392f9cdd86046b0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51955
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51955
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 513f6ba57f4edaffe5d20bed9e50a8d5fa89aea9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52114
AND Item_ID = 7)
WHERE Reciept_Id=52114
AND Item_ID = 7
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 513f6ba57f4edaffe5d20bed9e50a8d5fa89aea9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52114
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52114
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd18a6bf84a220a8170f76c99e25a5708386568e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50301
AND Item_ID = 22)
WHERE Reciept_Id=50301
AND Item_ID = 22
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd18a6bf84a220a8170f76c99e25a5708386568e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50301
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50301
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd2e7bf4140450b348f5cf517df4c2439d1e953f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50475
AND Item_ID = 5)
WHERE Reciept_Id=50475
AND Item_ID = 5
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd2e7bf4140450b348f5cf517df4c2439d1e953f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50475
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50475
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 639087e7287552e02cc40c5f841ef25d2adeccdb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51930
AND Item_ID = 6)
WHERE Reciept_Id=51930
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 639087e7287552e02cc40c5f841ef25d2adeccdb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51930
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51930
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fbae25d437c09b89636eab7d5518ce99a462599f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51930
AND Item_ID = 13)
WHERE Reciept_Id=51930
AND Item_ID = 13
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fbae25d437c09b89636eab7d5518ce99a462599f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51930
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51930
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7f1631f916f23424b96dfd53fd52affc48084e1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50523
AND Item_ID = 10)
WHERE Reciept_Id=50523
AND Item_ID = 10
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d7f1631f916f23424b96dfd53fd52affc48084e1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50523
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50523
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96047656d1593e2fc0e7193cc8bef7a429e7a231
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50710
AND Item_ID = 14)
WHERE Reciept_Id=50710
AND Item_ID = 14
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96047656d1593e2fc0e7193cc8bef7a429e7a231
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50710
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50710
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24946e0fff772300c7d01d5c501237387b088621
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50169
AND Item_ID = 28)
WHERE Reciept_Id=50169
AND Item_ID = 28
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24946e0fff772300c7d01d5c501237387b088621
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50169
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50169
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4638f75046adfd7f190bcafff2cd158725ee8f2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50169
AND Item_ID = 3)
WHERE Reciept_Id=50169
AND Item_ID = 3
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4638f75046adfd7f190bcafff2cd158725ee8f2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50169
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50169
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a71964a758c37d4f69f5d0539cc3534b7df64233
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51744
AND Item_ID = 14)
WHERE Reciept_Id=51744
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a71964a758c37d4f69f5d0539cc3534b7df64233
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51744
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51744
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a7196a56c694957529cb17a4bab249480fc8481
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52052
AND Item_ID = 27)
WHERE Reciept_Id=52052
AND Item_ID = 27
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a7196a56c694957529cb17a4bab249480fc8481
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52052
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52052
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 252e5686c266038d94fd1b27acbe78ee527781bc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52052
AND Item_ID = 18)
WHERE Reciept_Id=52052
AND Item_ID = 18
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 252e5686c266038d94fd1b27acbe78ee527781bc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52052
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52052
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f18b428707bfbd19febe758b1379b8384f7af63d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52073
AND Item_ID = 12)
WHERE Reciept_Id=52073
AND Item_ID = 12
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f18b428707bfbd19febe758b1379b8384f7af63d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52073
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52073
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8a99e28b0db06b95f0ddd996ccf6509a18b30d45
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=52073
AND Item_ID = 25
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8a99e28b0db06b95f0ddd996ccf6509a18b30d45
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52073
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52073
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d55525c5aba077d8b5bc7e190abf01dd4a70fb89
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50492
AND Item_ID = 16)
WHERE Reciept_Id=50492
AND Item_ID = 16
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d55525c5aba077d8b5bc7e190abf01dd4a70fb89
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50492
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50492
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 08f0a088d0ec89d7acbab8608cbb862853b7b3c9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50492
AND Item_ID = 21)
WHERE Reciept_Id=50492
AND Item_ID = 21
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 08f0a088d0ec89d7acbab8608cbb862853b7b3c9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50492
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50492
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13bf8ca9a1720ed5678b74f044509f57a43f1113
UPDATE Assignment1Data 
SET [Item_Quantity]=6
WHERE Reciept_Id=50589
AND Item_ID = 4
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13bf8ca9a1720ed5678b74f044509f57a43f1113
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50589
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50589
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6fd727ab2e1e6019fd12f4f3a7cf48c15bf6b02c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51112
AND Item_ID = 18)
WHERE Reciept_Id=51112
AND Item_ID = 18
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6fd727ab2e1e6019fd12f4f3a7cf48c15bf6b02c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51112
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51112
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e0e72e495dadb81f86a440f0b73c5993e3bc2e4e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51620
AND Item_ID = 7)
WHERE Reciept_Id=51620
AND Item_ID = 7
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e0e72e495dadb81f86a440f0b73c5993e3bc2e4e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51620
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51620
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0ecbf1a8809dcd6201e24477ce70ca6e6a3767ac
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51305
AND Item_ID = 17)
WHERE Reciept_Id=51305
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0ecbf1a8809dcd6201e24477ce70ca6e6a3767ac
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51305
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51305
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ead486e2cca0baba852d97ee37fa86398bab81c2
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=50028
AND Item_ID = 19
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ead486e2cca0baba852d97ee37fa86398bab81c2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50028
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50028
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 62e11b67a44c2177598e5b7640d5583c0986901f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50525
AND Item_ID = 30)
WHERE Reciept_Id=50525
AND Item_ID = 30
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 62e11b67a44c2177598e5b7640d5583c0986901f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50525
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50525
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a41e2eb7c7e4b47ba91ef42fcf52af41afe326e
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=51353
AND Item_ID = 17
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a41e2eb7c7e4b47ba91ef42fcf52af41afe326e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51353
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51353
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74a383c26d4cdc03dd06b071535f035c4421da81
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50662
AND Item_ID = 17)
WHERE Reciept_Id=50662
AND Item_ID = 17
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74a383c26d4cdc03dd06b071535f035c4421da81
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50662
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50662
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e19a5ee6919f009230b60495c2dd08507650239e
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=50662
AND Item_ID = 28
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e19a5ee6919f009230b60495c2dd08507650239e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50662
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50662
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 03a506aa5443ef5fa87dfff64694155ab7a76119
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50817
AND Item_ID = 2)
WHERE Reciept_Id=50817
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 03a506aa5443ef5fa87dfff64694155ab7a76119
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50817
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50817
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6786abfcb903a9d0617b7ad98568e1aa1720d511
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50581
AND Item_ID = 12)
WHERE Reciept_Id=50581
AND Item_ID = 12
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6786abfcb903a9d0617b7ad98568e1aa1720d511
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50581
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50581
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aafe8fd8b65f0aaf3129c70518e1537ad2824523
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50993
AND Item_ID = 24)
WHERE Reciept_Id=50993
AND Item_ID = 24
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aafe8fd8b65f0aaf3129c70518e1537ad2824523
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50993
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50993
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71c7d5d207a4ab6053e25e3550069df388271e0e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50993
AND Item_ID = 18)
WHERE Reciept_Id=50993
AND Item_ID = 18
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71c7d5d207a4ab6053e25e3550069df388271e0e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50993
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50993
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5117f2204261bc33b1c682342e6c0894d910e1b0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52110
AND Item_ID = 23)
WHERE Reciept_Id=52110
AND Item_ID = 23
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5117f2204261bc33b1c682342e6c0894d910e1b0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52110
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52110
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4324e03dae559df0c1f1a0e6aa8988a1ea3bb45c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52110
AND Item_ID = 16)
WHERE Reciept_Id=52110
AND Item_ID = 16
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4324e03dae559df0c1f1a0e6aa8988a1ea3bb45c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52110
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52110
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 38da42c45942e2d1380a4c5cd44471b6f55e0249
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=50558
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 38da42c45942e2d1380a4c5cd44471b6f55e0249
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50558
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50558
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb87db592d5538b811a549d2dbdbecd7cc78cce7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52235
AND Item_ID = 13)
WHERE Reciept_Id=52235
AND Item_ID = 13
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb87db592d5538b811a549d2dbdbecd7cc78cce7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52235
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52235
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 876d05ba10958b51c971e575f2a7cbe62d100561
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52235
AND Item_ID = 17)
WHERE Reciept_Id=52235
AND Item_ID = 17
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 876d05ba10958b51c971e575f2a7cbe62d100561
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52235
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52235
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98b6d7a83838ec1cc2749522be113036af8cb459
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50285
AND Item_ID = 23)
WHERE Reciept_Id=50285
AND Item_ID = 23
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98b6d7a83838ec1cc2749522be113036af8cb459
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50285
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50285
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71f67395219a3dcc6af7581710c59bfeb1e2a4a6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51638
AND Item_ID = 26)
WHERE Reciept_Id=51638
AND Item_ID = 26
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71f67395219a3dcc6af7581710c59bfeb1e2a4a6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51638
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51638
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1c0c80129a0cd1f1538f6c10c7211d45952de7e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50649
AND Item_ID = 5)
WHERE Reciept_Id=50649
AND Item_ID = 5
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1c0c80129a0cd1f1538f6c10c7211d45952de7e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50649
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50649
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c07419750fae4484969b73c70c8d8ac3287ce320
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51021
AND Item_ID = 2)
WHERE Reciept_Id=51021
AND Item_ID = 2
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c07419750fae4484969b73c70c8d8ac3287ce320
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51021
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51021
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b066b17f91127068c4705e1d1d548c4cbc1b2c8a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52216
AND Item_ID = 12)
WHERE Reciept_Id=52216
AND Item_ID = 12
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b066b17f91127068c4705e1d1d548c4cbc1b2c8a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52216
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52216
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 65a8c9a654c5f6c4a4dc5c074c3aa94f03900e97
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52216
AND Item_ID = 30)
WHERE Reciept_Id=52216
AND Item_ID = 30
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 65a8c9a654c5f6c4a4dc5c074c3aa94f03900e97
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52216
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52216
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75a4d23686269a385f425a57246fb14ba81325a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50443
AND Item_ID = 15)
WHERE Reciept_Id=50443
AND Item_ID = 15
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75a4d23686269a385f425a57246fb14ba81325a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50443
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50443
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 539c938fb0de3d6899048b26414c5f86f923630d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50553
AND Item_ID = 24)
WHERE Reciept_Id=50553
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 539c938fb0de3d6899048b26414c5f86f923630d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50553
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50553
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86869130df2b8682c061f52d66d4a965f37e6754
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51850
AND Item_ID = 21)
WHERE Reciept_Id=51850
AND Item_ID = 21
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86869130df2b8682c061f52d66d4a965f37e6754
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51850
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51850
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a6637ed0dea845e727f91fabbfa7bcc2cd57af1d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50759
AND Item_ID = 29)
WHERE Reciept_Id=50759
AND Item_ID = 29
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a6637ed0dea845e727f91fabbfa7bcc2cd57af1d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50759
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50759
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d5db385f4112e6565a67eedc11a1adc603f50b0e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51150
AND Item_ID = 12)
WHERE Reciept_Id=51150
AND Item_ID = 12
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d5db385f4112e6565a67eedc11a1adc603f50b0e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51150
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51150
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1090bc8bef35301c9338e52b71ee15e6ece61bf9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51150
AND Item_ID = 15)
WHERE Reciept_Id=51150
AND Item_ID = 15
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1090bc8bef35301c9338e52b71ee15e6ece61bf9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51150
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51150
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 191bbe71f090cd1aaa3fc60937eaeae427a20785
UPDATE Assignment1Data 
SET [Item_Quantity]=18
WHERE Reciept_Id=51592
AND Item_ID = 7
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 191bbe71f090cd1aaa3fc60937eaeae427a20785
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51592
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51592
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59f8f812305fd6df1ab62752bb964a3b02d14dbd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51592
AND Item_ID = 2)
WHERE Reciept_Id=51592
AND Item_ID = 2
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59f8f812305fd6df1ab62752bb964a3b02d14dbd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51592
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51592
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3b5521b8aa69540a83dea9607dbd21df268ce54a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50232
AND Item_ID = 12)
WHERE Reciept_Id=50232
AND Item_ID = 12
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3b5521b8aa69540a83dea9607dbd21df268ce54a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50232
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50232
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1c7278a751fa577585d19a41e7776e71864da2c3
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=50427
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1c7278a751fa577585d19a41e7776e71864da2c3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50427
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50427
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28b1d18cca3d6ff103bffdf25d6534d6ff1448ab
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50427
AND Item_ID = 7)
WHERE Reciept_Id=50427
AND Item_ID = 7
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28b1d18cca3d6ff103bffdf25d6534d6ff1448ab
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50427
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50427
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3bce2988a0f27c5abad67953af1b2d4d780906aa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50980
AND Item_ID = 10)
WHERE Reciept_Id=50980
AND Item_ID = 10
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3bce2988a0f27c5abad67953af1b2d4d780906aa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50980
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50980
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 35ae968ccc2e4e2790926cf543280716d459b5b4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50340
AND Item_ID = 23)
WHERE Reciept_Id=50340
AND Item_ID = 23
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 35ae968ccc2e4e2790926cf543280716d459b5b4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50340
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50340
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c45ef894bcfad7d0af49ed445d3d8178e152e87c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51029
AND Item_ID = 9)
WHERE Reciept_Id=51029
AND Item_ID = 9
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c45ef894bcfad7d0af49ed445d3d8178e152e87c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51029
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51029
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 08245d909907edeb1381d5dc15163647c0fb9168
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51034
AND Item_ID = 7)
WHERE Reciept_Id=51034
AND Item_ID = 7
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 08245d909907edeb1381d5dc15163647c0fb9168
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51034
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51034
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 79162f2ae57edef8480359e54405acb6d72ea180
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51034
AND Item_ID = 24)
WHERE Reciept_Id=51034
AND Item_ID = 24
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 79162f2ae57edef8480359e54405acb6d72ea180
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51034
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51034
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bcb0628cb491f9a746d2e2b55fe5866be4ff9bf0
UPDATE Assignment1Data 
SET [Item_Quantity]=6
WHERE Reciept_Id=51405
AND Item_ID = 20
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bcb0628cb491f9a746d2e2b55fe5866be4ff9bf0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51405
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51405
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6b12d93f21b6378493a97007f94c6547df38eea9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51550
AND Item_ID = 3)
WHERE Reciept_Id=51550
AND Item_ID = 3
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6b12d93f21b6378493a97007f94c6547df38eea9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51550
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51550
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d251bcce7d0c5075d8d4e1e2e4824b4f8da6259c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51737
AND Item_ID = 9)
WHERE Reciept_Id=51737
AND Item_ID = 9
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d251bcce7d0c5075d8d4e1e2e4824b4f8da6259c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51737
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51737
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d01d9cb4dc56ddc01e8ec89f438c4e1ef4419595
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50717
AND Item_ID = 14)
WHERE Reciept_Id=50717
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d01d9cb4dc56ddc01e8ec89f438c4e1ef4419595
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50717
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50717
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d1ffe8763a3d5474238cf77c671f9a307a23d2f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50327
AND Item_ID = 10)
WHERE Reciept_Id=50327
AND Item_ID = 10
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d1ffe8763a3d5474238cf77c671f9a307a23d2f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50327
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50327
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ef5ab6a817bcee7d328550535e4e83195cd58bc7
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=50875
AND Item_ID = 30
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ef5ab6a817bcee7d328550535e4e83195cd58bc7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50875
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50875
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4177b9db5fa7c268bde851e7f0b7f76c88ed4e31
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50984
AND Item_ID = 28)
WHERE Reciept_Id=50984
AND Item_ID = 28
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4177b9db5fa7c268bde851e7f0b7f76c88ed4e31
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50984
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50984
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 102491cb62214382732a3a860c05ab445b88cefc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50984
AND Item_ID = 11)
WHERE Reciept_Id=50984
AND Item_ID = 11
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 102491cb62214382732a3a860c05ab445b88cefc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50984
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50984
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a1b3d6bcca5bb3e1d1e2555e53810264dc895c9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50319
AND Item_ID = 11)
WHERE Reciept_Id=50319
AND Item_ID = 11
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7a1b3d6bcca5bb3e1d1e2555e53810264dc895c9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50319
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50319
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d6a781930968beb86fcc1336d84a285e5b034dda
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50840
AND Item_ID = 11)
WHERE Reciept_Id=50840
AND Item_ID = 11
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d6a781930968beb86fcc1336d84a285e5b034dda
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50840
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50840
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a5611c34957f9cbb82b6410c56396116503c9ba6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50840
AND Item_ID = 18)
WHERE Reciept_Id=50840
AND Item_ID = 18
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a5611c34957f9cbb82b6410c56396116503c9ba6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50840
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50840
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c0e20bd388840548e4b456c798e099cdea60f775
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51603
AND Item_ID = 27)
WHERE Reciept_Id=51603
AND Item_ID = 27
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c0e20bd388840548e4b456c798e099cdea60f775
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51603
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51603
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59fd3033dc2047a92916bad7363110305667be59
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51825
AND Item_ID = 1)
WHERE Reciept_Id=51825
AND Item_ID = 1
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59fd3033dc2047a92916bad7363110305667be59
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51825
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51825
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e2928d1176785b0a2f1aebebc11017ad7780582
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50216
AND Item_ID = 18)
WHERE Reciept_Id=50216
AND Item_ID = 18
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e2928d1176785b0a2f1aebebc11017ad7780582
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50216
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50216
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 29293be604d36dd31f7f71d22a4c8ca0b7f82090
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51088
AND Item_ID = 9)
WHERE Reciept_Id=51088
AND Item_ID = 9
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 29293be604d36dd31f7f71d22a4c8ca0b7f82090
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51088
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51088
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 594af44cab234ecd397dec5b483eaa3795279078
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51088
AND Item_ID = 29)
WHERE Reciept_Id=51088
AND Item_ID = 29
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 594af44cab234ecd397dec5b483eaa3795279078
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51088
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51088
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e77cbab0cac2c80c2dbe10ed38199cabf35e95ca
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=51088
AND Item_ID = 2
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e77cbab0cac2c80c2dbe10ed38199cabf35e95ca
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51088
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51088
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b68c91d019ad6d92244e1e034a102d76c84ccd11
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51555
AND Item_ID = 14)
WHERE Reciept_Id=51555
AND Item_ID = 14
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b68c91d019ad6d92244e1e034a102d76c84ccd11
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51555
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51555
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9aa19fecfc506de4c1694d5304a0b2bdab88f41c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51876
AND Item_ID = 9)
WHERE Reciept_Id=51876
AND Item_ID = 9
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9aa19fecfc506de4c1694d5304a0b2bdab88f41c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51876
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51876
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7aa773e6d632546c0b855a7fb59716d32165d9c1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51906
AND Item_ID = 17)
WHERE Reciept_Id=51906
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7aa773e6d632546c0b855a7fb59716d32165d9c1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51906
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51906
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 94f337ae5c22d3f085586b64c5156a1085c64c8f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51906
AND Item_ID = 28)
WHERE Reciept_Id=51906
AND Item_ID = 28
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 94f337ae5c22d3f085586b64c5156a1085c64c8f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51906
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51906
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 79db2eb8b0bdb1a2333414ad6631bb650674e46d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52359
AND Item_ID = 1)
WHERE Reciept_Id=52359
AND Item_ID = 1
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 79db2eb8b0bdb1a2333414ad6631bb650674e46d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52359
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52359
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ead708d481efa3137b53004d6017f42f4b8263f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52403
AND Item_ID = 18)
WHERE Reciept_Id=52403
AND Item_ID = 18
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ead708d481efa3137b53004d6017f42f4b8263f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52403
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52403
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59ecea4c659ee8e3bf3f26ff8a0dde602a063c86
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52455
AND Item_ID = 22)
WHERE Reciept_Id=52455
AND Item_ID = 22
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59ecea4c659ee8e3bf3f26ff8a0dde602a063c86
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52455
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52455
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 30e404d88f87c6cb035428a9fa2845859f6b5aef
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52455
AND Item_ID = 23)
WHERE Reciept_Id=52455
AND Item_ID = 23
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 30e404d88f87c6cb035428a9fa2845859f6b5aef
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52455
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52455
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 25a718d0812055c3ff7e6212d857157bee83088f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50944
AND Item_ID = 20)
WHERE Reciept_Id=50944
AND Item_ID = 20
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 25a718d0812055c3ff7e6212d857157bee83088f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50944
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50944
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6dd4485cfdb548d14d7b1b0c69923fc12bea494b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50951
AND Item_ID = 28)
WHERE Reciept_Id=50951
AND Item_ID = 28
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6dd4485cfdb548d14d7b1b0c69923fc12bea494b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50951
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50951
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 77564bbcda78c0774b1c0bbf614c2e890a2825d5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52197
AND Item_ID = 2)
WHERE Reciept_Id=52197
AND Item_ID = 2
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 77564bbcda78c0774b1c0bbf614c2e890a2825d5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52197
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52197
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f42cf13c1153dc0b7e0b7a848ded6dccfa1e3040
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=52197
AND Item_ID = 30
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f42cf13c1153dc0b7e0b7a848ded6dccfa1e3040
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52197
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52197
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 081ae262af00bbf28c6198cd4030d08953c48889
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51954
AND Item_ID = 1)
WHERE Reciept_Id=51954
AND Item_ID = 1
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 081ae262af00bbf28c6198cd4030d08953c48889
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51954
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51954
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d709daaa67e31b9dff3f7e84fe1398469f73dd59
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52322
AND Item_ID = 20)
WHERE Reciept_Id=52322
AND Item_ID = 20
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d709daaa67e31b9dff3f7e84fe1398469f73dd59
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52322
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52322
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dc61185b9e503f926a4c31292dae195af7083be2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52322
AND Item_ID = 12)
WHERE Reciept_Id=52322
AND Item_ID = 12
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dc61185b9e503f926a4c31292dae195af7083be2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52322
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52322
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64550b34235422ddc2256885cd3bf3579870417d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52481
AND Item_ID = 24)
WHERE Reciept_Id=52481
AND Item_ID = 24
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64550b34235422ddc2256885cd3bf3579870417d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52481
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52481
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7ebc55b2d3761c3095618ecec41e010ca99d6fbc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50149
AND Item_ID = 18)
WHERE Reciept_Id=50149
AND Item_ID = 18
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7ebc55b2d3761c3095618ecec41e010ca99d6fbc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50149
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50149
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c1a91f17fa01ba4a56b58c7bb8520d4b32bcee73
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50237
AND Item_ID = 10)
WHERE Reciept_Id=50237
AND Item_ID = 10
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c1a91f17fa01ba4a56b58c7bb8520d4b32bcee73
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50237
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50237
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 48604c297b32048bb7b5b9831f7cff34188d1c9c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50325
AND Item_ID = 17)
WHERE Reciept_Id=50325
AND Item_ID = 17
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 48604c297b32048bb7b5b9831f7cff34188d1c9c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50325
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50325
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bebd66694744605f4e38c81b45b175a7b05ff789
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50325
AND Item_ID = 13)
WHERE Reciept_Id=50325
AND Item_ID = 13
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bebd66694744605f4e38c81b45b175a7b05ff789
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50325
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50325
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75170c200cfbc3c234aea2692e72d53976472994
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51983
AND Item_ID = 22)
WHERE Reciept_Id=51983
AND Item_ID = 22
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75170c200cfbc3c234aea2692e72d53976472994
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51983
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51983
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f302224073cf3ce3a78a0e30a82d319e41103036
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52212
AND Item_ID = 22)
WHERE Reciept_Id=52212
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f302224073cf3ce3a78a0e30a82d319e41103036
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52212
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52212
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64bcd281f0ccc66a1c084b76010f1a9a49b0ddcf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50871
AND Item_ID = 9)
WHERE Reciept_Id=50871
AND Item_ID = 9
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64bcd281f0ccc66a1c084b76010f1a9a49b0ddcf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50871
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50871
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68ed8ec2be75d819fbe91173bfdfb43b88c05bf1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51157
AND Item_ID = 17)
WHERE Reciept_Id=51157
AND Item_ID = 17
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 68ed8ec2be75d819fbe91173bfdfb43b88c05bf1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51157
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51157
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0f7d2f10a44e47b7f429e3b6c87dc03c955ba4d5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51157
AND Item_ID = 27)
WHERE Reciept_Id=51157
AND Item_ID = 27
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0f7d2f10a44e47b7f429e3b6c87dc03c955ba4d5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51157
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51157
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16465928caab7787ceb8e4453cd3f76e6b516fdb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51157
AND Item_ID = 29)
WHERE Reciept_Id=51157
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16465928caab7787ceb8e4453cd3f76e6b516fdb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51157
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51157
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 39ab3a48955a5f30d0eea5b922b636ac1083ee9e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50005
AND Item_ID = 1)
WHERE Reciept_Id=50005
AND Item_ID = 1
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 39ab3a48955a5f30d0eea5b922b636ac1083ee9e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50005
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50005
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8c4ed940d39665782822eda1ea6ae21002fbea50
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50692
AND Item_ID = 2)
WHERE Reciept_Id=50692
AND Item_ID = 2
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8c4ed940d39665782822eda1ea6ae21002fbea50
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50692
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50692
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4718c0232db3c4252f92cae5df9d947afeb89071
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52365
AND Item_ID = 21)
WHERE Reciept_Id=52365
AND Item_ID = 21
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4718c0232db3c4252f92cae5df9d947afeb89071
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52365
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52365
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 575f0aea03392396e0272f49e9b3cd625b82c280
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51467
AND Item_ID = 24)
WHERE Reciept_Id=51467
AND Item_ID = 24
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 575f0aea03392396e0272f49e9b3cd625b82c280
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51467
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51467
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a8d8b0d94304defdebcf93eceb61c621a4547069
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52343
AND Item_ID = 30)
WHERE Reciept_Id=52343
AND Item_ID = 30
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a8d8b0d94304defdebcf93eceb61c621a4547069
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52343
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52343
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 67186567ce6e789472cb003046d71db3a7891bc2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50155
AND Item_ID = 9)
WHERE Reciept_Id=50155
AND Item_ID = 9
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 67186567ce6e789472cb003046d71db3a7891bc2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50155
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50155
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dfea09d90cc690a26bda9811f358d599ff114094
UPDATE Assignment1Data 
SET [Item_Quantity]=18
WHERE Reciept_Id=50831
AND Item_ID = 8
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dfea09d90cc690a26bda9811f358d599ff114094
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50831
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50831
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6aa585c9da39cc49813c16be7b5568aea08ef790
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50831
AND Item_ID = 26)
WHERE Reciept_Id=50831
AND Item_ID = 26
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6aa585c9da39cc49813c16be7b5568aea08ef790
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50831
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50831
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98b9935a4abb79bd76ee5a48345c55d8f1b9c3f9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51892
AND Item_ID = 12)
WHERE Reciept_Id=51892
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98b9935a4abb79bd76ee5a48345c55d8f1b9c3f9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51892
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51892
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22d241d890810ce1467faa40527abf52b6e74006
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50065
AND Item_ID = 28)
WHERE Reciept_Id=50065
AND Item_ID = 28
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22d241d890810ce1467faa40527abf52b6e74006
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50065
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50065
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 32e2ed89e5a28bad0ef01d6b27c6643c25dcfee6
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=52452
AND Item_ID = 4
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 32e2ed89e5a28bad0ef01d6b27c6643c25dcfee6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52452
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52452
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66a640e035575baef8e9eb28e40f73cb2e0fb575
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50424
AND Item_ID = 8)
WHERE Reciept_Id=50424
AND Item_ID = 8
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66a640e035575baef8e9eb28e40f73cb2e0fb575
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50424
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50424
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c6cf8654645313ae1f900beb3dc89b5c1b2f6df
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50192
AND Item_ID = 2)
WHERE Reciept_Id=50192
AND Item_ID = 2
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c6cf8654645313ae1f900beb3dc89b5c1b2f6df
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50192
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50192
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 033faf1e7c43e56202b8c099466bfbaf35157eb7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50423
AND Item_ID = 8)
WHERE Reciept_Id=50423
AND Item_ID = 8
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 033faf1e7c43e56202b8c099466bfbaf35157eb7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50423
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50423
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f1949a34d122d1bd6b06bba169340f0d74186054
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50003
AND Item_ID = 1)
WHERE Reciept_Id=50003
AND Item_ID = 1
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f1949a34d122d1bd6b06bba169340f0d74186054
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50003
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50003
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d950c61c4bd4be40a246148568c33f82b23ba878
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50050
AND Item_ID = 9)
WHERE Reciept_Id=50050
AND Item_ID = 9
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d950c61c4bd4be40a246148568c33f82b23ba878
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50050
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50050
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f8837ddadd1ba7531e8e413bf8947677f042a467
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50050
AND Item_ID = 15)
WHERE Reciept_Id=50050
AND Item_ID = 15
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f8837ddadd1ba7531e8e413bf8947677f042a467
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50050
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50050
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3ae562604bf25c849e11dd3d46a8a3283fdc80dc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50221
AND Item_ID = 23)
WHERE Reciept_Id=50221
AND Item_ID = 23
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3ae562604bf25c849e11dd3d46a8a3283fdc80dc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50221
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50221
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24b6c1fe2bb0fb9e35f73b674824eaf6e3fadea3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50221
AND Item_ID = 13)
WHERE Reciept_Id=50221
AND Item_ID = 13
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24b6c1fe2bb0fb9e35f73b674824eaf6e3fadea3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50221
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50221
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e622863b2c040d1f85860c35b288433834268f25
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50930
AND Item_ID = 26)
WHERE Reciept_Id=50930
AND Item_ID = 26
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e622863b2c040d1f85860c35b288433834268f25
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50930
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50930
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1ffbc308ee92552808bb2ae32871cbabf9a18ed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50930
AND Item_ID = 17)
WHERE Reciept_Id=50930
AND Item_ID = 17
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a1ffbc308ee92552808bb2ae32871cbabf9a18ed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50930
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50930
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a4e0dae2340b49322e8a1fb9f699e11623176b01
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52301
AND Item_ID = 29)
WHERE Reciept_Id=52301
AND Item_ID = 29
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a4e0dae2340b49322e8a1fb9f699e11623176b01
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52301
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52301
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 976247fc19f13cd7f5654a0bc5833ea6a1b76c99
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52301
AND Item_ID = 27)
WHERE Reciept_Id=52301
AND Item_ID = 27
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 976247fc19f13cd7f5654a0bc5833ea6a1b76c99
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52301
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52301
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a008889b4df802c20f779007aec8eaf3f2d08dc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50952
AND Item_ID = 26)
WHERE Reciept_Id=50952
AND Item_ID = 26
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a008889b4df802c20f779007aec8eaf3f2d08dc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50952
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50952
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b5eaa07dcf6aa1023c65eda830a4e8cfe8f52a5c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50952
AND Item_ID = 24)
WHERE Reciept_Id=50952
AND Item_ID = 24
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b5eaa07dcf6aa1023c65eda830a4e8cfe8f52a5c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50952
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50952
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2b90773c5c9b032cfadfab1899870f53776b0449
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51875
AND Item_ID = 16)
WHERE Reciept_Id=51875
AND Item_ID = 16
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2b90773c5c9b032cfadfab1899870f53776b0449
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51875
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51875
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f74054905ba55fb9c46ba76e80c1ad412eeced6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51875
AND Item_ID = 10)
WHERE Reciept_Id=51875
AND Item_ID = 10
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f74054905ba55fb9c46ba76e80c1ad412eeced6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51875
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51875
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a20cc99bf108dc7609cf3f1791f76c944fed506f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50309
AND Item_ID = 20)
WHERE Reciept_Id=50309
AND Item_ID = 20
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a20cc99bf108dc7609cf3f1791f76c944fed506f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50309
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50309
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0f7aedc62c26df0f915b6822d5b02f019a0163f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51482
AND Item_ID = 8)
WHERE Reciept_Id=51482
AND Item_ID = 8
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0f7aedc62c26df0f915b6822d5b02f019a0163f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51482
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51482
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3b1a13c83262fa9b7bf8623191bf5e25d6036962
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=51482
AND Item_ID = 5
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3b1a13c83262fa9b7bf8623191bf5e25d6036962
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51482
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51482
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ef537f0b3b8a1e2708901dbfae9a09c09ad4d47
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51531
AND Item_ID = 24)
WHERE Reciept_Id=51531
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ef537f0b3b8a1e2708901dbfae9a09c09ad4d47
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51531
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51531
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 94b0d14d93cdd9d1cb9ba9720171208a6a3a2bc9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51547
AND Item_ID = 20)
WHERE Reciept_Id=51547
AND Item_ID = 20
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 94b0d14d93cdd9d1cb9ba9720171208a6a3a2bc9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51547
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51547
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 77b67e8da90582f9ce493aa5f48b51527876d44e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51783
AND Item_ID = 11)
WHERE Reciept_Id=51783
AND Item_ID = 11
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 77b67e8da90582f9ce493aa5f48b51527876d44e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51783
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51783
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8bbb3048be8ebc0922840c347047bd4080b70d3f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50336
AND Item_ID = 29)
WHERE Reciept_Id=50336
AND Item_ID = 29
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8bbb3048be8ebc0922840c347047bd4080b70d3f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50336
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50336
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cf1ec5d5cbc216b8e7f3c82c4abd6c60842a721
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50336
AND Item_ID = 25)
WHERE Reciept_Id=50336
AND Item_ID = 25
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cf1ec5d5cbc216b8e7f3c82c4abd6c60842a721
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50336
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50336
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d84cafedf701a91e7246b1ce2058e678d89e1d2b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52253
AND Item_ID = 28)
WHERE Reciept_Id=52253
AND Item_ID = 28
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d84cafedf701a91e7246b1ce2058e678d89e1d2b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52253
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52253
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2d920bc97ab1c8a2d44fb4c20179243dab296f3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50422
AND Item_ID = 14)
WHERE Reciept_Id=50422
AND Item_ID = 14
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2d920bc97ab1c8a2d44fb4c20179243dab296f3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50422
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50422
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40da3e03d552f4a2bd168c8cee6466eef33593a8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50998
AND Item_ID = 19)
WHERE Reciept_Id=50998
AND Item_ID = 19
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40da3e03d552f4a2bd168c8cee6466eef33593a8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50998
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50998
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18911ba09cefd68da3ffbf46930e0e461f58a95b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50998
AND Item_ID = 7)
WHERE Reciept_Id=50998
AND Item_ID = 7
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18911ba09cefd68da3ffbf46930e0e461f58a95b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50998
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50998
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a8d49eb17b3ed6a2e55510e35625f7c5770ab2d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52470
AND Item_ID = 18)
WHERE Reciept_Id=52470
AND Item_ID = 18
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a8d49eb17b3ed6a2e55510e35625f7c5770ab2d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52470
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52470
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 988c7619cb50229fcc54dff35e5d813c7c0e7752
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50601
AND Item_ID = 5)
WHERE Reciept_Id=50601
AND Item_ID = 5
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 988c7619cb50229fcc54dff35e5d813c7c0e7752
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50601
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50601
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e94526810cc18e13e9f1d493e651fd3e8a844a02
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=51017
AND Item_ID = 21
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e94526810cc18e13e9f1d493e651fd3e8a844a02
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51017
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51017
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40d34cf28b7cd75e7b0691a0d104c8f81c0cb9fa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51263
AND Item_ID = 6)
WHERE Reciept_Id=51263
AND Item_ID = 6
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40d34cf28b7cd75e7b0691a0d104c8f81c0cb9fa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51263
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51263
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96af159aabd291887b1ec620e4d0c5eb4d0973d5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50269
AND Item_ID = 25)
WHERE Reciept_Id=50269
AND Item_ID = 25
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 96af159aabd291887b1ec620e4d0c5eb4d0973d5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50269
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50269
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1020573f88aa637aeed83865b7728fbe0168dab3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50360
AND Item_ID = 11)
WHERE Reciept_Id=50360
AND Item_ID = 11
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1020573f88aa637aeed83865b7728fbe0168dab3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50360
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50360
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4066b0a7471115f2a57129e5ccf8b1a23ae3c3cd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52048
AND Item_ID = 12)
WHERE Reciept_Id=52048
AND Item_ID = 12
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4066b0a7471115f2a57129e5ccf8b1a23ae3c3cd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52048
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52048
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bc0054595534906955bf325dccff3edbe5c4cd52
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50821
AND Item_ID = 27)
WHERE Reciept_Id=50821
AND Item_ID = 27
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bc0054595534906955bf325dccff3edbe5c4cd52
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50821
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50821
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d37c29e999462edf9dd53844b3d4000e15e5d668
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51375
AND Item_ID = 2)
WHERE Reciept_Id=51375
AND Item_ID = 2
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d37c29e999462edf9dd53844b3d4000e15e5d668
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51375
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51375
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9e5619ea52184c0fdd4aa8d577e894ad4940edbf
UPDATE Assignment1Data 
SET [Item_Quantity]=6
WHERE Reciept_Id=52156
AND Item_ID = 17
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9e5619ea52184c0fdd4aa8d577e894ad4940edbf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52156
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52156
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 165fc538fc6e817bbc5b89595a32c6afab81d68c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52280
AND Item_ID = 15)
WHERE Reciept_Id=52280
AND Item_ID = 15
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 165fc538fc6e817bbc5b89595a32c6afab81d68c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52280
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52280
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7b2e2820378f7cfb5712e34dd5d069b0a99d7cbe
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=52280
AND Item_ID = 8
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7b2e2820378f7cfb5712e34dd5d069b0a99d7cbe
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52280
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52280
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6fcaa52e823f168eb4646f78a636006cfa21adb4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51425
AND Item_ID = 25)
WHERE Reciept_Id=51425
AND Item_ID = 25
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6fcaa52e823f168eb4646f78a636006cfa21adb4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51425
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51425
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a2c364cbb0fadb2371290537960686502a20227f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51630
AND Item_ID = 8)
WHERE Reciept_Id=51630
AND Item_ID = 8
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a2c364cbb0fadb2371290537960686502a20227f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51630
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51630
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b0b128afc30241b5a9db618fde116e91272bdeda
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51903
AND Item_ID = 12)
WHERE Reciept_Id=51903
AND Item_ID = 12
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b0b128afc30241b5a9db618fde116e91272bdeda
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51903
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51903
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ce371e71c170109bca08f2a9fc1678b4cc47dbf3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51903
AND Item_ID = 5)
WHERE Reciept_Id=51903
AND Item_ID = 5
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ce371e71c170109bca08f2a9fc1678b4cc47dbf3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51903
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51903
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a2561d6f09ea8834d5bf554a39a47226cb12eb21
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50495
AND Item_ID = 19)
WHERE Reciept_Id=50495
AND Item_ID = 19
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a2561d6f09ea8834d5bf554a39a47226cb12eb21
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50495
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50495
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cc0ca92b06df46812f02259a483bcc76e143844b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51953
AND Item_ID = 9)
WHERE Reciept_Id=51953
AND Item_ID = 9
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cc0ca92b06df46812f02259a483bcc76e143844b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51953
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51953
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5b0d018e1182d941ddcb212ff8afebfa31e4ebf6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51999
AND Item_ID = 27)
WHERE Reciept_Id=51999
AND Item_ID = 27
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5b0d018e1182d941ddcb212ff8afebfa31e4ebf6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51999
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51999
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8752c95ae204058bac402c6fd4ee898c532553df
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51999
AND Item_ID = 19)
WHERE Reciept_Id=51999
AND Item_ID = 19
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8752c95ae204058bac402c6fd4ee898c532553df
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51999
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51999
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f85443b2a3eed556f059b8f95c1686173823434d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50687
AND Item_ID = 14)
WHERE Reciept_Id=50687
AND Item_ID = 14
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f85443b2a3eed556f059b8f95c1686173823434d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50687
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50687
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ed4626c1b3fa43557fcb033ede1b9205758a73f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50687
AND Item_ID = 3)
WHERE Reciept_Id=50687
AND Item_ID = 3
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ed4626c1b3fa43557fcb033ede1b9205758a73f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50687
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50687
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c2b753a3256338cfd4417e10cbcfe46939d02b10
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50768
AND Item_ID = 18)
WHERE Reciept_Id=50768
AND Item_ID = 18
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c2b753a3256338cfd4417e10cbcfe46939d02b10
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50768
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50768
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 009d9b6d0f1b6778ee556b2b3a1fb7167916be03
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51340
AND Item_ID = 11)
WHERE Reciept_Id=51340
AND Item_ID = 11
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 009d9b6d0f1b6778ee556b2b3a1fb7167916be03
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51340
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51340
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f5ef474a432bb91b2e13a10765527ccac897a5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51766
AND Item_ID = 30)
WHERE Reciept_Id=51766
AND Item_ID = 30
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f5ef474a432bb91b2e13a10765527ccac897a5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51766
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51766
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 914d1ed3f809e419c2790004eca4faf13188f397
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52211
AND Item_ID = 26)
WHERE Reciept_Id=52211
AND Item_ID = 26
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 914d1ed3f809e419c2790004eca4faf13188f397
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52211
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52211
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9d563d2b65954c01e0f1b015643eb68fe9356798
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52433
AND Item_ID = 6)
WHERE Reciept_Id=52433
AND Item_ID = 6
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9d563d2b65954c01e0f1b015643eb68fe9356798
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52433
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52433
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e5e073fbe2c7dd44828cd718aa9b3e6587609088
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52482
AND Item_ID = 2)
WHERE Reciept_Id=52482
AND Item_ID = 2
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e5e073fbe2c7dd44828cd718aa9b3e6587609088
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52482
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52482
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae959fe6e55f88f7d774cdbd6c976fb3ddbc6bd4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52482
AND Item_ID = 20)
WHERE Reciept_Id=52482
AND Item_ID = 20
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae959fe6e55f88f7d774cdbd6c976fb3ddbc6bd4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52482
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52482
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 45cb4896c19e4e5a772d9c1874cd36b9fdd8829a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50023
AND Item_ID = 14)
WHERE Reciept_Id=50023
AND Item_ID = 14
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 45cb4896c19e4e5a772d9c1874cd36b9fdd8829a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50023
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50023
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9e74fc9138f0a6c99f1b516f5a66831dc355d281
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50122
AND Item_ID = 24)
WHERE Reciept_Id=50122
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9e74fc9138f0a6c99f1b516f5a66831dc355d281
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50122
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50122
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ce2b55f5d0b3127e3515e8afe648b0fa2e56713c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51673
AND Item_ID = 3)
WHERE Reciept_Id=51673
AND Item_ID = 3
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ce2b55f5d0b3127e3515e8afe648b0fa2e56713c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51673
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51673
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec274558384192e295586c9c639ffbec2eb2ef3c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51673
AND Item_ID = 23)
WHERE Reciept_Id=51673
AND Item_ID = 23
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec274558384192e295586c9c639ffbec2eb2ef3c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51673
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51673
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cc893fa862fbb13ca13524efcdbd59203a5cdf5c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52239
AND Item_ID = 14)
WHERE Reciept_Id=52239
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cc893fa862fbb13ca13524efcdbd59203a5cdf5c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52239
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52239
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6ee1ac907d1d24ac904bd000bf6e2fc146138e70
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50967
AND Item_ID = 15)
WHERE Reciept_Id=50967
AND Item_ID = 15
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6ee1ac907d1d24ac904bd000bf6e2fc146138e70
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50967
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50967
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b97cb63d018043d86e2dd10004838365f0ddece4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52464
AND Item_ID = 12)
WHERE Reciept_Id=52464
AND Item_ID = 12
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b97cb63d018043d86e2dd10004838365f0ddece4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52464
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52464
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ca8f060fa0306aeac7ef98e40b5d237e7c8883e7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50722
AND Item_ID = 28)
WHERE Reciept_Id=50722
AND Item_ID = 28
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ca8f060fa0306aeac7ef98e40b5d237e7c8883e7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50722
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50722
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f824946d4d80f4d5c14decf2ed1457b43461a06c
UPDATE Assignment1Data 
SET [Item_Quantity]=12
WHERE Reciept_Id=51043
AND Item_ID = 11
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f824946d4d80f4d5c14decf2ed1457b43461a06c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51043
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51043
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15e6a9c3e9241afefbe77734c9fb2eaff6caf593
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51043
AND Item_ID = 14)
WHERE Reciept_Id=51043
AND Item_ID = 14
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 15e6a9c3e9241afefbe77734c9fb2eaff6caf593
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51043
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51043
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dc30b63280ce68c5f41292853d3269eb5c5e2d21
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51134
AND Item_ID = 23)
WHERE Reciept_Id=51134
AND Item_ID = 23
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dc30b63280ce68c5f41292853d3269eb5c5e2d21
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51134
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51134
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db79cff1cfc080da2e0cf62b0a1aaad753ac1c91
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51134
AND Item_ID = 1)
WHERE Reciept_Id=51134
AND Item_ID = 1
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db79cff1cfc080da2e0cf62b0a1aaad753ac1c91
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51134
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51134
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0cf9db2dc34f3658ce77f9518e214e9e9e14227e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51134
AND Item_ID = 7)
WHERE Reciept_Id=51134
AND Item_ID = 7
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0cf9db2dc34f3658ce77f9518e214e9e9e14227e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51134
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51134
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c76fb484f8d9dd07972352569977ffa513aad43c
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=51516
AND Item_ID = 15
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c76fb484f8d9dd07972352569977ffa513aad43c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51516
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51516
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f94be413293c9225f3906c5a0f88a5c1130b93e1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51516
AND Item_ID = 1)
WHERE Reciept_Id=51516
AND Item_ID = 1
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f94be413293c9225f3906c5a0f88a5c1130b93e1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51516
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51516
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a0f8b22dc3c19ed20b65e57cc2a0ba031caca30
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51856
AND Item_ID = 4)
WHERE Reciept_Id=51856
AND Item_ID = 4
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a0f8b22dc3c19ed20b65e57cc2a0ba031caca30
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51856
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51856
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8deadacccd97bf6abb66962e0fda9d656c4baf45
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51856
AND Item_ID = 15)
WHERE Reciept_Id=51856
AND Item_ID = 15
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8deadacccd97bf6abb66962e0fda9d656c4baf45
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51856
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51856
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a91496234d0a900f16331cb3e71153f288f90101
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51264
AND Item_ID = 17)
WHERE Reciept_Id=51264
AND Item_ID = 17
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a91496234d0a900f16331cb3e71153f288f90101
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51264
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51264
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d14cceef5b9011d8be1165f80dee0d31cce13d9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51465
AND Item_ID = 25)
WHERE Reciept_Id=51465
AND Item_ID = 25
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d14cceef5b9011d8be1165f80dee0d31cce13d9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51465
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51465
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ba6a2d142ccb386b58464905771005f8b5e0fa9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52185
AND Item_ID = 24)
WHERE Reciept_Id=52185
AND Item_ID = 24
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ba6a2d142ccb386b58464905771005f8b5e0fa9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52185
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52185
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87ee8cf721c76d5ec286dfc3c09380ad261c8176
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=52185
AND Item_ID = 19
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87ee8cf721c76d5ec286dfc3c09380ad261c8176
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52185
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52185
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 758c6d1f5c579e77414bda6b97cd6ba7cb522634
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50355
AND Item_ID = 17)
WHERE Reciept_Id=50355
AND Item_ID = 17
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 758c6d1f5c579e77414bda6b97cd6ba7cb522634
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50355
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50355
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a5635f2955bc8ec99493b5eaaa852dd387e8a46
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50579
AND Item_ID = 20)
WHERE Reciept_Id=50579
AND Item_ID = 20
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1a5635f2955bc8ec99493b5eaaa852dd387e8a46
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50579
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50579
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 60b83bba32b9522ef71ff0152e9d26b22fcd75f6
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=51946
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 60b83bba32b9522ef71ff0152e9d26b22fcd75f6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51946
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51946
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d1538bc1de32d05dc43d5880fcc21a19d5e860d6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51946
AND Item_ID = 8)
WHERE Reciept_Id=51946
AND Item_ID = 8
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d1538bc1de32d05dc43d5880fcc21a19d5e860d6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51946
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51946
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad46f386c9af0919b351efb38b69dd080be65def
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52416
AND Item_ID = 7)
WHERE Reciept_Id=52416
AND Item_ID = 7
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad46f386c9af0919b351efb38b69dd080be65def
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52416
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52416
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 26eaa6e00e022b13330a9378085bbaaacecc9875
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52416
AND Item_ID = 1)
WHERE Reciept_Id=52416
AND Item_ID = 1
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 26eaa6e00e022b13330a9378085bbaaacecc9875
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52416
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52416
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 239c5d8dc3e3e174ab3c2a210282be3f051b5241
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50433
AND Item_ID = 27)
WHERE Reciept_Id=50433
AND Item_ID = 27
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 239c5d8dc3e3e174ab3c2a210282be3f051b5241
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50433
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50433
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1c6c443c6a2253d811f31be59d6b3a142cd6ff55
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50613
AND Item_ID = 9)
WHERE Reciept_Id=50613
AND Item_ID = 9
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1c6c443c6a2253d811f31be59d6b3a142cd6ff55
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50613
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50613
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ff5eda02582455446589d8f2874a10bdce0391dc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51474
AND Item_ID = 10)
WHERE Reciept_Id=51474
AND Item_ID = 10
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ff5eda02582455446589d8f2874a10bdce0391dc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51474
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51474
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d9419b9ca486261144c1c904747adba7174e615
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52441
AND Item_ID = 6)
WHERE Reciept_Id=52441
AND Item_ID = 6
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d9419b9ca486261144c1c904747adba7174e615
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52441
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52441
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a3abc4d2bf7442e3884cdf92fe296317a8830633
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52441
AND Item_ID = 1)
WHERE Reciept_Id=52441
AND Item_ID = 1
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a3abc4d2bf7442e3884cdf92fe296317a8830633
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52441
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52441
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 17af8329f7baff73bda30bd5bcbacb26c9636442
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=51027
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 17af8329f7baff73bda30bd5bcbacb26c9636442
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51027
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51027
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f5705a8dfc74c8622b3c83b8b011c48cb5c6ab96
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50536
AND Item_ID = 15)
WHERE Reciept_Id=50536
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f5705a8dfc74c8622b3c83b8b011c48cb5c6ab96
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50536
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50536
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87b82e45d538aa3754aacfae3e8d5e4ec4c9b52b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50536
AND Item_ID = 10)
WHERE Reciept_Id=50536
AND Item_ID = 10
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87b82e45d538aa3754aacfae3e8d5e4ec4c9b52b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50536
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50536
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fdf8592d2f58d5bbe77dfebbebb82a9ba5278663
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50536
AND Item_ID = 6)
WHERE Reciept_Id=50536
AND Item_ID = 6
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fdf8592d2f58d5bbe77dfebbebb82a9ba5278663
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50536
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50536
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bee67a03e6c7c11d0124c2b7ec5d1b8e72d88d30
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50870
AND Item_ID = 23)
WHERE Reciept_Id=50870
AND Item_ID = 23
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bee67a03e6c7c11d0124c2b7ec5d1b8e72d88d30
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50870
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50870
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86fafeaea1a7fcbb518c7620fa967bbf17b57925
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50215
AND Item_ID = 30)
WHERE Reciept_Id=50215
AND Item_ID = 30
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86fafeaea1a7fcbb518c7620fa967bbf17b57925
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50215
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50215
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 230234cb204f55560b3f81d7b1b72b96f9874205
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50720
AND Item_ID = 12)
WHERE Reciept_Id=50720
AND Item_ID = 12
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 230234cb204f55560b3f81d7b1b72b96f9874205
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50720
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50720
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3d58465ded9c533e2129182d4eeabdecc5d52456
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50577
AND Item_ID = 17)
WHERE Reciept_Id=50577
AND Item_ID = 17
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3d58465ded9c533e2129182d4eeabdecc5d52456
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50577
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50577
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d16c7c05c064cdb7a57569be07e7060c86900694
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50577
AND Item_ID = 22)
WHERE Reciept_Id=50577
AND Item_ID = 22
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d16c7c05c064cdb7a57569be07e7060c86900694
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50577
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50577
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49c3a4ad5f703a5cd8568217443b83fd441f7d82
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51200
AND Item_ID = 17)
WHERE Reciept_Id=51200
AND Item_ID = 17
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 49c3a4ad5f703a5cd8568217443b83fd441f7d82
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51200
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51200
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 29d95b77943877296a6ca56acdb7a59cfd1c4885
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51977
AND Item_ID = 13)
WHERE Reciept_Id=51977
AND Item_ID = 13
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 29d95b77943877296a6ca56acdb7a59cfd1c4885
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51977
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51977
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 662d303981598c14e4ff1a8d900dcfa9461f6aa6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50080
AND Item_ID = 5)
WHERE Reciept_Id=50080
AND Item_ID = 5
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 662d303981598c14e4ff1a8d900dcfa9461f6aa6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50080
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50080
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92fce0ef343696c780302621ea6955adb0eb4705
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51066
AND Item_ID = 29)
WHERE Reciept_Id=51066
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92fce0ef343696c780302621ea6955adb0eb4705
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51066
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51066
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06cdf3af0a16c199b7abcb5c8ec3b93c802bb200
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51269
AND Item_ID = 19)
WHERE Reciept_Id=51269
AND Item_ID = 19
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06cdf3af0a16c199b7abcb5c8ec3b93c802bb200
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51269
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51269
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9221ee297b95da40d1964c8c0541863cbc2de028
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51269
AND Item_ID = 3)
WHERE Reciept_Id=51269
AND Item_ID = 3
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9221ee297b95da40d1964c8c0541863cbc2de028
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51269
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51269
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: df0c2b08ad2e3fbad32fca21d6b5a76095f1d331
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50434
AND Item_ID = 26)
WHERE Reciept_Id=50434
AND Item_ID = 26
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: df0c2b08ad2e3fbad32fca21d6b5a76095f1d331
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50434
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50434
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: af1a1e1221fa47a5728c88d4d163dca24c482e0c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50434
AND Item_ID = 22)
WHERE Reciept_Id=50434
AND Item_ID = 22
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: af1a1e1221fa47a5728c88d4d163dca24c482e0c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50434
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50434
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 21018197ccda92ce2f63768624909e0c971c4b6d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50434
AND Item_ID = 15)
WHERE Reciept_Id=50434
AND Item_ID = 15
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 21018197ccda92ce2f63768624909e0c971c4b6d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50434
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50434
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2d3a8f54d6032aa8d9c094b6976d61161ce9187
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51902
AND Item_ID = 17)
WHERE Reciept_Id=51902
AND Item_ID = 17
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2d3a8f54d6032aa8d9c094b6976d61161ce9187
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51902
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51902
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5bb1dfbc9e5ee479bf54bf682594151678be4a8a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50362
AND Item_ID = 3)
WHERE Reciept_Id=50362
AND Item_ID = 3
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5bb1dfbc9e5ee479bf54bf682594151678be4a8a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50362
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50362
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 30305c75c778faa0f6e0165b0655b559743770c3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50484
AND Item_ID = 1)
WHERE Reciept_Id=50484
AND Item_ID = 1
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 30305c75c778faa0f6e0165b0655b559743770c3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50484
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50484
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28e7f6f104802cdef9153035a7921eaee6b00ea7
UPDATE Assignment1Data 
SET [Item_Quantity]=6
WHERE Reciept_Id=51376
AND Item_ID = 4
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28e7f6f104802cdef9153035a7921eaee6b00ea7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51376
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51376
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a03c4d59b44f51d370fa0db2ad89e17aed7c1126
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52500
AND Item_ID = 21)
WHERE Reciept_Id=52500
AND Item_ID = 21
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a03c4d59b44f51d370fa0db2ad89e17aed7c1126
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52500
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52500
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8162bf57a448afc96df02d170c71968437443c9f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52500
AND Item_ID = 28)
WHERE Reciept_Id=52500
AND Item_ID = 28
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8162bf57a448afc96df02d170c71968437443c9f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52500
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52500
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 32508ac0b5fc524ceccf02bd39f2cb08b79a8095
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50226
AND Item_ID = 21)
WHERE Reciept_Id=50226
AND Item_ID = 21
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 32508ac0b5fc524ceccf02bd39f2cb08b79a8095
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50226
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50226
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: efedc64e39d3f355c9a644af2bcad110fe3f16a6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50278
AND Item_ID = 8)
WHERE Reciept_Id=50278
AND Item_ID = 8
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: efedc64e39d3f355c9a644af2bcad110fe3f16a6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50278
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50278
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 42b6771b3bd9312d0ed9eac285a24eb00159b933
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52175
AND Item_ID = 10)
WHERE Reciept_Id=52175
AND Item_ID = 10
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 42b6771b3bd9312d0ed9eac285a24eb00159b933
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52175
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52175
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2dc771977f639941e91672eb3fa59c82284b7796
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51747
AND Item_ID = 30)
WHERE Reciept_Id=51747
AND Item_ID = 30
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2dc771977f639941e91672eb3fa59c82284b7796
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51747
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51747
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4082c6113cede1addc20a81fa46357823366cf52
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52327
AND Item_ID = 25)
WHERE Reciept_Id=52327
AND Item_ID = 25
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4082c6113cede1addc20a81fa46357823366cf52
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52327
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52327
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9963693ce675a454622bad93ba15260b2aed6d67
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51502
AND Item_ID = 12)
WHERE Reciept_Id=51502
AND Item_ID = 12
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9963693ce675a454622bad93ba15260b2aed6d67
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51502
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51502
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59e003aa2c09e937dfe90183ff5164df7397f513
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51646
AND Item_ID = 27)
WHERE Reciept_Id=51646
AND Item_ID = 27
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59e003aa2c09e937dfe90183ff5164df7397f513
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51646
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51646
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3f823d7247220482826af1b077a04a66a2f9fc7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52060
AND Item_ID = 18)
WHERE Reciept_Id=52060
AND Item_ID = 18
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3f823d7247220482826af1b077a04a66a2f9fc7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52060
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52060
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a7eba11cd3d0ca727e5245cf47331408fd067266
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52105
AND Item_ID = 10)
WHERE Reciept_Id=52105
AND Item_ID = 10
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a7eba11cd3d0ca727e5245cf47331408fd067266
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52105
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52105
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8df18cd6ff46e1adca4fb7829189f38af68cc1a3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52200
AND Item_ID = 25)
WHERE Reciept_Id=52200
AND Item_ID = 25
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8df18cd6ff46e1adca4fb7829189f38af68cc1a3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52200
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52200
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ed2b380ceb29c0f36d5a9a2e353f983fcc5226c2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52298
AND Item_ID = 28)
WHERE Reciept_Id=52298
AND Item_ID = 28
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ed2b380ceb29c0f36d5a9a2e353f983fcc5226c2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52298
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52298
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c1705b79998e9ce2e6a9e17a9eb8d67df190ea75
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52380
AND Item_ID = 1)
WHERE Reciept_Id=52380
AND Item_ID = 1
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c1705b79998e9ce2e6a9e17a9eb8d67df190ea75
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52380
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52380
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e2b2c59e4176566b1251ed465edd767f7143f3dd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50090
AND Item_ID = 25)
WHERE Reciept_Id=50090
AND Item_ID = 25
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e2b2c59e4176566b1251ed465edd767f7143f3dd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50090
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50090
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c03d34b59e5b32f63ec0085e0224d3200f808314
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50763
AND Item_ID = 29)
WHERE Reciept_Id=50763
AND Item_ID = 29
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c03d34b59e5b32f63ec0085e0224d3200f808314
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50763
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50763
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 436dc4724c9ef398f3d5a36bed9e6610828f1415
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50763
AND Item_ID = 11)
WHERE Reciept_Id=50763
AND Item_ID = 11
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 436dc4724c9ef398f3d5a36bed9e6610828f1415
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50763
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50763
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b418ca58629516ee156a11585cd58fd1cfb03e68
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50763
AND Item_ID = 9)
WHERE Reciept_Id=50763
AND Item_ID = 9
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b418ca58629516ee156a11585cd58fd1cfb03e68
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50763
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50763
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad22765367979b498dbf62daad5b5afe44ec1ae9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51914
AND Item_ID = 1)
WHERE Reciept_Id=51914
AND Item_ID = 1
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad22765367979b498dbf62daad5b5afe44ec1ae9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51914
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51914
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1df1f4bf727d2d9f51588e4e6ea76efd6c84ddbf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50429
AND Item_ID = 24)
WHERE Reciept_Id=50429
AND Item_ID = 24
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1df1f4bf727d2d9f51588e4e6ea76efd6c84ddbf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50429
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50429
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bbf40764a00e2f4ab595e21866b04fc7c6f4e904
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50429
AND Item_ID = 14)
WHERE Reciept_Id=50429
AND Item_ID = 14
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bbf40764a00e2f4ab595e21866b04fc7c6f4e904
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50429
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50429
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ba7e753426add0ec3c5c039339f6977086fd211
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51672
AND Item_ID = 10)
WHERE Reciept_Id=51672
AND Item_ID = 10
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ba7e753426add0ec3c5c039339f6977086fd211
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51672
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51672
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5fd288c5d499c0ecb7f3f31804b943b1ff81d447
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50141
AND Item_ID = 1)
WHERE Reciept_Id=50141
AND Item_ID = 1
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5fd288c5d499c0ecb7f3f31804b943b1ff81d447
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50141
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50141
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59b0e85aff53b20c4d5e5088e16e2f870231c006
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50144
AND Item_ID = 3)
WHERE Reciept_Id=50144
AND Item_ID = 3
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 59b0e85aff53b20c4d5e5088e16e2f870231c006
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50144
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50144
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 270000a1cc7acd411a5877549038f0e14b45e44a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50144
AND Item_ID = 25)
WHERE Reciept_Id=50144
AND Item_ID = 25
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 270000a1cc7acd411a5877549038f0e14b45e44a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50144
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50144
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 687bb8f877f9ae2f1cff7749720770524a53249c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50403
AND Item_ID = 5)
WHERE Reciept_Id=50403
AND Item_ID = 5
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 687bb8f877f9ae2f1cff7749720770524a53249c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50403
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50403
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 90580088d789a395229c76f442d64f74b43a9a40
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50800
AND Item_ID = 29)
WHERE Reciept_Id=50800
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 90580088d789a395229c76f442d64f74b43a9a40
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50800
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50800
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d7d0123c4949406e7f55327cf7f86603aff46f7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51782
AND Item_ID = 1)
WHERE Reciept_Id=51782
AND Item_ID = 1
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d7d0123c4949406e7f55327cf7f86603aff46f7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51782
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51782
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5954a04fc8e2e76d77c9f8e561857502bca32795
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51782
AND Item_ID = 28)
WHERE Reciept_Id=51782
AND Item_ID = 28
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5954a04fc8e2e76d77c9f8e561857502bca32795
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51782
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51782
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 62079cea806a9438facc78e7c6d02bfa995f4975
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51890
AND Item_ID = 29)
WHERE Reciept_Id=51890
AND Item_ID = 29
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 62079cea806a9438facc78e7c6d02bfa995f4975
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51890
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51890
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9eba599c0256e4ab150310a762c249b241e93ef
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51890
AND Item_ID = 5)
WHERE Reciept_Id=51890
AND Item_ID = 5
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9eba599c0256e4ab150310a762c249b241e93ef
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51890
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51890
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abae9a5dc59415e7e3a27d178e2d53785bdad6d1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50633
AND Item_ID = 26)
WHERE Reciept_Id=50633
AND Item_ID = 26
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abae9a5dc59415e7e3a27d178e2d53785bdad6d1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50633
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50633
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22d1c3341ac750a4bc2d3b7fb569a10165429a7b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51197
AND Item_ID = 1)
WHERE Reciept_Id=51197
AND Item_ID = 1
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 22d1c3341ac750a4bc2d3b7fb569a10165429a7b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51197
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51197
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19e7b849cb9fbd9111d9030051b303ea3c131c20
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51197
AND Item_ID = 20)
WHERE Reciept_Id=51197
AND Item_ID = 20
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19e7b849cb9fbd9111d9030051b303ea3c131c20
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51197
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51197
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98c48693119fbe815970e9d61c0a0337769b8be5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52099
AND Item_ID = 28)
WHERE Reciept_Id=52099
AND Item_ID = 28
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98c48693119fbe815970e9d61c0a0337769b8be5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52099
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52099
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1eba73c9ef6c2df7886aa63065489d2c823f384f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52232
AND Item_ID = 15)
WHERE Reciept_Id=52232
AND Item_ID = 15
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1eba73c9ef6c2df7886aa63065489d2c823f384f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52232
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52232
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e3973341a2035c82d9248cc3a48bb76d7c9c851f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50927
AND Item_ID = 22)
WHERE Reciept_Id=50927
AND Item_ID = 22
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e3973341a2035c82d9248cc3a48bb76d7c9c851f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50927
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50927
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f37c70c2fe3d0a482305da0dc0ca76cd2e218718
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51525
AND Item_ID = 25)
WHERE Reciept_Id=51525
AND Item_ID = 25
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f37c70c2fe3d0a482305da0dc0ca76cd2e218718
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51525
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51525
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ffaf904878b88fadcfa84d54aff669e06f09763
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50502
AND Item_ID = 18)
WHERE Reciept_Id=50502
AND Item_ID = 18
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ffaf904878b88fadcfa84d54aff669e06f09763
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50502
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50502
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 168cb52efe4e3ef484dd05c2b658897253daed4f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50926
AND Item_ID = 28)
WHERE Reciept_Id=50926
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 168cb52efe4e3ef484dd05c2b658897253daed4f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50926
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50926
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4da543b657041e1e12bda7d491447ddfe5622f6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52313
AND Item_ID = 15)
WHERE Reciept_Id=52313
AND Item_ID = 15
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4da543b657041e1e12bda7d491447ddfe5622f6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52313
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52313
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5985e6ebbf543200bad8ae52328fbd80e0fd9f46
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51146
AND Item_ID = 15)
WHERE Reciept_Id=51146
AND Item_ID = 15
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5985e6ebbf543200bad8ae52328fbd80e0fd9f46
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51146
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51146
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7be0acce9c3f677be5b651bb399c4b0d4893489c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50811
AND Item_ID = 27)
WHERE Reciept_Id=50811
AND Item_ID = 27
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7be0acce9c3f677be5b651bb399c4b0d4893489c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50811
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50811
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3f642b732c366a6dc5f3a7ff058b9843d51f5ed3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50819
AND Item_ID = 23)
WHERE Reciept_Id=50819
AND Item_ID = 23
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3f642b732c366a6dc5f3a7ff058b9843d51f5ed3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50819
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50819
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3ac99d5b7fecfd14084278cf0ee4abaa3dcf5fa
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51634
AND Item_ID = 24)
WHERE Reciept_Id=51634
AND Item_ID = 24
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3ac99d5b7fecfd14084278cf0ee4abaa3dcf5fa
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51634
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51634
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 823365c660a51bb6544acdb685b8e03885948722
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51634
AND Item_ID = 17)
WHERE Reciept_Id=51634
AND Item_ID = 17
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 823365c660a51bb6544acdb685b8e03885948722
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51634
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51634
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 67db8db655f714e6d2bd702f5b1449779442baeb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51637
AND Item_ID = 26)
WHERE Reciept_Id=51637
AND Item_ID = 26
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 67db8db655f714e6d2bd702f5b1449779442baeb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51637
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51637
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3db5e30cd8e860f641ea6d866660df7be5a1dd6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50185
AND Item_ID = 16)
WHERE Reciept_Id=50185
AND Item_ID = 16
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3db5e30cd8e860f641ea6d866660df7be5a1dd6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50185
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50185
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b31e4148b9dadbba26cffd23effc876fc829cf06
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50185
AND Item_ID = 30)
WHERE Reciept_Id=50185
AND Item_ID = 30
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b31e4148b9dadbba26cffd23effc876fc829cf06
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50185
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50185
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 37c619a24d707635e2f684e05528303a265745bf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50437
AND Item_ID = 30)
WHERE Reciept_Id=50437
AND Item_ID = 30
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 37c619a24d707635e2f684e05528303a265745bf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50437
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50437
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 44c4824a692ecf619dff0a8db297b3ade2044027
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50441
AND Item_ID = 20)
WHERE Reciept_Id=50441
AND Item_ID = 20
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 44c4824a692ecf619dff0a8db297b3ade2044027
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50441
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50441
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 417d4c8e049b16fc0108dfeb7c6dc4ffcb6e0abd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51097
AND Item_ID = 8)
WHERE Reciept_Id=51097
AND Item_ID = 8
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 417d4c8e049b16fc0108dfeb7c6dc4ffcb6e0abd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51097
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51097
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9aa05aacb75a7b034d2cd198f50865af4d41cbcb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51364
AND Item_ID = 20)
WHERE Reciept_Id=51364
AND Item_ID = 20
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9aa05aacb75a7b034d2cd198f50865af4d41cbcb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51364
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51364
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0cfcdf2938cae468eda1b0c1686250fad13fcefd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51364
AND Item_ID = 18)
WHERE Reciept_Id=51364
AND Item_ID = 18
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0cfcdf2938cae468eda1b0c1686250fad13fcefd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51364
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51364
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2bb66320bfee95f9361dbdd12ce8ff7924625934
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51440
AND Item_ID = 16)
WHERE Reciept_Id=51440
AND Item_ID = 16
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2bb66320bfee95f9361dbdd12ce8ff7924625934
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51440
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51440
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23996662b36d2c481b91171fa3ed6b61456de3a9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50851
AND Item_ID = 21)
WHERE Reciept_Id=50851
AND Item_ID = 21
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23996662b36d2c481b91171fa3ed6b61456de3a9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50851
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50851
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06bead5002e5ef5257e8f940c154cb68c1016282
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51613
AND Item_ID = 8)
WHERE Reciept_Id=51613
AND Item_ID = 8
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 06bead5002e5ef5257e8f940c154cb68c1016282
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51613
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51613
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d27f1cd4f51c990dd0f4e13ae057f7c7f79f537
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51822
AND Item_ID = 16)
WHERE Reciept_Id=51822
AND Item_ID = 16
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d27f1cd4f51c990dd0f4e13ae057f7c7f79f537
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51822
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51822
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23edd76a9ea7869cfd93de2bb6f32c15ea912abc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50296
AND Item_ID = 7)
WHERE Reciept_Id=50296
AND Item_ID = 7
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23edd76a9ea7869cfd93de2bb6f32c15ea912abc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50296
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50296
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 84ed46d7cf12f443f4c4f72cf4d760c8f9b75c50
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51224
AND Item_ID = 9)
WHERE Reciept_Id=51224
AND Item_ID = 9
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 84ed46d7cf12f443f4c4f72cf4d760c8f9b75c50
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51224
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51224
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aca1c3f16cfddf346c4df6348ec133ac4721c08a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52128
AND Item_ID = 28)
WHERE Reciept_Id=52128
AND Item_ID = 28
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aca1c3f16cfddf346c4df6348ec133ac4721c08a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52128
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52128
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f240760e35ac43a0b6c22e821fd40316072549f2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50891
AND Item_ID = 13)
WHERE Reciept_Id=50891
AND Item_ID = 13
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f240760e35ac43a0b6c22e821fd40316072549f2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50891
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50891
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c832d745a939ff434ddcac9773be6df4376ba690
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50891
AND Item_ID = 21)
WHERE Reciept_Id=50891
AND Item_ID = 21
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c832d745a939ff434ddcac9773be6df4376ba690
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50891
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50891
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf10fc8275c304eeb989817f58535339383eb7b3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51106
AND Item_ID = 25)
WHERE Reciept_Id=51106
AND Item_ID = 25
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bf10fc8275c304eeb989817f58535339383eb7b3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51106
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51106
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a5e56afcc5c3a581d01097226243b0580798307
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51685
AND Item_ID = 29)
WHERE Reciept_Id=51685
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a5e56afcc5c3a581d01097226243b0580798307
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51685
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51685
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c22a0a32dae277f441c3f46a4109e4be334b3e9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51685
AND Item_ID = 5)
WHERE Reciept_Id=51685
AND Item_ID = 5
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c22a0a32dae277f441c3f46a4109e4be334b3e9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51685
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51685
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66e02e84e1a7ed2dddcbfc63f6b42822ac340ea0
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=52390
AND Item_ID = 1
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 66e02e84e1a7ed2dddcbfc63f6b42822ac340ea0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52390
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52390
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7d1cde1c68e05657190fb7fe413c97528872c7ff
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52390
AND Item_ID = 29)
WHERE Reciept_Id=52390
AND Item_ID = 29
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7d1cde1c68e05657190fb7fe413c97528872c7ff
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52390
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52390
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9990c86e3eb7f6628c346e891d889eb7b6dd8f3f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50924
AND Item_ID = 17)
WHERE Reciept_Id=50924
AND Item_ID = 17
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9990c86e3eb7f6628c346e891d889eb7b6dd8f3f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50924
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50924
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c324076008939577f116b728e6676ca25f4ab2e2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51426
AND Item_ID = 6)
WHERE Reciept_Id=51426
AND Item_ID = 6
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c324076008939577f116b728e6676ca25f4ab2e2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51426
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51426
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9034b18273818680c897a41602bdcc18d4898a86
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51441
AND Item_ID = 12)
WHERE Reciept_Id=51441
AND Item_ID = 12
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9034b18273818680c897a41602bdcc18d4898a86
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51441
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51441
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 94fe717ad9c10421b70745841bb7fd56e9b9d6b1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52005
AND Item_ID = 22)
WHERE Reciept_Id=52005
AND Item_ID = 22
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 94fe717ad9c10421b70745841bb7fd56e9b9d6b1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52005
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52005
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: faf8dfe0ce68a01688c1811c910daeb0dd64a0f7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50450
AND Item_ID = 15)
WHERE Reciept_Id=50450
AND Item_ID = 15
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: faf8dfe0ce68a01688c1811c910daeb0dd64a0f7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50450
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50450
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8bb02bbb6494115da0056f17d8121f6485035acb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52225
AND Item_ID = 28)
WHERE Reciept_Id=52225
AND Item_ID = 28
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8bb02bbb6494115da0056f17d8121f6485035acb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52225
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52225
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 256521f4a0c0c1608a67c53cb1fbdf357c6c4b1f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50557
AND Item_ID = 20)
WHERE Reciept_Id=50557
AND Item_ID = 20
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 256521f4a0c0c1608a67c53cb1fbdf357c6c4b1f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50557
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50557
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: de7a810c765e1dd7108ae5cdb8bb05fc3707072e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50557
AND Item_ID = 13)
WHERE Reciept_Id=50557
AND Item_ID = 13
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: de7a810c765e1dd7108ae5cdb8bb05fc3707072e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50557
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50557
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d1a171e20e2f4bdf55dd5fdab3aea67517f3a85b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51079
AND Item_ID = 9)
WHERE Reciept_Id=51079
AND Item_ID = 9
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d1a171e20e2f4bdf55dd5fdab3aea67517f3a85b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51079
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51079
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e1c9f29bc8de9afd413c5183439583c268a667e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50305
AND Item_ID = 1)
WHERE Reciept_Id=50305
AND Item_ID = 1
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e1c9f29bc8de9afd413c5183439583c268a667e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50305
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50305
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae55495609c33ea9e479c2b0e1d657e22054191c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51071
AND Item_ID = 20)
WHERE Reciept_Id=51071
AND Item_ID = 20
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae55495609c33ea9e479c2b0e1d657e22054191c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51071
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51071
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e05c87b7331ddbbfc57bcb9d210fbdd8633156c3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51604
AND Item_ID = 11)
WHERE Reciept_Id=51604
AND Item_ID = 11
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e05c87b7331ddbbfc57bcb9d210fbdd8633156c3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51604
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51604
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71ea4849287baa6f13405baddc92567e03bed2e1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52183
AND Item_ID = 4)
WHERE Reciept_Id=52183
AND Item_ID = 4
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 71ea4849287baa6f13405baddc92567e03bed2e1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52183
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52183
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0eafc49177cac9d6f846e00d5d3e30e1aaf8b0e1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52243
AND Item_ID = 7)
WHERE Reciept_Id=52243
AND Item_ID = 7
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0eafc49177cac9d6f846e00d5d3e30e1aaf8b0e1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52243
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52243
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dcd8c8b0926d574feead7cbb30b38cc8f39d74e4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50530
AND Item_ID = 14)
WHERE Reciept_Id=50530
AND Item_ID = 14
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dcd8c8b0926d574feead7cbb30b38cc8f39d74e4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50530
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50530
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7f6cb6784ffd33cdeb2cc954a7d6cc1da139b711
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52134
AND Item_ID = 22)
WHERE Reciept_Id=52134
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7f6cb6784ffd33cdeb2cc954a7d6cc1da139b711
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52134
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52134
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f5257adffdddb203a53bbb6f72c4bebaa0c893fb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52454
AND Item_ID = 30)
WHERE Reciept_Id=52454
AND Item_ID = 30
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f5257adffdddb203a53bbb6f72c4bebaa0c893fb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52454
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52454
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d425dde845a8e08e06eab48733076784532c3de2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52454
AND Item_ID = 29)
WHERE Reciept_Id=52454
AND Item_ID = 29
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d425dde845a8e08e06eab48733076784532c3de2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52454
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52454
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ac49d7b594c3e3f772e2f71f5c36fc8ddc86e30
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=50976
AND Item_ID = 26
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ac49d7b594c3e3f772e2f71f5c36fc8ddc86e30
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50976
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50976
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0412d2d7b2717adbcbe963b1dcfe562c8dd1c6c1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50976
AND Item_ID = 6)
WHERE Reciept_Id=50976
AND Item_ID = 6
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0412d2d7b2717adbcbe963b1dcfe562c8dd1c6c1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50976
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50976
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cc31632f58b482456a2a4a9a471cb223a4550ef
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51207
AND Item_ID = 6)
WHERE Reciept_Id=51207
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6cc31632f58b482456a2a4a9a471cb223a4550ef
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51207
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51207
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db557754fc31996391c5d070367f1cdcb3cdc181
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51670
AND Item_ID = 11)
WHERE Reciept_Id=51670
AND Item_ID = 11
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db557754fc31996391c5d070367f1cdcb3cdc181
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51670
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51670
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 474e9eea541e219cf08abebcc15164d0845f9a17
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51670
AND Item_ID = 30)
WHERE Reciept_Id=51670
AND Item_ID = 30
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 474e9eea541e219cf08abebcc15164d0845f9a17
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51670
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51670
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6c69cf0250387a02f80cf8352d905271a1216868
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52077
AND Item_ID = 19)
WHERE Reciept_Id=52077
AND Item_ID = 19
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6c69cf0250387a02f80cf8352d905271a1216868
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52077
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52077
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 109c3f1647f71bd1308316d781063cd972f0de4c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50756
AND Item_ID = 14)
WHERE Reciept_Id=50756
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 109c3f1647f71bd1308316d781063cd972f0de4c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50756
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50756
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5e7e45f790bfae16166afed2d99c923b5bde8ff0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51464
AND Item_ID = 17)
WHERE Reciept_Id=51464
AND Item_ID = 17
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5e7e45f790bfae16166afed2d99c923b5bde8ff0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51464
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51464
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40eadc0ebcdebdc168db2227998ef9827eab452d
UPDATE Assignment1Data 
SET [Item_Quantity]=12
WHERE Reciept_Id=50643
AND Item_ID = 12
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40eadc0ebcdebdc168db2227998ef9827eab452d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50643
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50643
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 022664ba0ac3eed25c08156baefb5b7b2fade1a6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50643
AND Item_ID = 5)
WHERE Reciept_Id=50643
AND Item_ID = 5
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 022664ba0ac3eed25c08156baefb5b7b2fade1a6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50643
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50643
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3743780c164c9700ea381bc27cabbcb9ad5db039
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50624
AND Item_ID = 14)
WHERE Reciept_Id=50624
AND Item_ID = 14
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3743780c164c9700ea381bc27cabbcb9ad5db039
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50624
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50624
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8cd08b2c49d1db294450ce409d91f9917f3b1ae1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50743
AND Item_ID = 7)
WHERE Reciept_Id=50743
AND Item_ID = 7
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8cd08b2c49d1db294450ce409d91f9917f3b1ae1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50743
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50743
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b00e14afc632294085b4fb9cabcb409975c63f83
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50743
AND Item_ID = 16)
WHERE Reciept_Id=50743
AND Item_ID = 16
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b00e14afc632294085b4fb9cabcb409975c63f83
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50743
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50743
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c99134edaad81232104fb9bef00b7be5352ade55
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50743
AND Item_ID = 23)
WHERE Reciept_Id=50743
AND Item_ID = 23
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c99134edaad81232104fb9bef00b7be5352ade55
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50743
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50743
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d24baf18f2b62c8cbfe856e5df0476e160c08925
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52019
AND Item_ID = 15)
WHERE Reciept_Id=52019
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d24baf18f2b62c8cbfe856e5df0476e160c08925
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52019
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52019
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a921b6c584430397064f2a87cccaf6392fe234d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52294
AND Item_ID = 17)
WHERE Reciept_Id=52294
AND Item_ID = 17
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a921b6c584430397064f2a87cccaf6392fe234d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52294
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52294
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d8f450a36dc1ea68668a450f53680aa72e1d39a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52294
AND Item_ID = 1)
WHERE Reciept_Id=52294
AND Item_ID = 1
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d8f450a36dc1ea68668a450f53680aa72e1d39a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52294
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52294
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07409e2ecfff97dd359e347c29d2dc6fc8b2ae55
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50266
AND Item_ID = 16)
WHERE Reciept_Id=50266
AND Item_ID = 16
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07409e2ecfff97dd359e347c29d2dc6fc8b2ae55
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50266
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50266
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec54b34c3a32f4a7f5c2327f3a6d33982fd8cfa5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50667
AND Item_ID = 4)
WHERE Reciept_Id=50667
AND Item_ID = 4
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec54b34c3a32f4a7f5c2327f3a6d33982fd8cfa5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50667
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50667
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2cbce3ca6c4a71d7ab92d281ea121e828f6d2bd9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50088
AND Item_ID = 4)
WHERE Reciept_Id=50088
AND Item_ID = 4
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2cbce3ca6c4a71d7ab92d281ea121e828f6d2bd9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50088
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50088
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9b7c9f812f365f08f7463aa3adba6ed45c9ce234
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50230
AND Item_ID = 26)
WHERE Reciept_Id=50230
AND Item_ID = 26
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9b7c9f812f365f08f7463aa3adba6ed45c9ce234
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50230
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50230
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b003a915098d475bbfd7203e2b5481aea4b170ba
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50700
AND Item_ID = 28)
WHERE Reciept_Id=50700
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b003a915098d475bbfd7203e2b5481aea4b170ba
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50700
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50700
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c328f0d489ade23a8f5e5ac7a7554bc533d0fae8
UPDATE Assignment1Data 
SET [Item_Quantity]=4
WHERE Reciept_Id=52469
AND Item_ID = 9
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c328f0d489ade23a8f5e5ac7a7554bc533d0fae8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52469
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52469
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a891be743944d612a4da99e778432c05be01e6f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52469
AND Item_ID = 29)
WHERE Reciept_Id=52469
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5a891be743944d612a4da99e778432c05be01e6f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52469
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52469
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 10c0ec876d31a919cb36f6afb81f71c49bdf4bb9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52299
AND Item_ID = 30)
WHERE Reciept_Id=52299
AND Item_ID = 30
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 10c0ec876d31a919cb36f6afb81f71c49bdf4bb9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52299
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52299
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 84b2dc381ec535e0974356f4414e146844852c57
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52299
AND Item_ID = 17)
WHERE Reciept_Id=52299
AND Item_ID = 17
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 84b2dc381ec535e0974356f4414e146844852c57
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52299
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52299
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4e9f03673dd1cb95d0ab4824a7ff075aef608860
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50716
AND Item_ID = 30)
WHERE Reciept_Id=50716
AND Item_ID = 30
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4e9f03673dd1cb95d0ab4824a7ff075aef608860
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50716
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50716
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d2251d70413eb8b8ef88e88918ca57cf2526d093
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50716
AND Item_ID = 4)
WHERE Reciept_Id=50716
AND Item_ID = 4
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d2251d70413eb8b8ef88e88918ca57cf2526d093
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50716
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50716
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e3a3e988f7b6117c40709a4a4a2c8193b29e4113
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51382
AND Item_ID = 14)
WHERE Reciept_Id=51382
AND Item_ID = 14
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e3a3e988f7b6117c40709a4a4a2c8193b29e4113
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51382
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51382
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be4f9d0b738f4db4a85dcc39b6d21587e8b82f94
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51774
AND Item_ID = 10)
WHERE Reciept_Id=51774
AND Item_ID = 10
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be4f9d0b738f4db4a85dcc39b6d21587e8b82f94
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51774
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51774
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a79a2c3b39cd051004bad919fe153bc1f0859c0d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50060
AND Item_ID = 15)
WHERE Reciept_Id=50060
AND Item_ID = 15
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a79a2c3b39cd051004bad919fe153bc1f0859c0d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50060
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50060
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ce02c4d068f5de276dad32afed34bb5e9e256a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50112
AND Item_ID = 29)
WHERE Reciept_Id=50112
AND Item_ID = 29
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2ce02c4d068f5de276dad32afed34bb5e9e256a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50112
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50112
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cb47a05d1563babf1a9eaae76cd22904632d1f51
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51479
AND Item_ID = 2)
WHERE Reciept_Id=51479
AND Item_ID = 2
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cb47a05d1563babf1a9eaae76cd22904632d1f51
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51479
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51479
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a391f5f73672889c3de20c62471dc46f03e77360
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51587
AND Item_ID = 3)
WHERE Reciept_Id=51587
AND Item_ID = 3
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a391f5f73672889c3de20c62471dc46f03e77360
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51587
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51587
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16d27662996356f3be80f13c3b9e54f5b5c675c3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51587
AND Item_ID = 15)
WHERE Reciept_Id=51587
AND Item_ID = 15
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16d27662996356f3be80f13c3b9e54f5b5c675c3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51587
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51587
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28881e611d9d0d615971ff58de6cbf0cb93aeea9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51938
AND Item_ID = 10)
WHERE Reciept_Id=51938
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28881e611d9d0d615971ff58de6cbf0cb93aeea9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51938
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51938
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86ded9c58ae9dabf0097eb5bc4717213a8181a4a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52374
AND Item_ID = 7)
WHERE Reciept_Id=52374
AND Item_ID = 7
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 86ded9c58ae9dabf0097eb5bc4717213a8181a4a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52374
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52374
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1f91fd4599c368893cdbdc55fb5287a83a4502bd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52409
AND Item_ID = 9)
WHERE Reciept_Id=52409
AND Item_ID = 9
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1f91fd4599c368893cdbdc55fb5287a83a4502bd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52409
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52409
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3361a210b00382cde704950659ca66dd0d17ffac
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50432
AND Item_ID = 8)
WHERE Reciept_Id=50432
AND Item_ID = 8
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3361a210b00382cde704950659ca66dd0d17ffac
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50432
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50432
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5eb91aa13c507eacef9fef2310c0f0a09d5b8104
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51169
AND Item_ID = 20)
WHERE Reciept_Id=51169
AND Item_ID = 20
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5eb91aa13c507eacef9fef2310c0f0a09d5b8104
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51169
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51169
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c0516dc0341643566231253db59fbcf95ff5530
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51927
AND Item_ID = 29)
WHERE Reciept_Id=51927
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c0516dc0341643566231253db59fbcf95ff5530
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51927
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51927
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1ebe0324423bb3475ea21b0ebc27f3b48583cee3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51804
AND Item_ID = 1)
WHERE Reciept_Id=51804
AND Item_ID = 1
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1ebe0324423bb3475ea21b0ebc27f3b48583cee3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51804
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51804
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae43d07d79aba8249f375045dddea7d58d10a9a7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51891
AND Item_ID = 13)
WHERE Reciept_Id=51891
AND Item_ID = 13
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae43d07d79aba8249f375045dddea7d58d10a9a7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51891
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51891
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 72bb049e74e66454d520087d7280c775f2b10005
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50593
AND Item_ID = 1)
WHERE Reciept_Id=50593
AND Item_ID = 1
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 72bb049e74e66454d520087d7280c775f2b10005
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50593
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50593
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b89bea934b02bed31c168d33f6ce855201909ab
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50863
AND Item_ID = 6)
WHERE Reciept_Id=50863
AND Item_ID = 6
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b89bea934b02bed31c168d33f6ce855201909ab
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50863
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50863
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a26a43e88a84a64606c259f8f40cbf7c8e63621d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50580
AND Item_ID = 26)
WHERE Reciept_Id=50580
AND Item_ID = 26
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a26a43e88a84a64606c259f8f40cbf7c8e63621d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50580
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50580
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a07348a48c5f6f7f31964efd815b9ccfdbf99618
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51398
AND Item_ID = 21)
WHERE Reciept_Id=51398
AND Item_ID = 21
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a07348a48c5f6f7f31964efd815b9ccfdbf99618
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51398
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51398
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7e9e95e1feeb9000af55e7f299c9eaf4b7783849
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51961
AND Item_ID = 12)
WHERE Reciept_Id=51961
AND Item_ID = 12
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7e9e95e1feeb9000af55e7f299c9eaf4b7783849
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51961
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51961
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 56ada73a69dc2dddc2841c41d01b7a73778c9a47
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51961
AND Item_ID = 9)
WHERE Reciept_Id=51961
AND Item_ID = 9
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 56ada73a69dc2dddc2841c41d01b7a73778c9a47
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51961
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51961
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 36946c4a6171bf1172f551ad0031d9800760f8d7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50252
AND Item_ID = 21)
WHERE Reciept_Id=50252
AND Item_ID = 21
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 36946c4a6171bf1172f551ad0031d9800760f8d7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50252
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50252
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c692a3708d3d1bfe4ce0e1a69c7792ea80c2841b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50554
AND Item_ID = 9)
WHERE Reciept_Id=50554
AND Item_ID = 9
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c692a3708d3d1bfe4ce0e1a69c7792ea80c2841b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50554
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50554
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f9720d12dd93d00b51f32345851dcf77a9b76b1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51667
AND Item_ID = 22)
WHERE Reciept_Id=51667
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f9720d12dd93d00b51f32345851dcf77a9b76b1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51667
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51667
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ecdfbcd17b0bc57b9d0f5f8b833a510ff8705f0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51490
AND Item_ID = 1)
WHERE Reciept_Id=51490
AND Item_ID = 1
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5ecdfbcd17b0bc57b9d0f5f8b833a510ff8705f0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51490
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51490
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d42cc799c271caec5f9fe3f97b844159e985a9b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50029
AND Item_ID = 4)
WHERE Reciept_Id=50029
AND Item_ID = 4
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d42cc799c271caec5f9fe3f97b844159e985a9b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50029
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50029
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 01b83608b212aa5e1a1800519e0f36bff62e2bcb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50037
AND Item_ID = 15)
WHERE Reciept_Id=50037
AND Item_ID = 15
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 01b83608b212aa5e1a1800519e0f36bff62e2bcb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50037
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50037
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 31e998143f5ce7b98316902b06235651f04af649
UPDATE Assignment1Data 
SET [Item_Quantity]=18
WHERE Reciept_Id=50073
AND Item_ID = 23
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 31e998143f5ce7b98316902b06235651f04af649
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50073
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50073
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23f2e45ae87deee83a414b38957172f49e3781ea
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50076
AND Item_ID = 9)
WHERE Reciept_Id=50076
AND Item_ID = 9
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 23f2e45ae87deee83a414b38957172f49e3781ea
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50076
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50076
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 886ebfe61ce1950b368f4348d666723aadbf8c30
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50444
AND Item_ID = 16)
WHERE Reciept_Id=50444
AND Item_ID = 16
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 886ebfe61ce1950b368f4348d666723aadbf8c30
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50444
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50444
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b77c7713728e39bcddb630b725ee02a2e448c217
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50681
AND Item_ID = 12)
WHERE Reciept_Id=50681
AND Item_ID = 12
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b77c7713728e39bcddb630b725ee02a2e448c217
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50681
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50681
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3eab2f7726503f6122f31ade8574fc44ae084d9d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51682
AND Item_ID = 4)
WHERE Reciept_Id=51682
AND Item_ID = 4
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3eab2f7726503f6122f31ade8574fc44ae084d9d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51682
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51682
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad52b2464b594c56daad85905586d8855c4c6347
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50574
AND Item_ID = 28)
WHERE Reciept_Id=50574
AND Item_ID = 28
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad52b2464b594c56daad85905586d8855c4c6347
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50574
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50574
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c64b32fa5501227d9871e5f8318b6cac445911d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50574
AND Item_ID = 14)
WHERE Reciept_Id=50574
AND Item_ID = 14
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c64b32fa5501227d9871e5f8318b6cac445911d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50574
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50574
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9122537fc9b64af9889aed3b6cd0e5d949cc1f1d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50822
AND Item_ID = 9)
WHERE Reciept_Id=50822
AND Item_ID = 9
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9122537fc9b64af9889aed3b6cd0e5d949cc1f1d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50822
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50822
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad4ddb4047de56e7926ed01d05c84d01b602460f
UPDATE Assignment1Data 
SET [Item_Quantity]=6
WHERE Reciept_Id=51067
AND Item_ID = 17
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad4ddb4047de56e7926ed01d05c84d01b602460f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51067
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51067
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6623fb24da0c5412cabca1a9570cfb70844dc9ff
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51067
AND Item_ID = 27)
WHERE Reciept_Id=51067
AND Item_ID = 27
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6623fb24da0c5412cabca1a9570cfb70844dc9ff
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51067
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51067
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6383be9d0c158c0019280912fb3731c6dad4d932
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51214
AND Item_ID = 22)
WHERE Reciept_Id=51214
AND Item_ID = 22
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6383be9d0c158c0019280912fb3731c6dad4d932
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51214
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51214
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2835de22ef9e8565b0e8032c63429b71211805a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51615
AND Item_ID = 20)
WHERE Reciept_Id=51615
AND Item_ID = 20
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2835de22ef9e8565b0e8032c63429b71211805a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51615
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51615
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2575536bb4789c1d3df6a97de40a57f8b06d6727
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51192
AND Item_ID = 6)
WHERE Reciept_Id=51192
AND Item_ID = 6
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2575536bb4789c1d3df6a97de40a57f8b06d6727
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51192
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51192
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa49ea7365df03a220efa7a0879b526d482ebbf4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51286
AND Item_ID = 24)
WHERE Reciept_Id=51286
AND Item_ID = 24
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aa49ea7365df03a220efa7a0879b526d482ebbf4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51286
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51286
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2981ce3580dafff30fe7fb07ba88ecdd2a471b33
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50041
AND Item_ID = 3)
WHERE Reciept_Id=50041
AND Item_ID = 3
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2981ce3580dafff30fe7fb07ba88ecdd2a471b33
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50041
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50041
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 775871f1b8ab91f99cb64351f401a91c61742f5d
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=51125
AND Item_ID = 26
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 775871f1b8ab91f99cb64351f401a91c61742f5d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51125
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51125
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d78c3cafb5403d48ff512b6cd6a4b1d5bad586a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51383
AND Item_ID = 9)
WHERE Reciept_Id=51383
AND Item_ID = 9
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4d78c3cafb5403d48ff512b6cd6a4b1d5bad586a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51383
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51383
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c50ce1258291eb57907569889f2826e7b325d8fc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51543
AND Item_ID = 15)
WHERE Reciept_Id=51543
AND Item_ID = 15
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c50ce1258291eb57907569889f2826e7b325d8fc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51543
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51543
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e99acb34233b186d12b205f773ce6a57fb409c8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51543
AND Item_ID = 21)
WHERE Reciept_Id=51543
AND Item_ID = 21
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e99acb34233b186d12b205f773ce6a57fb409c8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51543
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51543
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a97091dea35b8c89ceecb8464788d6711acbc92
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51543
AND Item_ID = 17)
WHERE Reciept_Id=51543
AND Item_ID = 17
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9a97091dea35b8c89ceecb8464788d6711acbc92
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51543
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51543
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f34872b9b1e5135df197ac81d2c0ed3e807b2e9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51979
AND Item_ID = 19)
WHERE Reciept_Id=51979
AND Item_ID = 19
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f34872b9b1e5135df197ac81d2c0ed3e807b2e9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51979
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51979
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40b8dac33b3d40d9e28a7baea833da710f79e23e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50218
AND Item_ID = 6)
WHERE Reciept_Id=50218
AND Item_ID = 6
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 40b8dac33b3d40d9e28a7baea833da710f79e23e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50218
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50218
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8495a2483ef93485ee20de356ea415f8b76297a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50975
AND Item_ID = 12)
WHERE Reciept_Id=50975
AND Item_ID = 12
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8495a2483ef93485ee20de356ea415f8b76297a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50975
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50975
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 30c133dc2a5721db07032aabad52e802405b86f9
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=51000
AND Item_ID = 3
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 30c133dc2a5721db07032aabad52e802405b86f9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51000
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51000
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 146378b7cd41a30f4f0228c0a267df774475d28f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51000
AND Item_ID = 30)
WHERE Reciept_Id=51000
AND Item_ID = 30
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 146378b7cd41a30f4f0228c0a267df774475d28f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51000
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51000
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 058735e65d1bf6dc187a387d077cdece58de6fdb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51395
AND Item_ID = 21)
WHERE Reciept_Id=51395
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 058735e65d1bf6dc187a387d077cdece58de6fdb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51395
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51395
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb90ee0cc9ea90dd91250bba813816b2cf81d8d1
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51395
AND Item_ID = 10)
WHERE Reciept_Id=51395
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: eb90ee0cc9ea90dd91250bba813816b2cf81d8d1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51395
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51395
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c230cde647749b916853215e5b73258be6924b57
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51707
AND Item_ID = 9)
WHERE Reciept_Id=51707
AND Item_ID = 9
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c230cde647749b916853215e5b73258be6924b57
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51707
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51707
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98abc0ffcfdddcfdd33c1a7b323ec4807a3b1c50
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50486
AND Item_ID = 30)
WHERE Reciept_Id=50486
AND Item_ID = 30
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 98abc0ffcfdddcfdd33c1a7b323ec4807a3b1c50
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50486
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50486
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4466055368b50b058bf39c81d1012be4deb198e9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50486
AND Item_ID = 11)
WHERE Reciept_Id=50486
AND Item_ID = 11
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4466055368b50b058bf39c81d1012be4deb198e9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50486
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50486
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1cb2128ccd61a5f04eaee5236916ea7beab8b79f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50820
AND Item_ID = 26)
WHERE Reciept_Id=50820
AND Item_ID = 26
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1cb2128ccd61a5f04eaee5236916ea7beab8b79f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50820
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50820
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f2a71a6c5f8c2a97fe15958e281926994c8692ff
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51982
AND Item_ID = 5)
WHERE Reciept_Id=51982
AND Item_ID = 5
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f2a71a6c5f8c2a97fe15958e281926994c8692ff
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51982
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51982
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3757929ba0cc1621ff1ede35c19cc92ddd57063
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52283
AND Item_ID = 21)
WHERE Reciept_Id=52283
AND Item_ID = 21
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3757929ba0cc1621ff1ede35c19cc92ddd57063
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52283
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52283
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e3baee7ad6f90804dcd980fc002b904c097aa50
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52490
AND Item_ID = 23)
WHERE Reciept_Id=52490
AND Item_ID = 23
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1e3baee7ad6f90804dcd980fc002b904c097aa50
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52490
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52490
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5968f5463d2306d3ef2e1456b285a0f0e4a9a6e2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50058
AND Item_ID = 4)
WHERE Reciept_Id=50058
AND Item_ID = 4
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5968f5463d2306d3ef2e1456b285a0f0e4a9a6e2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50058
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50058
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e03a2b9dd818687ba41f10d06e37314a2f843c78
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=50063
AND Item_ID = 14
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e03a2b9dd818687ba41f10d06e37314a2f843c78
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50063
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50063
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aca23836672d2758030a17fbd39b260ed633a3e7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50063
AND Item_ID = 28)
WHERE Reciept_Id=50063
AND Item_ID = 28
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aca23836672d2758030a17fbd39b260ed633a3e7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50063
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50063
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 56ebc1321e79ad510ae62c8262f11494a6c271c8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51504
AND Item_ID = 28)
WHERE Reciept_Id=51504
AND Item_ID = 28
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 56ebc1321e79ad510ae62c8262f11494a6c271c8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51504
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51504
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f2176f7aeaa73a536f4ee22b445f25f55cab2e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51900
AND Item_ID = 24)
WHERE Reciept_Id=51900
AND Item_ID = 24
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 13f2176f7aeaa73a536f4ee22b445f25f55cab2e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51900
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51900
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c0c339c64b6270026e789d809aff9369cf9a5c6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50482
AND Item_ID = 2)
WHERE Reciept_Id=50482
AND Item_ID = 2
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7c0c339c64b6270026e789d809aff9369cf9a5c6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50482
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50482
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c9171d3cdae31569d9bc05cae223473ab68fb9a0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50482
AND Item_ID = 25)
WHERE Reciept_Id=50482
AND Item_ID = 25
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c9171d3cdae31569d9bc05cae223473ab68fb9a0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50482
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50482
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f925a8422fc79d9c969a204be8ae62a86dceff09
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51247
AND Item_ID = 23)
WHERE Reciept_Id=51247
AND Item_ID = 23
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f925a8422fc79d9c969a204be8ae62a86dceff09
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51247
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51247
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c2b8f7b6bdcc753e5b14b4f3ab983140f03960b9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51022
AND Item_ID = 1)
WHERE Reciept_Id=51022
AND Item_ID = 1
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c2b8f7b6bdcc753e5b14b4f3ab983140f03960b9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51022
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51022
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b733a541d759b704ff9e478f1aad4b49a14e4f54
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51258
AND Item_ID = 5)
WHERE Reciept_Id=51258
AND Item_ID = 5
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b733a541d759b704ff9e478f1aad4b49a14e4f54
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51258
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51258
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db64a7c944bdbf8b0a0196ade00e744b66cec7cf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51298
AND Item_ID = 21)
WHERE Reciept_Id=51298
AND Item_ID = 21
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: db64a7c944bdbf8b0a0196ade00e744b66cec7cf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51298
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51298
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 634bd70f4698ac2b3f6b82e09f016be29158096d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51824
AND Item_ID = 29)
WHERE Reciept_Id=51824
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 634bd70f4698ac2b3f6b82e09f016be29158096d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51824
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51824
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c2c66ff9c412908a1e2eb6d49cba48dc4abf2da1
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=50606
AND Item_ID = 4
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c2c66ff9c412908a1e2eb6d49cba48dc4abf2da1
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50606
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50606
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ea6b6383b814b3616a7631885cf821f98f77114e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50847
AND Item_ID = 6)
WHERE Reciept_Id=50847
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ea6b6383b814b3616a7631885cf821f98f77114e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50847
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50847
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 63c85559ec38c573b2a1d7eff0c4f3302aea774d
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=50847
AND Item_ID = 7
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 63c85559ec38c573b2a1d7eff0c4f3302aea774d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50847
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50847
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 106c7b2b886f83742161050bb9bb99f2f87857fd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50401
AND Item_ID = 21)
WHERE Reciept_Id=50401
AND Item_ID = 21
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 106c7b2b886f83742161050bb9bb99f2f87857fd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50401
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50401
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d9fbb33b6908f5ef96cdb5ace089ad935e9ad35e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50520
AND Item_ID = 2)
WHERE Reciept_Id=50520
AND Item_ID = 2
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d9fbb33b6908f5ef96cdb5ace089ad935e9ad35e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50520
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50520
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bde918090797e4654dc15736fb7809aaa637be79
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50520
AND Item_ID = 28)
WHERE Reciept_Id=50520
AND Item_ID = 28
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bde918090797e4654dc15736fb7809aaa637be79
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50520
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50520
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c4ac21792468706fe1f45e5515db369ea9e8217
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50728
AND Item_ID = 21)
WHERE Reciept_Id=50728
AND Item_ID = 21
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9c4ac21792468706fe1f45e5515db369ea9e8217
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50728
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50728
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0005a449f16ad5dc7fd555d6910549d1aec898ce
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50728
AND Item_ID = 16)
WHERE Reciept_Id=50728
AND Item_ID = 16
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0005a449f16ad5dc7fd555d6910549d1aec898ce
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50728
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50728
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f69b1efe504c1d8aa3bd71a78d7656cee0ad80ed
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50728
AND Item_ID = 23)
WHERE Reciept_Id=50728
AND Item_ID = 23
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f69b1efe504c1d8aa3bd71a78d7656cee0ad80ed
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50728
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50728
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4c0a1dfa9741b765931d991de50b80314fe5eb5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50894
AND Item_ID = 12)
WHERE Reciept_Id=50894
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f4c0a1dfa9741b765931d991de50b80314fe5eb5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50894
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50894
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3dbf28c8b4a7ea2c95baf92d128eafe748d87afb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52462
AND Item_ID = 12)
WHERE Reciept_Id=52462
AND Item_ID = 12
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3dbf28c8b4a7ea2c95baf92d128eafe748d87afb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52462
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52462
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8929225b8ed803fc0803dbe38c89e639f5dc5bb9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50072
AND Item_ID = 16)
WHERE Reciept_Id=50072
AND Item_ID = 16
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8929225b8ed803fc0803dbe38c89e639f5dc5bb9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50072
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50072
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7bf7c541d6669dc89a89e09bca7e9bf839cb8c4e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51432
AND Item_ID = 20)
WHERE Reciept_Id=51432
AND Item_ID = 20
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7bf7c541d6669dc89a89e09bca7e9bf839cb8c4e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51432
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51432
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28a85664d8717536469864d791e2c7778cfee4eb
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=51432
AND Item_ID = 18
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 28a85664d8717536469864d791e2c7778cfee4eb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51432
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51432
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2350c4206c23c5beb508c52138bd257e8904f65
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51818
AND Item_ID = 13)
WHERE Reciept_Id=51818
AND Item_ID = 13
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b2350c4206c23c5beb508c52138bd257e8904f65
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51818
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51818
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5c9f44750506ccb544b09f3e848fa4e6bf89bbe2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52240
AND Item_ID = 15)
WHERE Reciept_Id=52240
AND Item_ID = 15
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5c9f44750506ccb544b09f3e848fa4e6bf89bbe2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52240
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52240
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a792113af0025d35cf065771741e80618cbc2d8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50115
AND Item_ID = 1)
WHERE Reciept_Id=50115
AND Item_ID = 1
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6a792113af0025d35cf065771741e80618cbc2d8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50115
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50115
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0e5136833ce4ddf5a0a631cd3a6be043f2689e6d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50234
AND Item_ID = 16)
WHERE Reciept_Id=50234
AND Item_ID = 16
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0e5136833ce4ddf5a0a631cd3a6be043f2689e6d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50234
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50234
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04f3f44ae7a86f6d9aa8acf5ba483cfe46d43ec7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50501
AND Item_ID = 24)
WHERE Reciept_Id=50501
AND Item_ID = 24
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 04f3f44ae7a86f6d9aa8acf5ba483cfe46d43ec7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50501
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50501
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8702c0d81456a4f75c7dc9bf8f683e5db7daec49
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51765
AND Item_ID = 19)
WHERE Reciept_Id=51765
AND Item_ID = 19
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8702c0d81456a4f75c7dc9bf8f683e5db7daec49
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51765
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51765
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4c21da47449734fa4d146906faaf61205e3b00d9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51765
AND Item_ID = 25)
WHERE Reciept_Id=51765
AND Item_ID = 25
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 4c21da47449734fa4d146906faaf61205e3b00d9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51765
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51765
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6616e1c62b5a7c3528bcadafef70c72c16a00b1d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52124
AND Item_ID = 22)
WHERE Reciept_Id=52124
AND Item_ID = 22
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6616e1c62b5a7c3528bcadafef70c72c16a00b1d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52124
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52124
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a76513e72b0b53f2d80cdd92a0ca5e08d21580e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50885
AND Item_ID = 8)
WHERE Reciept_Id=50885
AND Item_ID = 8
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3a76513e72b0b53f2d80cdd92a0ca5e08d21580e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50885
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50885
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87c0caa0560134dd08ef23322a12ad6b59bd7f44
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50921
AND Item_ID = 6)
WHERE Reciept_Id=50921
AND Item_ID = 6
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 87c0caa0560134dd08ef23322a12ad6b59bd7f44
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50921
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50921
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2f1cbc7551ce83bb9099ca6027296a1ad5893f2d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50361
AND Item_ID = 29)
WHERE Reciept_Id=50361
AND Item_ID = 29
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2f1cbc7551ce83bb9099ca6027296a1ad5893f2d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50361
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50361
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fe3c859891eed422327ccb21fa732dccaa4dc440
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50569
AND Item_ID = 16)
WHERE Reciept_Id=50569
AND Item_ID = 16
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fe3c859891eed422327ccb21fa732dccaa4dc440
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50569
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50569
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e30f36b6cf369619befe9d9b607cab48b58c6027
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50569
AND Item_ID = 19)
WHERE Reciept_Id=50569
AND Item_ID = 19
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e30f36b6cf369619befe9d9b607cab48b58c6027
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50569
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50569
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a76ad80d0d50514dc9b495225fa3561ab7d0da84
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51348
AND Item_ID = 22)
WHERE Reciept_Id=51348
AND Item_ID = 22
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a76ad80d0d50514dc9b495225fa3561ab7d0da84
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51348
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51348
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: df35971e0237d08d3e4a8a3d19a7dbe7100423f9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51601
AND Item_ID = 29)
WHERE Reciept_Id=51601
AND Item_ID = 29
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: df35971e0237d08d3e4a8a3d19a7dbe7100423f9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51601
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51601
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92fa74ba2541f7ea52f2ff7a66312b1d876d059c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52465
AND Item_ID = 7)
WHERE Reciept_Id=52465
AND Item_ID = 7
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 92fa74ba2541f7ea52f2ff7a66312b1d876d059c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52465
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52465
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c28b0ceb2f779fd2f1d464c8d4f8028e38988c66
UPDATE Assignment1Data 
SET [Item_Quantity]=6
WHERE Reciept_Id=50366
AND Item_ID = 4
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c28b0ceb2f779fd2f1d464c8d4f8028e38988c66
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50366
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50366
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f3774faf6aa335fe0e811901dcd72e0809588dfc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51611
AND Item_ID = 2)
WHERE Reciept_Id=51611
AND Item_ID = 2
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f3774faf6aa335fe0e811901dcd72e0809588dfc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51611
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51611
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24b4c610ff5efa708b69be62c2164b638134552e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51629
AND Item_ID = 16)
WHERE Reciept_Id=51629
AND Item_ID = 16
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24b4c610ff5efa708b69be62c2164b638134552e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51629
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51629
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 249918424d1aacb30f0025a0b2bbdd59f56cdebe
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51888
AND Item_ID = 28)
WHERE Reciept_Id=51888
AND Item_ID = 28
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 249918424d1aacb30f0025a0b2bbdd59f56cdebe
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51888
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51888
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9587be8da1b2216ef9a5128b0be864cfaa658630
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52165
AND Item_ID = 13)
WHERE Reciept_Id=52165
AND Item_ID = 13
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9587be8da1b2216ef9a5128b0be864cfaa658630
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52165
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52165
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 160d700dfb7401b86ec210d1228c6d1ee77d6c2c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51301
AND Item_ID = 2)
WHERE Reciept_Id=51301
AND Item_ID = 2
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 160d700dfb7401b86ec210d1228c6d1ee77d6c2c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51301
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51301
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d58e8eeab4aecfb508eed44fd02dd49807aa0c8c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51139
AND Item_ID = 11)
WHERE Reciept_Id=51139
AND Item_ID = 11
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d58e8eeab4aecfb508eed44fd02dd49807aa0c8c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51139
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51139
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e43063a33b9f97b24eadb9aa4575b6ca368b3ddc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51213
AND Item_ID = 10)
WHERE Reciept_Id=51213
AND Item_ID = 10
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e43063a33b9f97b24eadb9aa4575b6ca368b3ddc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51213
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51213
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d757936e2b8f54375d7ef28c10911abf3dd46a45
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51213
AND Item_ID = 14)
WHERE Reciept_Id=51213
AND Item_ID = 14
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d757936e2b8f54375d7ef28c10911abf3dd46a45
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51213
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51213
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 202328f52d136f649d8d61404723c1fea6ee0948
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50814
AND Item_ID = 4)
WHERE Reciept_Id=50814
AND Item_ID = 4
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 202328f52d136f649d8d61404723c1fea6ee0948
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50814
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50814
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b1d66150e41c25cee0dc7a5f840f1ad749d499b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51387
AND Item_ID = 2)
WHERE Reciept_Id=51387
AND Item_ID = 2
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1b1d66150e41c25cee0dc7a5f840f1ad749d499b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51387
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51387
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c991b2e2f09dba7cd0693dc2aea2cfffff417f7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51512
AND Item_ID = 12)
WHERE Reciept_Id=51512
AND Item_ID = 12
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2c991b2e2f09dba7cd0693dc2aea2cfffff417f7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51512
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51512
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be6645e1f3436f9eb342e505f460f192ac917434
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=51889
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be6645e1f3436f9eb342e505f460f192ac917434
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51889
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51889
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec0c2540e25b0d96eb6ef86aa0e159033a71aea3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51104
AND Item_ID = 5)
WHERE Reciept_Id=51104
AND Item_ID = 5
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ec0c2540e25b0d96eb6ef86aa0e159033a71aea3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51104
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51104
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b7154d70cbbc0c7f733bac0c6b4cbf6c66176b2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51104
AND Item_ID = 23)
WHERE Reciept_Id=51104
AND Item_ID = 23
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b7154d70cbbc0c7f733bac0c6b4cbf6c66176b2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51104
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51104
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 117ee1ee522c4cec30671241bc08e18a80f968d9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52295
AND Item_ID = 27)
WHERE Reciept_Id=52295
AND Item_ID = 27
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 117ee1ee522c4cec30671241bc08e18a80f968d9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52295
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52295
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 601bf11c54f2ee31ac41cd365131ac59b208faf0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50795
AND Item_ID = 8)
WHERE Reciept_Id=50795
AND Item_ID = 8
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 601bf11c54f2ee31ac41cd365131ac59b208faf0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50795
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50795
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19ead5b0dce65f895664339adbf8a9ee4e586b3b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50795
AND Item_ID = 29)
WHERE Reciept_Id=50795
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 19ead5b0dce65f895664339adbf8a9ee4e586b3b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50795
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50795
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 456d60447f8c1271547739c9378809470db933b3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51145
AND Item_ID = 2)
WHERE Reciept_Id=51145
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 456d60447f8c1271547739c9378809470db933b3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51145
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51145
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8a53c77b4cfb19e8a0788b63bea7c3d6167210b4
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52461
AND Item_ID = 22)
WHERE Reciept_Id=52461
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8a53c77b4cfb19e8a0788b63bea7c3d6167210b4
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52461
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52461
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 456b9cf64629de8f34d708d583be56433f433338
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52461
AND Item_ID = 4)
WHERE Reciept_Id=52461
AND Item_ID = 4
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 456b9cf64629de8f34d708d583be56433f433338
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52461
AND Item_ID = 4
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52461
    AND Item_ID = 4
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9419d5900793f27afd6900b92e9e61749804264
UPDATE Assignment1Data 
SET [Item_Quantity]=10
WHERE Reciept_Id=50126
AND Item_ID = 26
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9419d5900793f27afd6900b92e9e61749804264
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50126
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50126
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 903b967965e2926e17f5826cbd0a48f6401f7fdc
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50174
AND Item_ID = 16)
WHERE Reciept_Id=50174
AND Item_ID = 16
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 903b967965e2926e17f5826cbd0a48f6401f7fdc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50174
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50174
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 305063c9a15c66ff5b14d8b19079c08e0ea7c243
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51308
AND Item_ID = 10)
WHERE Reciept_Id=51308
AND Item_ID = 10
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 305063c9a15c66ff5b14d8b19079c08e0ea7c243
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51308
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51308
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cacd1a8b987af6609da156f29cacd3309241091d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51308
AND Item_ID = 7)
WHERE Reciept_Id=51308
AND Item_ID = 7
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cacd1a8b987af6609da156f29cacd3309241091d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51308
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51308
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f2dd8564654cbcfb8ed9e275da7313597bb74ba
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50531
AND Item_ID = 18)
WHERE Reciept_Id=50531
AND Item_ID = 18
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f2dd8564654cbcfb8ed9e275da7313597bb74ba
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50531
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50531
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b14b9ee345a31ae53aa19659e1fbdec1dbaf0556
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50531
AND Item_ID = 30)
WHERE Reciept_Id=50531
AND Item_ID = 30
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b14b9ee345a31ae53aa19659e1fbdec1dbaf0556
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50531
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50531
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a3a76fe7b713485fb416a31f9bcb63c8deca516a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50531
AND Item_ID = 1)
WHERE Reciept_Id=50531
AND Item_ID = 1
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a3a76fe7b713485fb416a31f9bcb63c8deca516a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50531
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50531
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dbf5b3cf84cca3da6d54eafe6622f74f48a874a2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51159
AND Item_ID = 16)
WHERE Reciept_Id=51159
AND Item_ID = 16
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dbf5b3cf84cca3da6d54eafe6622f74f48a874a2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51159
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51159
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2fa04bcbcfd7017fdf068f6d70b804600ba65cb9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51159
AND Item_ID = 23)
WHERE Reciept_Id=51159
AND Item_ID = 23
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2fa04bcbcfd7017fdf068f6d70b804600ba65cb9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51159
AND Item_ID = 23
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51159
    AND Item_ID = 23
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fe95ce6ddcf4d59c629c1720aafe4e6f35feeba3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50163
AND Item_ID = 3)
WHERE Reciept_Id=50163
AND Item_ID = 3
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fe95ce6ddcf4d59c629c1720aafe4e6f35feeba3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50163
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50163
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 95d0d2027bef250fe73df1e1cd106ad2cd9da362
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51619
AND Item_ID = 14)
WHERE Reciept_Id=51619
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 95d0d2027bef250fe73df1e1cd106ad2cd9da362
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51619
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51619
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b038bbc9e0d1a51f82a28c75ef997ca7ebd0d7b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51714
AND Item_ID = 24)
WHERE Reciept_Id=51714
AND Item_ID = 24
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b038bbc9e0d1a51f82a28c75ef997ca7ebd0d7b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51714
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51714
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 39c2b890154f0f9570202627c6d6516305a66469
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50745
AND Item_ID = 18)
WHERE Reciept_Id=50745
AND Item_ID = 18
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 39c2b890154f0f9570202627c6d6516305a66469
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50745
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50745
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e408bb9db07d27cf177532c087d90793149e2823
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50745
AND Item_ID = 10)
WHERE Reciept_Id=50745
AND Item_ID = 10
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e408bb9db07d27cf177532c087d90793149e2823
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50745
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50745
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1519a56675a8671311083d889d5d3b138f50e975
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51371
AND Item_ID = 22)
WHERE Reciept_Id=51371
AND Item_ID = 22
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1519a56675a8671311083d889d5d3b138f50e975
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51371
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51371
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8063f07b071b945aad250d7cad054bead30ddc1c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52074
AND Item_ID = 10)
WHERE Reciept_Id=52074
AND Item_ID = 10
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8063f07b071b945aad250d7cad054bead30ddc1c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52074
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52074
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 179144e78852ccb8d3e535d63f9da0c90d73cc47
UPDATE Assignment1Data 
SET [Item_Quantity]=20
WHERE Reciept_Id=52074
AND Item_ID = 9
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 179144e78852ccb8d3e535d63f9da0c90d73cc47
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52074
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52074
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1db27941a47ebf950412edda45f30745a5d3525c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51548
AND Item_ID = 30)
WHERE Reciept_Id=51548
AND Item_ID = 30
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1db27941a47ebf950412edda45f30745a5d3525c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51548
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51548
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da08dce99899e44d045122dfef3a2568c578fd92
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52494
AND Item_ID = 15)
WHERE Reciept_Id=52494
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: da08dce99899e44d045122dfef3a2568c578fd92
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52494
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52494
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9258e79f5c14fa3c5517fc0607fc26650aed7c48
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52494
AND Item_ID = 18)
WHERE Reciept_Id=52494
AND Item_ID = 18
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9258e79f5c14fa3c5517fc0607fc26650aed7c48
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52494
AND Item_ID = 18
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52494
    AND Item_ID = 18
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3e9d6a60158bfea6b8855a2e0ea569973d676bf5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50545
AND Item_ID = 25)
WHERE Reciept_Id=50545
AND Item_ID = 25
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 3e9d6a60158bfea6b8855a2e0ea569973d676bf5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50545
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50545
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d8b71e0fd4925332f00f08e3b63d4dd53c395ba2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52443
AND Item_ID = 2)
WHERE Reciept_Id=52443
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d8b71e0fd4925332f00f08e3b63d4dd53c395ba2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52443
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52443
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fbe7cad475548311a6f07218df3dd574bdfa69fd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50127
AND Item_ID = 13)
WHERE Reciept_Id=50127
AND Item_ID = 13
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fbe7cad475548311a6f07218df3dd574bdfa69fd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50127
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50127
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 746831ceac8eeda4ebf04449b655a2da13da5c5f
UPDATE Assignment1Data 
SET [Item_Quantity]=8
WHERE Reciept_Id=50436
AND Item_ID = 12
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 746831ceac8eeda4ebf04449b655a2da13da5c5f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50436
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50436
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c04bb25be9fafee7144e74fbaccddfab93843e0c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51808
AND Item_ID = 7)
WHERE Reciept_Id=51808
AND Item_ID = 7
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c04bb25be9fafee7144e74fbaccddfab93843e0c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51808
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51808
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7994310f680b7359b1d5bd58af4b79f82d73f091
UPDATE Assignment1Data 
SET [Item_Quantity]=2
WHERE Reciept_Id=51867
AND Item_ID = 26
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 7994310f680b7359b1d5bd58af4b79f82d73f091
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51867
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51867
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d4fd7807f6211db3d54102b776328843293cef8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50534
AND Item_ID = 6)
WHERE Reciept_Id=50534
AND Item_ID = 6
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6d4fd7807f6211db3d54102b776328843293cef8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50534
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50534
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d3f14d1609d4f857ed637e23f616bf57c6fdf8d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50534
AND Item_ID = 30)
WHERE Reciept_Id=50534
AND Item_ID = 30
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d3f14d1609d4f857ed637e23f616bf57c6fdf8d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50534
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50534
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 808eff0a82cbabec2bdbd3f4a36bef12b04a0a80
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50480
AND Item_ID = 8)
WHERE Reciept_Id=50480
AND Item_ID = 8
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 808eff0a82cbabec2bdbd3f4a36bef12b04a0a80
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50480
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50480
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64e1de8f50f48cf755d788aba3e8b2fe11d01b70
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51279
AND Item_ID = 21)
WHERE Reciept_Id=51279
AND Item_ID = 21
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 64e1de8f50f48cf755d788aba3e8b2fe11d01b70
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51279
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51279
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dec38b99af31e60e98460006dc65883ee716e108
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52001
AND Item_ID = 9)
WHERE Reciept_Id=52001
AND Item_ID = 9
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dec38b99af31e60e98460006dc65883ee716e108
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52001
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52001
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d4171509d510ed382a0c4be4ab790262228cbec
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50981
AND Item_ID = 13)
WHERE Reciept_Id=50981
AND Item_ID = 13
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d4171509d510ed382a0c4be4ab790262228cbec
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50981
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50981
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74409c4ac833129b6283e8083fe99fce2a52f51a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50981
AND Item_ID = 6)
WHERE Reciept_Id=50981
AND Item_ID = 6
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 74409c4ac833129b6283e8083fe99fce2a52f51a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50981
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50981
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 481c6b550cc000cf680568b4169658f05c6ae883
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51614
AND Item_ID = 3)
WHERE Reciept_Id=51614
AND Item_ID = 3
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 481c6b550cc000cf680568b4169658f05c6ae883
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51614
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51614
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75ef81d0fbda217c7f87f2ff4ab8d1fc14caf679
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51311
AND Item_ID = 22)
WHERE Reciept_Id=51311
AND Item_ID = 22
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75ef81d0fbda217c7f87f2ff4ab8d1fc14caf679
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51311
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51311
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a0e5dd704a7e65876dfa02b2e40e81eb79073ca5
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51311
AND Item_ID = 13)
WHERE Reciept_Id=51311
AND Item_ID = 13
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a0e5dd704a7e65876dfa02b2e40e81eb79073ca5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51311
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51311
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 891591467c627efc09f2165b44d683481be14fd7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50439
AND Item_ID = 17)
WHERE Reciept_Id=50439
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 891591467c627efc09f2165b44d683481be14fd7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50439
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50439
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e138d263e5dddcb61a7e6f0d077046dff932f61f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51586
AND Item_ID = 25)
WHERE Reciept_Id=51586
AND Item_ID = 25
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e138d263e5dddcb61a7e6f0d077046dff932f61f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51586
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51586
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 53db1edbf543703cfff19948e327e9de4decf654
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51632
AND Item_ID = 13)
WHERE Reciept_Id=51632
AND Item_ID = 13
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 53db1edbf543703cfff19948e327e9de4decf654
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51632
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51632
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 185d29198822d356c489c42fecda8508269331fd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51786
AND Item_ID = 30)
WHERE Reciept_Id=51786
AND Item_ID = 30
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 185d29198822d356c489c42fecda8508269331fd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51786
AND Item_ID = 30
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51786
    AND Item_ID = 30
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e920184ef98b0b287a22eb211480523ad89f37a
UPDATE Assignment1Data 
SET [Item_Quantity]=18
WHERE Reciept_Id=51640
AND Item_ID = 19
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8e920184ef98b0b287a22eb211480523ad89f37a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51640
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51640
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f3b6bb39dc7354ec3ee168f50ed53e77b1dd7f7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51834
AND Item_ID = 24)
WHERE Reciept_Id=51834
AND Item_ID = 24
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f3b6bb39dc7354ec3ee168f50ed53e77b1dd7f7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51834
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51834
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f6d1c2b4f3f464512b31848a01197f8c621b4ad3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50537
AND Item_ID = 24)
WHERE Reciept_Id=50537
AND Item_ID = 24
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f6d1c2b4f3f464512b31848a01197f8c621b4ad3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50537
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50537
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: de07b654b3165a5dcc51adbd26a61e48d5cc9b1f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51792
AND Item_ID = 10)
WHERE Reciept_Id=51792
AND Item_ID = 10
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: de07b654b3165a5dcc51adbd26a61e48d5cc9b1f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51792
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51792
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07696e934bea09e35a650c9285de1071588be710
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52008
AND Item_ID = 2)
WHERE Reciept_Id=52008
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 07696e934bea09e35a650c9285de1071588be710
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52008
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52008
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 90d57614d456cb82be2ad097df71ff8fcbe916e2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52101
AND Item_ID = 19)
WHERE Reciept_Id=52101
AND Item_ID = 19
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 90d57614d456cb82be2ad097df71ff8fcbe916e2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52101
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52101
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9fbd7379268d669dc0b25db13f83e2c5c89f17a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52101
AND Item_ID = 16)
WHERE Reciept_Id=52101
AND Item_ID = 16
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9fbd7379268d669dc0b25db13f83e2c5c89f17a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52101
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52101
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5b1023d7f70369b3c147039b98c0148446fe1e31
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52129
AND Item_ID = 22)
WHERE Reciept_Id=52129
AND Item_ID = 22
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5b1023d7f70369b3c147039b98c0148446fe1e31
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52129
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52129
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e8ceed78640a7781b58e0e4277a7b04f60d208af
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51033
AND Item_ID = 2)
WHERE Reciept_Id=51033
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e8ceed78640a7781b58e0e4277a7b04f60d208af
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51033
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51033
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae0f3c835ea0d64458468df9e6b74a98499a1c8e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51349
AND Item_ID = 1)
WHERE Reciept_Id=51349
AND Item_ID = 1
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ae0f3c835ea0d64458468df9e6b74a98499a1c8e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51349
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51349
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e8b81e24fd01c6f37d594c1dd715a5a02baab883
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51877
AND Item_ID = 7)
WHERE Reciept_Id=51877
AND Item_ID = 7
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e8b81e24fd01c6f37d594c1dd715a5a02baab883
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51877
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51877
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 03ad589e0054425b324b30a493f43f79f790d6ca
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52423
AND Item_ID = 20)
WHERE Reciept_Id=52423
AND Item_ID = 20
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 03ad589e0054425b324b30a493f43f79f790d6ca
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52423
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52423
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e8012b96729f11d8350df5862b4f2e8d64a4bbf5
UPDATE Assignment1Data 
SET [Item_Quantity]=18
WHERE Reciept_Id=50651
AND Item_ID = 22
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e8012b96729f11d8350df5862b4f2e8d64a4bbf5
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50651
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50651
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cd6084f055d5b09da13e7937d639c04fbe9305cf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50682
AND Item_ID = 11)
WHERE Reciept_Id=50682
AND Item_ID = 11
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cd6084f055d5b09da13e7937d639c04fbe9305cf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50682
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50682
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 52f885c6aed4ac31c3f08777e36bb157e8853eb3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50948
AND Item_ID = 15)
WHERE Reciept_Id=50948
AND Item_ID = 15
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 52f885c6aed4ac31c3f08777e36bb157e8853eb3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50948
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50948
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0ac635bd5cf066c0930b712d05b1a8624706d575
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51252
AND Item_ID = 28)
WHERE Reciept_Id=51252
AND Item_ID = 28
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0ac635bd5cf066c0930b712d05b1a8624706d575
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51252
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51252
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b121017012ffac5a344e2558fec64cac7d742365
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51557
AND Item_ID = 28)
WHERE Reciept_Id=51557
AND Item_ID = 28
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b121017012ffac5a344e2558fec64cac7d742365
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51557
AND Item_ID = 28
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51557
    AND Item_ID = 28
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18effa6eb68c7d5f89b3c04149c7898fc7074d64
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51665
AND Item_ID = 26)
WHERE Reciept_Id=51665
AND Item_ID = 26
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 18effa6eb68c7d5f89b3c04149c7898fc7074d64
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51665
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51665
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9f30cfe6d1632fd7c1d93176e1b6a92bf3ca5cd
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51665
AND Item_ID = 3)
WHERE Reciept_Id=51665
AND Item_ID = 3
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b9f30cfe6d1632fd7c1d93176e1b6a92bf3ca5cd
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51665
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51665
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cfcc64efb1952e22e7d4e106ca282f03bb0f1eba
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51062
AND Item_ID = 11)
WHERE Reciept_Id=51062
AND Item_ID = 11
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: cfcc64efb1952e22e7d4e106ca282f03bb0f1eba
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51062
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51062
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bc9395c2c3112296a756586a3b7cfbe198e5bb75
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51654
AND Item_ID = 19)
WHERE Reciept_Id=51654
AND Item_ID = 19
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bc9395c2c3112296a756586a3b7cfbe198e5bb75
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51654
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51654
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16782e1e2d2b9d2c30b128d5815a198f0891d8ac
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51654
AND Item_ID = 3)
WHERE Reciept_Id=51654
AND Item_ID = 3
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 16782e1e2d2b9d2c30b128d5815a198f0891d8ac
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51654
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51654
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a82b439ad0f1ff463ed3b18296231a1d90ed5a95
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51772
AND Item_ID = 15)
WHERE Reciept_Id=51772
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a82b439ad0f1ff463ed3b18296231a1d90ed5a95
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51772
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51772
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 09007d6774f1cfb06f186dfd88458d3fdf8bbfaf
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51866
AND Item_ID = 27)
WHERE Reciept_Id=51866
AND Item_ID = 27
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 09007d6774f1cfb06f186dfd88458d3fdf8bbfaf
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51866
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51866
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b5308144efc8168da08d24cd080d41b543ec4ba
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50052
AND Item_ID = 21)
WHERE Reciept_Id=50052
AND Item_ID = 21
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8b5308144efc8168da08d24cd080d41b543ec4ba
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50052
AND Item_ID = 21
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50052
    AND Item_ID = 21
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2fb6c3288246f5485ef00c2f8a7f230028292f84
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52085
AND Item_ID = 2)
WHERE Reciept_Id=52085
AND Item_ID = 2
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2fb6c3288246f5485ef00c2f8a7f230028292f84
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52085
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52085
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dd759b5bb5c0a2fbe5b64dd3ab62f11177d96156
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50564
AND Item_ID = 15)
WHERE Reciept_Id=50564
AND Item_ID = 15
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: dd759b5bb5c0a2fbe5b64dd3ab62f11177d96156
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50564
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50564
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 650d58d6cd85cf906965a31ce26817543b67784a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50271
AND Item_ID = 16)
WHERE Reciept_Id=50271
AND Item_ID = 16
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 650d58d6cd85cf906965a31ce26817543b67784a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50271
AND Item_ID = 16
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50271
    AND Item_ID = 16
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b90ce13227b74f2764876672d2b3a58cca8f303d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50271
AND Item_ID = 10)
WHERE Reciept_Id=50271
AND Item_ID = 10
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: b90ce13227b74f2764876672d2b3a58cca8f303d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50271
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50271
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4ac00dd6450e0e662cf7ed9304d661c52f80896
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50376
AND Item_ID = 10)
WHERE Reciept_Id=50376
AND Item_ID = 10
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e4ac00dd6450e0e662cf7ed9304d661c52f80896
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50376
AND Item_ID = 10
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50376
    AND Item_ID = 10
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3718edd12d889151adee7ef2c84df3872fbe7d0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50446
AND Item_ID = 20)
WHERE Reciept_Id=50446
AND Item_ID = 20
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c3718edd12d889151adee7ef2c84df3872fbe7d0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50446
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50446
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d9ef8626309ba8a81a59cd69e159580db1dfc20
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50748
AND Item_ID = 25)
WHERE Reciept_Id=50748
AND Item_ID = 25
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d9ef8626309ba8a81a59cd69e159580db1dfc20
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50748
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50748
    AND Item_ID = 25
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f5cf5823e4b7797ed972e9e90469418b2affaa8
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51473
AND Item_ID = 17)
WHERE Reciept_Id=51473
AND Item_ID = 17
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6f5cf5823e4b7797ed972e9e90469418b2affaa8
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51473
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51473
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d4cec33e39d8a3a13d2d568a60307500e8d1a3d
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52333
AND Item_ID = 9)
WHERE Reciept_Id=52333
AND Item_ID = 9
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5d4cec33e39d8a3a13d2d568a60307500e8d1a3d
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52333
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52333
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abdf47cd3c643e7844e7dc07cfbe2af0cc5c5555
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50304
AND Item_ID = 15)
WHERE Reciept_Id=50304
AND Item_ID = 15
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: abdf47cd3c643e7844e7dc07cfbe2af0cc5c5555
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50304
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50304
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3ac8def198f3e3b31508b8c476254a95bdd5b77
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50935
AND Item_ID = 7)
WHERE Reciept_Id=50935
AND Item_ID = 7
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d3ac8def198f3e3b31508b8c476254a95bdd5b77
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50935
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50935
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aad9a36f6c3ac4565c1458bad89b948912e739c2
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52146
AND Item_ID = 29)
WHERE Reciept_Id=52146
AND Item_ID = 29
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: aad9a36f6c3ac4565c1458bad89b948912e739c2
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52146
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52146
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb8806379c1e240c19a103a486cc2dd3143d73e7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52146
AND Item_ID = 9)
WHERE Reciept_Id=52146
AND Item_ID = 9
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fb8806379c1e240c19a103a486cc2dd3143d73e7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52146
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52146
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a53748f3b41c6adc491a277343e190a5bd717e79
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50165
AND Item_ID = 15)
WHERE Reciept_Id=50165
AND Item_ID = 15
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a53748f3b41c6adc491a277343e190a5bd717e79
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50165
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50165
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c15783e1a279009dc57e0f796a8695b3761afbb0
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50533
AND Item_ID = 15)
WHERE Reciept_Id=50533
AND Item_ID = 15
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: c15783e1a279009dc57e0f796a8695b3761afbb0
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50533
AND Item_ID = 15
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50533
    AND Item_ID = 15
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 855f5c58fb69455afaf2125172e85353cfcaed9c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51318
AND Item_ID = 11)
WHERE Reciept_Id=51318
AND Item_ID = 11
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 855f5c58fb69455afaf2125172e85353cfcaed9c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51318
AND Item_ID = 11
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51318
    AND Item_ID = 11
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d2f8726954cabe498515a710c1839a553b7b8b9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51475
AND Item_ID = 5)
WHERE Reciept_Id=51475
AND Item_ID = 5
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d2f8726954cabe498515a710c1839a553b7b8b9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51475
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51475
    AND Item_ID = 5
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f5094bc639de900734ec819570b1ec2ac7663e9
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50507
AND Item_ID = 2)
WHERE Reciept_Id=50507
AND Item_ID = 2
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f5094bc639de900734ec819570b1ec2ac7663e9
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50507
AND Item_ID = 2
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50507
    AND Item_ID = 2
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 087b33f0de9e1fd4d2190225a93ee81dcad4f9eb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50838
AND Item_ID = 9)
WHERE Reciept_Id=50838
AND Item_ID = 9
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 087b33f0de9e1fd4d2190225a93ee81dcad4f9eb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50838
AND Item_ID = 9
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50838
    AND Item_ID = 9
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 410e8def956c6e969ed2d2bcbe78164b76c60c68
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51089
AND Item_ID = 13)
WHERE Reciept_Id=51089
AND Item_ID = 13
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 410e8def956c6e969ed2d2bcbe78164b76c60c68
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51089
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51089
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a430f7f68deacb9f0892f473714f6b2d1c2fc747
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51089
AND Item_ID = 1)
WHERE Reciept_Id=51089
AND Item_ID = 1
AND Item_Quantity = 2
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a430f7f68deacb9f0892f473714f6b2d1c2fc747
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51089
AND Item_ID = 1
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51089
    AND Item_ID = 1
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: daa14e5e5704ce7dae0dbcf73325dfcd9e62767b
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51496
AND Item_ID = 22)
WHERE Reciept_Id=51496
AND Item_ID = 22
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: daa14e5e5704ce7dae0dbcf73325dfcd9e62767b
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51496
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51496
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b242d3a4b9131fed4fdc784b9dd3b26b237a9c6
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52378
AND Item_ID = 3)
WHERE Reciept_Id=52378
AND Item_ID = 3
AND Item_Quantity = 10
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 0b242d3a4b9131fed4fdc784b9dd3b26b237a9c6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52378
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52378
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd2b565db3e8e3f353aeb755eb38d30e2940eab7
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52378
AND Item_ID = 20)
WHERE Reciept_Id=52378
AND Item_ID = 20
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd2b565db3e8e3f353aeb755eb38d30e2940eab7
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52378
AND Item_ID = 20
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52378
    AND Item_ID = 20
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a8d39dc4d44441f8a7ca835d46a8b3da3e6d251
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52378
AND Item_ID = 26)
WHERE Reciept_Id=52378
AND Item_ID = 26
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2a8d39dc4d44441f8a7ca835d46a8b3da3e6d251
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52378
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52378
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f053603640f606631631db5c5c6eba2aeed8d1a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50868
AND Item_ID = 7)
WHERE Reciept_Id=50868
AND Item_ID = 7
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 5f053603640f606631631db5c5c6eba2aeed8d1a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50868
AND Item_ID = 7
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50868
    AND Item_ID = 7
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be4cdec87b61f2fb6a25e325b6f9678689b6bc26
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50868
AND Item_ID = 26)
WHERE Reciept_Id=50868
AND Item_ID = 26
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: be4cdec87b61f2fb6a25e325b6f9678689b6bc26
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50868
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50868
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24665ee617e6c440adecad7f462f87783d0b9b7c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50222
AND Item_ID = 3)
WHERE Reciept_Id=50222
AND Item_ID = 3
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 24665ee617e6c440adecad7f462f87783d0b9b7c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50222
AND Item_ID = 3
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50222
    AND Item_ID = 3
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d2435912fe8050ef3a6bc3a8c0da7c43fb3f233
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51194
AND Item_ID = 19)
WHERE Reciept_Id=51194
AND Item_ID = 19
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 2d2435912fe8050ef3a6bc3a8c0da7c43fb3f233
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51194
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51194
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8634038c35d1549516ea71658096ccc58b1fa203
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52315
AND Item_ID = 27)
WHERE Reciept_Id=52315
AND Item_ID = 27
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8634038c35d1549516ea71658096ccc58b1fa203
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52315
AND Item_ID = 27
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52315
    AND Item_ID = 27
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e7ca94e26b607a0b0d9f1cff2698eab41dc6c974
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52394
AND Item_ID = 14)
WHERE Reciept_Id=52394
AND Item_ID = 14
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: e7ca94e26b607a0b0d9f1cff2698eab41dc6c974
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52394
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52394
    AND Item_ID = 14
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d093f0e622f566ccd1b372209eb7fb099077dcf6
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=51052
AND Item_ID = 26
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: d093f0e622f566ccd1b372209eb7fb099077dcf6
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51052
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51052
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd68e28f02fa436b8b36b86948d9e45fd6829f5a
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51754
AND Item_ID = 29)
WHERE Reciept_Id=51754
AND Item_ID = 29
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: bd68e28f02fa436b8b36b86948d9e45fd6829f5a
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51754
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51754
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 09103e3238aaa43afbe1a3e00e409b68c403bcec
UPDATE Assignment1Data 
SET [Item_Quantity]=16
WHERE Reciept_Id=51045
AND Item_ID = 19
AND Item_Quantity = 8
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 09103e3238aaa43afbe1a3e00e409b68c403bcec
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51045
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51045
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fcd0367dce202a5b17f0c29bcdaac3c9a31d7b1e
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52198
AND Item_ID = 24)
WHERE Reciept_Id=52198
AND Item_ID = 24
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fcd0367dce202a5b17f0c29bcdaac3c9a31d7b1e
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52198
AND Item_ID = 24
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52198
    AND Item_ID = 24
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 76ea44424d29d66d747c6b2de8d560c9ecac2e52
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51126
AND Item_ID = 12)
WHERE Reciept_Id=51126
AND Item_ID = 12
AND Item_Quantity = 1
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 76ea44424d29d66d747c6b2de8d560c9ecac2e52
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51126
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51126
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75a0cf9ea671974fcc9632aeec424eb64c6084fc
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=50625
AND Item_ID = 8
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 75a0cf9ea671974fcc9632aeec424eb64c6084fc
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50625
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50625
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f3683a3517828d9690cff9ac483f9d8c98b09eb
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50625
AND Item_ID = 26)
WHERE Reciept_Id=50625
AND Item_ID = 26
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 8f3683a3517828d9690cff9ac483f9d8c98b09eb
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50625
AND Item_ID = 26
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50625
    AND Item_ID = 26
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6e8198482413b42ed2d911ca7a18dc0173553950
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50730
AND Item_ID = 19)
WHERE Reciept_Id=50730
AND Item_ID = 19
AND Item_Quantity = 6
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6e8198482413b42ed2d911ca7a18dc0173553950
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50730
AND Item_ID = 19
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50730
    AND Item_ID = 19
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0ce40e62c6be8239fa4224f044529cb54baad59
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51240
AND Item_ID = 17)
WHERE Reciept_Id=51240
AND Item_ID = 17
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: f0ce40e62c6be8239fa4224f044529cb54baad59
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51240
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51240
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6aae5aebcc0657e3a85337adc00998d55f4da43f
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51677
AND Item_ID = 22)
WHERE Reciept_Id=51677
AND Item_ID = 22
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 6aae5aebcc0657e3a85337adc00998d55f4da43f
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51677
AND Item_ID = 22
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51677
    AND Item_ID = 22
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ce4a06e978349aeec97b693ec6968ce77b2b573
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50329
AND Item_ID = 13)
WHERE Reciept_Id=50329
AND Item_ID = 13
AND Item_Quantity = 5
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9ce4a06e978349aeec97b693ec6968ce77b2b573
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50329
AND Item_ID = 13
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50329
    AND Item_ID = 13
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a05a77a919b6161df654b8de8e08120e0139df74
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50329
AND Item_ID = 8)
WHERE Reciept_Id=50329
AND Item_ID = 8
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: a05a77a919b6161df654b8de8e08120e0139df74
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50329
AND Item_ID = 8
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50329
    AND Item_ID = 8
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1661cb582d57ffa588c8048befec08211aa76f5c
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=50519
AND Item_ID = 12)
WHERE Reciept_Id=50519
AND Item_ID = 12
AND Item_Quantity = 3
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 1661cb582d57ffa588c8048befec08211aa76f5c
DELETE FROM Assignment1Data 
WHERE Reciept_Id=50519
AND Item_ID = 12
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=50519
    AND Item_ID = 12
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 69b40fb899a8c871aff76094c3215263fa1001b3
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51237
AND Item_ID = 17)
WHERE Reciept_Id=51237
AND Item_ID = 17
AND Item_Quantity = 9
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 69b40fb899a8c871aff76094c3215263fa1001b3
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51237
AND Item_ID = 17
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51237
    AND Item_ID = 17
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad9177731ddc435319d1eca76d4c6ee006bc2765
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=51237
AND Item_ID = 29)
WHERE Reciept_Id=51237
AND Item_ID = 29
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: ad9177731ddc435319d1eca76d4c6ee006bc2765
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51237
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51237
    AND Item_ID = 29
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fe35e385d227afd63a09fec0b962623922be6535
UPDATE Assignment1Data 
SET [Item_Quantity]=14
WHERE Reciept_Id=51018
AND Item_ID = 6
AND Item_Quantity = 7
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: fe35e385d227afd63a09fec0b962623922be6535
DELETE FROM Assignment1Data 
WHERE Reciept_Id=51018
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=51018
    AND Item_ID = 6
)
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f4053e2f54a857e3cd20fcda857a0d79c45e223
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52135
AND Item_ID = 29)
WHERE Reciept_Id=52135
AND Item_ID = 29
AND Item_Quantity = 4
GO

-- Auto-generated query to fix error of type: Item.Id Duplicate
-- Resolved error identified by UUID: 9f4053e2f54a857e3cd20fcda857a0d79c45e223
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52135
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52135
    AND Item_ID = 29
)
GO
USE EBUS3030;


-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: dcf16fba08c63ecc85556c385204d9524ec359cf
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52136
AND Customer_Id = 'C13' AND Staff_Id = 'S4'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 7d3e70ee6ef8209d1db122d4fceb373e47aa1f8d
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52137
AND Customer_Id = 'C27' AND Staff_Id = 'S4'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 70e3e1589ab2bc49dc3f9304989f0287dce4d6f4
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52138
AND Customer_Id = 'C29' AND Staff_Id = 'S13'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 82ad9513d5ecca56781792616c984ec9c8be5ea6
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52139
AND Customer_Id = 'C31' AND Staff_Id = 'S20'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: ed4f4ad220daefe924c57a5a1d2db32c8f85632d
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52140
AND Customer_Id = 'C38' AND Staff_Id = 'S4'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 6adb3e46388368db3dd98d5f2557ed6a7947b39a
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52141
AND Customer_Id = 'C42' AND Staff_Id = 'S7'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 42c42e141d1c95ccaaf09b48e51706584f0c494b
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52142
AND Customer_Id = 'C46' AND Staff_Id = 'S8'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 4b9b1f1978a7bf4e6b2b0b2867b94c499c74b18b
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52143
AND Customer_Id = 'C8' AND Staff_Id = 'S13'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 69ce62117281095107a047d92a64b60142f131e8
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52144
AND Customer_Id = 'C11' AND Staff_Id = 'S10'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 1bf57bb861bae16e944a60cd2639377ab03c057a
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52145
AND Customer_Id = 'C21' AND Staff_Id = 'S8'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: ff56d8aa2e22e4811b22bd702cc7f65b627f778d
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52146
AND Customer_Id = 'C38' AND Staff_Id = 'S5'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 8fa388245a23b7634caad69666133819a485eda3
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52147
AND Customer_Id = 'C40' AND Staff_Id = 'S18'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: ac84576ce7fc2d4a07b0824bad51491c3ab9756b
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52148
AND Customer_Id = 'C43' AND Staff_Id = 'S16'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: b0465a950d1d6b84198a16f393203fd25056328a
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52149
AND Customer_Id = 'C45' AND Staff_Id = 'S11'
GO

-- Auto-generated query to fix error of type: Staff.Id Mismatch
-- Resolved error identified by UUID: 0cb8d75116359eef2823ef5ffd47d8b2919a0d80
UPDATE Assignment1Data 
SET Reciept_Id=(
SELECT MAX(Reciept_Id)+1 
FROM Assignment1Data)
WHERE Reciept_Id=52150
AND Customer_Id = 'C57' AND Staff_Id = 'S7'
GO

-- ##########################################################################
-- ############################# MANUAL ENTRIES #############################
-- ##########################################################################

-- Manually written to resolve last of dirty entries.
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52501
AND Item_ID = 25)
WHERE Reciept_Id=52501
AND Item_ID = 25
AND Item_Quantity = 4
GO

-- Manually written to resolve last of dirty entries.
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52501
AND Item_ID = 25
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52501
    AND Item_ID = 25
)
GO

-- Manually written to resolve last of dirty entries.
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52506
AND Item_ID = 14)
WHERE Reciept_Id=52506
AND Item_ID = 14
AND Item_Quantity = 2
GO

-- Manually written to resolve last of dirty entries.
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52506
AND Item_ID = 14
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52506
    AND Item_ID = 14
)
GO

-- Manually written to resolve last of dirty entries.
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52506
AND Item_ID = 6)
WHERE Reciept_Id=52506
AND Item_ID = 6
AND Item_Quantity = 2
GO

-- Manually written to resolve last of dirty entries.
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52506
AND Item_ID = 6
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52506
    AND Item_ID = 6
)
GO

-- Manually written to resolve last of dirty entries.
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52509
AND Item_ID = 29)
WHERE Reciept_Id=52509
AND Item_ID = 29
AND Item_Quantity = 4
GO

-- Manually written to resolve last of dirty entries.
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52509
AND Item_ID = 29
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52509
    AND Item_ID = 29
)
GO

-- Manually written to resolve last of dirty entries.
UPDATE Assignment1Data 
SET [Item_Quantity]=(
SELECT SUM([Item_Quantity])
FROM Assignment1Data
WHERE Reciept_Id=52515
AND Item_ID = 5)
WHERE Reciept_Id=52515
AND Item_ID = 5
AND Item_Quantity = 9
GO

-- Manually written to resolve last of dirty entries.
DELETE FROM Assignment1Data 
WHERE Reciept_Id=52515
AND Item_ID = 5
AND Item_Quantity < (
    SELECT MAX([Item_Quantity])
    FROM Assignment1Data
    WHERE Reciept_Id=52515
    AND Item_ID = 5
)
GO

-- Create Receipt table from supplied data
INSERT INTO Receipt([ReceiptId], [ReceiptCustomerId],[ReceiptStaffId], [ReceiptDate])
SELECT DISTINCT([Reciept_Id]),[Customer_ID],[Staff_ID], [Sale_Date]
FROM [Assignment1Data]
ORDER BY [Reciept_Id]
GO

-- Insert into ReceiptItem from supplied data
INSERT INTO ReceiptItem([ReceiptId], [ItemId],[ReceiptItemQuantity],[PriceId])
SELECT DISTINCT([Reciept_Id]),[Item_ID],[Item_Quantity],[PriceId]
FROM [Assignment1Data],[Price]
WHERE [Price].[PriceId] = [Item_ID]
ORDER BY [Reciept_Id]
GO