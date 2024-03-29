USE [master]
GO
drop database UserManagement
go

CREATE DATABASE [UserManagement] 

USE [UserManagement]
GO
delete tblUsers  where 1=1
IF OBJECT_ID('OrderDetail', 'U') IS NOT NULL
   DROP TABLE OrderDetail

IF OBJECT_ID('Orders', 'U') IS NOT NULL
   DROP TABLE Orders

IF OBJECT_ID('Product', 'U') IS NOT NULL
   DROP TABLE Product

DROP TABLE tblProduct
DROP TABLE tblOrderDetail

CREATE TABLE [dbo].[tblUsers](

[userID] [nvarchar](50) NOT NULL,

[fullName] [nvarchar](50) NULL,

[password] [nvarchar](50) NULL,

[roleID] [nvarchar](50) NULL,

[status] [bit] NULL,

CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED

(

[userID] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY]
GO

CREATE TABLE tblOrders (
    orderID INT PRIMARY KEY IDENTITY(1,1),
    userID nvarchar(50) FOREIGN KEY REFERENCES tblUsers(userID),
    date DATE,
    total FLOAT
);

CREATE TABLE tblProduct (
    productID VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    price FLOAT,
    quantity INT
);

CREATE TABLE tblOrderDetail (
    orderDetailID INT PRIMARY KEY IDENTITY(1,1),
    orderID INT FOREIGN KEY REFERENCES tblOrders(orderID),
    productID VARCHAR(255) FOREIGN KEY REFERENCES tblProduct(productID),
    price FLOAT,
    quantity INT
);


INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1)

INSERT INTO tblProduct (productID, name, price, quantity)
VALUES 
('T031', 'T-shirt', 250.00, 30),
('J930', 'Authumn jacket', 550.00, 15),
('SJ493', 'Short Jeans', 400.00, 12),
('D389', 'Halloween Dress', 550.00, 30),
('S173', 'Polo Shirt', 200.00, 15), 
('SJ183', 'Skinny Jeans', 450.00, 16),
('B169', 'Leather Belt', 150.00, 19),
('G291', 'Sun Glasses', 120.50, 18);
go
Select * FROM tblProduct
Select * FROM tblOrderDetail
Select * FROM tblUsers