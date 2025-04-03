 CREATE DATABASE FOODTEKPROJECTDB;

 GO
 USE FOODTEKPROJECTDB ;

 GO 

CREATE TABLE SuperAdmin (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(15) UNIQUE,
    [Password] VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate()
    
);


-- Admin Table
CREATE TABLE Admin (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(15),
    LastName VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    Username VARCHAR(100) UNIQUE not null,
    PhoneNumber VARCHAR(10),
    [Password] VARCHAR(50) not null,
    ProfileImage VARCHAR(max),
    JoinDate DATETIME DEFAULT GETDATE(),
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	SuperAdminId INT,   
    CONSTRAINT FK_Admin_SuperAdmin FOREIGN KEY (SuperAdminId) REFERENCES SuperAdmin(Id),
    
);


-- Role Table
CREATE TABLE Role (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RoleNameEN VARCHAR(50),
    RoleNameAR NVARCHAR(50),
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
    AdminId INT,  
    CONSTRAINT FK_Role_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id)
);


-- driver table
CREATE TABLE Driver (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50)not null,
    LastName VARCHAR(50)not null,
    Email VARCHAR(50) UNIQUE,
    Username VARCHAR(50) not null UNIQUE,
    PhoneNumber VARCHAR(15)not null,
    [Password] VARCHAR(50),
    ProfileImage VARCHAR(max),
    JoinDate DATETIME DEFAULT GETDATE(),
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit default 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime null ,
	AdminId INT,  
    CONSTRAINT FK_Driver_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id)
);



-- Employee Table
CREATE TABLE Employee (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50)not null,
    LastName VARCHAR(50) not null,
    Email VARCHAR(50) UNIQUE,
    Username VARCHAR(50) UNIQUE not null,
    PhoneNumber VARCHAR(15) not null,
    [Password] VARCHAR(50) not null,
    ProfileImage VARCHAR(max),
    JoinDate DATETIME DEFAULT GETDATE(),
    CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime null ,
	AdminId INT,  
    CONSTRAINT FK_Employee_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id),
	RoleId INT,  
    CONSTRAINT FK_Employee_Role FOREIGN KEY (RoleId) REFERENCES Role(Id)
	);


-- Client Table
CREATE TABLE Client (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    [Image] VARCHAR(max),
    FirstName VARCHAR(50) not null,
    LastName VARCHAR(50) not null,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(20) not null,
    JoinDate DATETIME DEFAULT GETDATE(),
    [Status] VARCHAR(50),
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate()

);


-- Deliveries Table
CREATE TABLE Deliveries (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    DeliveryStatus VARCHAR(50) not null,
    PickUpLocation VARCHAR(255)not null,
    DropLocation VARCHAR(255)not null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	ClientId INT,  
    CONSTRAINT FK_Deliveries_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
	DriverId INT,  
    CONSTRAINT FK_Deliveries_Driver FOREIGN KEY (DriverId) REFERENCES Driver(Id),
	--one to one 
	); 

	
	-- Order Table
CREATE TABLE Orders (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    TotalPrice DECIMAL(10,2) not null,
    Rate INT check (Rate between 1 AND 5),
    [Status] VARCHAR(20) not null,
    Actions VARCHAR(50) not null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	ClientId INT,  
    CONSTRAINT FK_Orders_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
	DriverId INT, 
    CONSTRAINT FK_Orders_Driver FOREIGN KEY (DriverId) REFERENCES Driver(Id),
	AdminId INT,  
    CONSTRAINT FK_Orders_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id),
	DeliveriesId INT,
	CONSTRAINT FK_Orders_Deliveries FOREIGN KEY (DeliveriesId) REFERENCES Deliveries(Id),
);

ALTER TABLE Orders 
ALTER COLUMN [Status] VARCHAR(20) NOT NULL;



-- Suggest Table
CREATE TABLE Suggest (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) not null,
    Email VARCHAR(50)unique,
    [Status] VARCHAR(50)not null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	ClientId INT,  
    CONSTRAINT FK_Suggest_Client FOREIGN KEY (ClientId) REFERENCES Client(Id)
);


-- Payment Table
CREATE TABLE Payment (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Amount DECIMAL(18,2) check (Amount >0),
    PaymentType VARCHAR(50)not null,
    PaymentStatus VARCHAR(50)not null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit default 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
    ClientId INT,  
    CONSTRAINT FK_Payment_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
	OrderId INT UNIQUE,  
    CONSTRAINT FK_Payment_Order FOREIGN KEY (OrderId) REFERENCES Orders(Id)
);



-- Order History Table
CREATE TABLE OrderHistory (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    TotalPrice DECIMAL(10,2)not null,
    Rate INT not null,
    [Status] VARCHAR(50) not null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit default 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	ClientId INT,  
    CONSTRAINT FK_OrderHistory_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
	OrderId INT UNIQUE,  
    CONSTRAINT FK_OrderHistory_Order FOREIGN KEY (OrderId) REFERENCES Orders(Id)
);



-- Category Table
CREATE TABLE Category (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NameEN VARCHAR(50)not null,
    NameAR NVARCHAR(50)not null,
    [Image] VARCHAR(255)not null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	AdminId INT,  
    CONSTRAINT FK_Category_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id)
);


-- Item Table
CREATE TABLE Item (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NameEN VARCHAR(50)not null,
    NameAR NVARCHAR(50)not null,
    DescriptionEN VARCHAR(255),
    DescriptionAR VARCHAR(255),
    Price float check (Price > 0), 
    [Image] VARCHAR(max)not null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	AdminId INT,  
    CONSTRAINT FK_Item_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id),
	CategoryId INT,  
    CONSTRAINT FK_Item_Category FOREIGN KEY (CategoryId) REFERENCES Category(Id)
);


-- Reviews Table
CREATE TABLE Reviews (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(255)null,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit default 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	ClientId INT,  
    CONSTRAINT FK_Reviews_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
    OrderId INT UNIQUE,  
    CONSTRAINT FK_Reviews_Order FOREIGN KEY (OrderId) REFERENCES Orders(Id),
	DriverId INT,  
    CONSTRAINT FK_Reviews_Driver FOREIGN KEY (DriverId) REFERENCES Driver(Id),
	ItemId INT,  
    CONSTRAINT FK_Reviews_Item FOREIGN KEY (ItemId) REFERENCES Item(Id)
);


-- Discount Offers Table
CREATE TABLE DiscountOffers (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    TitleEN VARCHAR(100)not null unique,
    TitleAR NVARCHAR(100)not null unique,
    DescriptionEN VARCHAR(255),
    DescriptionAR VARCHAR(255),
    StartDate datetime not null check (StartDate >= GETDATE()),
    EndDate datetime not null check ( EndDate >= GETDATE()),
    LimitAmount float null check (LimitAmount > 0),
    Code VARCHAR(50)check (Code LIKE '[A-Za-z0-9]*'),
    [Image] VARCHAR(max)null,
    DiscountPercentage int null check (DiscountPercentage BETWEEN 1 AND 50),
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	AdminId INT,  
    CONSTRAINT FK_DiscountOffers_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id),
	OrderId INT,  
    CONSTRAINT FK_DiscountOffers_Order FOREIGN KEY (OrderId) REFERENCES Orders(Id),
	ItemId INT,  
    CONSTRAINT FK_DiscountOffers_Item FOREIGN KEY (ItemId) REFERENCES Item(Id)
);


-- Item Option Table
CREATE TABLE ItemOption (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NameEN VARCHAR(50)not null,
    NameAR NVARCHAR(50) not null ,
    IsRequired BIT not null default 0,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	AdminId INT,  
    CONSTRAINT FK_ItemOption_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id),
	ItemId INT,  
    CONSTRAINT FK_ItemOption_Item FOREIGN KEY (ItemId) REFERENCES Item(Id)
);


-- Notifications Table
CREATE TABLE Notifications (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255)not null,
    NotificationType VARCHAR(100),
    IsRead BIT DEFAULT 0,
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
	AdminId INT,  
    CONSTRAINT FK_Notifications_Admin FOREIGN KEY (AdminId) REFERENCES Admin(Id),
	EmployeeId INT,  
    CONSTRAINT FK_Notifications_Employee FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
	ClientId INT,  
    CONSTRAINT FK_Notifications_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
	DriverId INT,  
    CONSTRAINT FK_Notifications_Driver FOREIGN KEY (DriverId) REFERENCES Driver(Id),
	OfferId INT UNIQUE,  
    CONSTRAINT FK_Notifications_Offer FOREIGN KEY (OfferId) REFERENCES DiscountOffers(Id)
);


-- Issue Table
CREATE TABLE Issue (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) not null,
    Email VARCHAR(50),
    [Status] VARCHAR(30)not null,
	ClientId INT,  
	CreatedBy varchar(50) not null,
    UpdatedBy varchar(50) not null,
    IsActive Bit DEFAULT 0,
    UpdateDate datetime default GetDate(),
    CreationDate datetime default GetDate(),
    CONSTRAINT FK_Issue_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
	NotificationId INT,  
    CONSTRAINT FK_Issue_Notification FOREIGN KEY (NotificationId) REFERENCES Notifications(Id)
);


CREATE TABLE ClientCategory (
    ClientId INT,  
    CategoryId INT,  
    PRIMARY KEY (ClientId, CategoryId),
    CONSTRAINT FK_ClientCategory_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
    CONSTRAINT FK_ClientCategory_Category FOREIGN KEY (CategoryId) REFERENCES Category(Id)
);



CREATE TABLE ClientItem (
    ClientId INT,  
    ItemId INT,    
    PRIMARY KEY (ClientId, ItemId),
    CONSTRAINT FK_ClientItem_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
    CONSTRAINT FK_ClientItem_Item FOREIGN KEY (ItemId) REFERENCES Item(Id)
);


CREATE TABLE ClientDiscountOffer (
    ClientId INT,  
    DiscountOfferId INT,  
    PRIMARY KEY (ClientId, DiscountOfferId),
    CONSTRAINT FK_ClientDiscountOffer_Client FOREIGN KEY (ClientId) REFERENCES Client(Id),
    CONSTRAINT FK_ClientDiscountOffer_DiscountOffer FOREIGN KEY (DiscountOfferId) REFERENCES DiscountOffers(Id)
);

CREATE TABLE OrderItem (
    OrderId INT,  
    ItemId INT,   
    PRIMARY KEY (OrderId, ItemId),
    CONSTRAINT FK_OrderItem_Order FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    CONSTRAINT FK_OrderItem_Item FOREIGN KEY (ItemId) REFERENCES Item(Id)
);





CREATE TABLE CategoryDiscountOffer (
    CategoryId INT,
    DiscountOfferId INT,
    PRIMARY KEY (CategoryId, DiscountOfferId),
    CONSTRAINT FK_CategoryDiscountOffer_Category FOREIGN KEY (CategoryId) REFERENCES Category(Id),
    CONSTRAINT FK_CategoryDiscountOffer_DiscountOffer FOREIGN KEY (DiscountOfferId) REFERENCES DiscountOffers(Id)
);





