CREATE DATABASE [ePRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ePRJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ePRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ePRJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ePRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

CREATE TABLE Customers(
    Id int IDENTITY(1,1) NOT NULL,
    UserName varchar(100) NOT NULL,
    FullName varchar(100) NOT NULL,
    Email varchar(200) NOT NULL,
    PhoneNumber varchar(13) NOT NULL,
    UserAddress varchar(100) NOT NULL,
    PassWord varchar(200) NOT NULL,
    Active int DEFAULT 1,
    PRIMARY KEY (Id)
)
CREATE TABLE Categorys(
    Id int IDENTITY(1,1) NOT NULL,
    Name varchar(50) NOT NULL,
    PRIMARY KEY (Id),
)

CREATE TABLE Products(
    Id int IDENTITY(1,1) NOT NULL,
    ProductName varchar(100) NOT NULL,
    Rate int,
    Price int NOT NULL,
    Description varchar(200),
    Avatar varchar(200) NOT NULL,
    Image1 varchar(200) NOT NULL,
    Image2 varchar(200) NOT NULL,
    Image3 varchar(200) NOT NULL,
    CategoryId int,
    Status bit NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (CategoryId) REFERENCES Categorys(Id),
   
)
CREATE TABLE Stocks(
    Id int IDENTITY(1,1) NOT NULL,
    ProductId int NOT NULL,
    CategoryId int NOT NULL,
    Quantity int NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (CategoryId) REFERENCES Categorys(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
)
CREATE TABLE Staffs(
    Id int IDENTITY(1,1) NOT NULL,
    UserName varchar(100) NOT NULL,
    PassWord varchar(100) NOT NULL,
    Name varchar(100) NOT NULL,
    Role int NOT NULL,
    PRIMARY KEY (Id),
)
CREATE TABLE Orders(
    Id int IDENTITY(1,1) NOT NULL,
    ProductId int NOT NULL,
    CustomerId int NOT NULL,
    Quantity int NOT NULL,
    Status varchar (200),
    Address varchar(100),
    TotalPrice int NOT NULL,
    PaymentTerm int NOT NULL,
    Phone varchar(13) NOT NULL,
    OrderDate date,
    PRIMARY KEY (Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
)
CREATE TABLE OrderDetail(
    Id int IDENTITY(1,1) NOT NULL,
    OrderId int NOT NULL,
    ProductId int NOT NULL,
    CustomerId int NOT NULL,
    Quantity int NOT NULL,
    Status varchar (200),
    Address varchar(100),
    TotalPrice int NOT NULL,
    PaymentTerm int NOT NULL,
    Phone varchar(13) NOT NULL,
    OrderDate date,
    PRIMARY KEY (Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
)
CREATE TABLE Coupons(
    Id int IDENTITY(1,1) NOT NULL,
    Discount int NOT NULL,
    Code varchar(5) NOT NULL,
    Limit int NOT NULL,
    PRIMARY KEY (Id),
)
CREATE TABLE Wishlist(
    Id int IDENTITY(1,1) NOT NULL,
    CustomerId int ,
    ProductId int,
    PRIMARY KEY (Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
)
CREATE TABLE Comments(
 Id int IDENTITY(1,1) NOT NULL,
    ProductId int NOT NULL,
    CustomerId int NOT NULL,
    Rate int NOT NULl,
    Content varchar(200) NOT NULL
    PRIMARY KEY (Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
)
