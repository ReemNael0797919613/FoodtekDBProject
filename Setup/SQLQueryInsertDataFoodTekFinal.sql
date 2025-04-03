
USE FOODTEKPROJECTDB ;

 GO 
 -- إعادة تعيين الـ IDENTITY لكل جدول في قاعدة البيانات

DBCC CHECKIDENT ('SuperAdmin', RESEED, 0);
DBCC CHECKIDENT ('Admin', RESEED, 0);
DBCC CHECKIDENT ('Role', RESEED, 0);
DBCC CHECKIDENT ('Driver', RESEED, 0);
DBCC CHECKIDENT ('Employee', RESEED, 0);
DBCC CHECKIDENT ('Client', RESEED, 0);
DBCC CHECKIDENT ('Deliveries', RESEED, 0);
DBCC CHECKIDENT ('Orders', RESEED, 0);
DBCC CHECKIDENT ('Payment', RESEED, 0);
DBCC CHECKIDENT ('DiscountOffers', RESEED, 0);
DBCC CHECKIDENT ('Suggest', RESEED, 0);
DBCC CHECKIDENT ('Item', RESEED, 0);
DBCC CHECKIDENT ('Category', RESEED, 0);
DBCC CHECKIDENT ('Reviews', RESEED, 0);
DBCC CHECKIDENT ('OrderHistory', RESEED, 0);

--> Super Admin data :
INSERT INTO SuperAdmin (Username, [Password], Email, CreatedBy, UpdatedBy, IsActive)
VALUES
('AdminOne', 'Admin@123', 'adminone@gmail.com', 'System', 'System', 1),
('SuperUser', 'Super@987', 'superuser@outlook.com', 'System', 'System', 1),
('TechLead', 'Tech@321', 'techlead@hotmail.com', 'AdminOne', 'AdminOne', 0),
('MasterAdmin', 'Master@456', 'masteradmin@zoho.com', 'SuperUser', 'SuperUser', 1),
('RootUser', 'Root@789', 'rootuser@gmail.com', 'TechLead', 'TechLead', 0);



--> Admin Data :
INSERT INTO Admin (FirstName, LastName, Email, Username, PhoneNumber, [Password], ProfileImage, CreatedBy, UpdatedBy, IsActive, SuperAdminId)
VALUES
('Ali', 'Khaled', 'ali.khaled@gmail.com', 'AliKhaled', '0791234567', 'Ali@1234', NULL, 'System', 'System', 1, 1),
('Omar', 'Hassan', 'omar.hassan@outlook.com', 'OmarHassan', '0789876543', 'Omar@5678', NULL, 'Admin1', 'Admin1', 1, 2),
('Lina', 'Ahmad', 'lina.ahmad@hotmail.com', 'LinaAhmad', '0773456789', 'Lina@7890', NULL, 'Admin2', 'Admin2', 0, 3),
('Sara', 'Nasser', 'sara.nasser@zoho.com', 'SaraNasser', '0798765432', 'Sara@3456', NULL, 'Admin3', 'Admin3', 1, 1),
('Kareem', 'Ali', 'kareem.ali@gmail.com', 'KareemAli', '0781122334', 'Kareem@6789', NULL, 'Admin4', 'Admin4', 0, 2);



INSERT INTO Role (RoleNameEN, RoleNameAR, CreatedBy, UpdatedBy, IsActive, AdminId)
VALUES
('Administrator', N'مدير النظام', 'System', 'System', 1, 1),
('Manager', N'مدير', 'AliKhaled', 'AliKhaled', 1, 2),
('Supervisor', N'مشرف', 'OmarHassan', 'OmarHassan', 1, 3),
('Customer Support', N'دعم العملاء', 'LinaAhmad', 'LinaAhmad', 0, 4),
('Sales Representative', N'مندوب مبيعات', 'SaraNasser', 'SaraNasser', 1, 5);



INSERT INTO Driver (FirstName, LastName, Email, Username, PhoneNumber, [Password], ProfileImage, JoinDate, CreatedBy, UpdatedBy, IsActive, UpdateDate, CreationDate, AdminId) 
VALUES 
('John', 'Doe', 'john.doe@gmail.com', 'johndoe123', '1234567890', 'Password@123', NULL, GETDATE(), 'Admin1', 'Admin1', 1, GETDATE(), GETDATE(), 1),

('Jane', 'Smith', 'jane.smith@hotmail.com', 'janesmith456', '9876543210', 'SecurePass1!', NULL, GETDATE(), 'Admin2', 'Admin2', 0, GETDATE(), GETDATE(), 2),

('Michael', 'Brown', 'michael.brown@outlook.com', 'mikebrown789', '1122334455', 'Mikey@2024', NULL, GETDATE(), 'Admin3', 'Admin3', 1, GETDATE(), GETDATE(), 3),

('Emily', 'Davis', 'emily.davis@zoho.com', 'emilyd2023', '5566778899', 'EmilySecure99$', NULL, GETDATE(), 'Admin4', 'Admin4', 1, GETDATE(), GETDATE(), 4),

('Chris', 'Wilson', 'chris.wilson@gmail.com', 'chriswilson007', '7788996655', 'ChrisPass!123', NULL, GETDATE(), 'Admin5', 'Admin5', 0, GETDATE(), GETDATE(), 5);



INSERT INTO Employee (FirstName, LastName, Email, Username, PhoneNumber, [Password], ProfileImage, JoinDate, CreatedBy, UpdatedBy, IsActive, UpdateDate, CreationDate, AdminId, RoleId) 
VALUES 
('Ali', 'Khan', 'ali.khan@gmail.com', 'alikhan01', '0771234567', 'AliPass@123', NULL, GETDATE(), 'Admin1', 'Admin1', 1, GETDATE(), GETDATE(), 1, 1),

('Sara', 'Ahmed', 'sara.ahmed@hotmail.com', 'saraahmed02', '0789876543', 'Sara@4567!', NULL, GETDATE(), 'Admin2', 'Admin2', 1, GETDATE(), GETDATE(), 2, 2),

('Omar', 'Hassan', 'omar.hassan@outlook.com', 'omarhassan03', '0791122334', 'OmarPass!99', NULL, GETDATE(), 'Admin3', 'Admin3', 0, GETDATE(), GETDATE(), 3, 3),

('Layla', 'Yousef', 'layla.yousef@zoho.com', 'laylayousef04', '0775566778', 'Layla$Tek2024', NULL, GETDATE(), 'Admin4', 'Admin4', 1, GETDATE(), GETDATE(), 4, 4),

('Kareem', 'Fahad', 'kareem.fahad@gmail.com', 'kareemfahad05', '0786677889', 'Kareem@Tek99', NULL, GETDATE(), 'Admin5', 'Admin5', 0, GETDATE(), GETDATE(), 5, 5);




INSERT INTO Client ([Image], FirstName, LastName, Email, PhoneNumber, JoinDate, [Status], CreatedBy, UpdatedBy, IsActive, UpdateDate, CreationDate)  
VALUES  
(NULL, 'Ahmed', 'Ali', 'ahmed.ali@gmail.com', '0771234567', GETDATE(), 'Active', 'Admin1', 'Admin1', 1, GETDATE(), GETDATE()),  

(NULL, 'Fatima', 'Hassan', 'fatima.hassan@hotmail.com', '0789876543', GETDATE(), 'Not Activated Yet', 'Admin2', 'Admin2', 0, GETDATE(), GETDATE()),  

(NULL, 'Omar', 'Yousef', 'omar.yousef@outlook.com', '0791122334', GETDATE(), 'Active', 'Admin3', 'Admin3', 1, GETDATE(), GETDATE()),  

(NULL, 'Laila', 'Khalid', 'laila.khalid@zoho.com', '0775566778', GETDATE(), 'Forbidden', 'Admin4', 'Admin4', 0, GETDATE(), GETDATE()),  

(NULL, 'Kareem', 'Fadel', 'kareem.fadel@gmail.com', '0786677889', GETDATE(), 'Blocked', 'Admin5', 'Admin5', 1, GETDATE(), GETDATE());  


INSERT INTO Deliveries (DeliveryStatus, PickUpLocation, DropLocation, CreatedBy, UpdatedBy, IsActive, ClientId, DriverId)  
VALUES  
('Pending', 'Sky Gym, Downtown', 'FoodTek Restaurant, City Center', 'Admin1', 'Admin1', 1, 1, 1),  

('In-Transit', 'Sky Gym, Downtown', 'FoodTek Restaurant, City Center', 'Admin2', 'Admin2', 1, 2, 2),  

('Delivered', 'FoodTek Restaurant, City Center', 'Client Office, Business Park', 'Admin3', 'Admin3', 1, 3, 3),  

('Canceled', 'Sky Gym, Downtown', 'FoodTek Restaurant, City Center', 'Admin4', 'Admin4', 0, 4, 4),  

('Pending', 'Sky Gym, Downtown', 'FoodTek Restaurant, City Center', 'Admin5', 'Admin5', 1, 5, 5);






INSERT INTO Orders (TotalPrice, Rate, [Status], Actions, CreatedBy, UpdatedBy, IsActive, ClientId, DriverId, AdminId, DeliveriesId)
VALUES
    (50.00, 5, 'Active', 'Processing', 'Admin1', 'Admin1', 1, 1, 1, 1, 1),
    (75.50, 4, 'On Shipment', 'Shipped', 'Admin2', 'Admin2', 1, 2, 2, 2, 2),
    (100.25, 3, 'Complete', 'Delivered', 'Admin3', 'Admin3', 1, 3, 3, 3, 3),
    (30.99, 2, 'Canceled', 'Order Canceled', 'Admin1', 'Admin1', 0, 4, 4, 4, 4);





-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-- Insert Dummy Data into Suggest Table
INSERT INTO Suggest (Title, Email, Status, CreatedBy, UpdatedBy, IsActive, ClientId)
VALUES 
('New Feature Request', 'user1@gmail.com', 'Received', 'Admin', 'Admin', 1, 1),
('Improve UI Design', 'user2@hotmail.com', 'Approved', 'Manager', 'Admin', 1, 2),
('Bug Report', 'user3@outlook.com', 'Rejected', 'User', 'Admin', 0, 3),
('Add Dark Mode', 'user4@zoho.com', 'Received', 'Admin', 'Admin', 1, 4),
('Performance Enhancement', 'user5@gmail.com', 'Approved', 'Manager', 'Manager', 1, 5);


-- Insert dummy data into Payment table
INSERT INTO Payment (Amount, PaymentType, PaymentStatus, CreatedBy, UpdatedBy, IsActive, ClientId, OrderId)
VALUES
(100.00, 'Credit Card', 'Completed', 'admin_user', 'admin_user', 1, 1, 1),
(50.50, 'Debit Card', 'Pending', 'admin_user', 'admin_user', 1, 2, 2),
(200.00, 'Credit Card', 'Failed', 'admin_user', 'admin_user', 0, 3, 3),
(75.25, 'Debit Card', 'Completed', 'admin_user', 'admin_user', 1, 4, 4);



ALTER TABLE OrderHistory
DROP CONSTRAINT CHK_Orders_Rate;

ALTER TABLE OrderHistory
ADD CONSTRAINT CHK_Orders_Rate CHECK (Rate IN (1, 2, 3)); -- 1 = With Shipment, 2 = Canceled, 3 = Complete

-- Insert dummy data into OrderHistory table
INSERT INTO OrderHistory (TotalPrice, Rate, [Status], CreatedBy, UpdatedBy, IsActive, ClientId, OrderId)
VALUES
(100.00, 3, 'Active', 'admin_user', 'admin_user', 1, 1, 1),
(150.50, 1, 'On Shipment', 'admin_user', 'admin_user', 1, 2, 2),
(200.00, 2, 'Complete', 'admin_user', 'admin_user', 0, 3, 3),
(75.25, 3, 'Canceled', 'admin_user', 'admin_user', 1, 4, 4);






-- إدخال البيانات
INSERT INTO Category (NameEN, NameAR, [Image], CreatedBy, UpdatedBy, IsActive, AdminId)
VALUES
('Beverages', N'مشروبات', 'beverages.jpg', 'admin_user', 'admin_user', 1, 1),
('Main Dishes', N'أطباق رئيسية', 'maindishes.png', 'admin_user', 'admin_user', 1, 2),
('Snacks', N'وجبات خفيفة', 'snacks.webp', 'admin_user', 'admin_user', 1, 3),
('Desserts', N'حلويات', 'desserts.jpg', 'admin_user', 'admin_user', 1, 4);


ALTER TABLE Category
ADD CONSTRAINT CHK_NameAR_Valid
CHECK (NameAR LIKE '%[^أ-ي ]%' ESCAPE '\');


ALTER TABLE Item
DROP CONSTRAINT CHK_NameAR_Item_Valid;

ALTER TABLE Item
DROP CONSTRAINT CHK_DescriptionAR_Item_Valid;

-- Correct the constraint for NameAR
ALTER TABLE Item
ADD CONSTRAINT CHK_NameAR_Item_Valid
CHECK (NameAR LIKE '%[^أ-ي ]%' ESCAPE '\');

-- Correct the constraint for DescriptionAR
ALTER TABLE Item
ADD CONSTRAINT CHK_DescriptionAR_Item_Valid
CHECK (DescriptionAR LIKE '%[^أ-ي ]%' ESCAPE '\');



-- Insert dummy data into Item table
INSERT INTO Item (NameEN, NameAR, DescriptionEN, DescriptionAR, Price, [Image], CreatedBy, UpdatedBy, IsActive, AdminId, CategoryId)
VALUES
('Chicken Burger', N'برجر دجاج', 'A delicious chicken burger with lettuce and tomato.', N'برجر دجاج لذيذ مع خس وطماطم.', 10.50, 'chicken_burger.jpg', 'admin_user', 'admin_user', 1, 1, 7),
('Cheese Pizza', N'بيتزا بالجبن', 'A classic cheese pizza with mozzarella cheese.', N'بيتزا كلاسيكية مع جبن موزاريلا.', 12.00, 'cheese_pizza.png', 'admin_user', 'admin_user', 1, 1, 8),
('Coca Cola', N'كوكا كولا', 'A refreshing soda drink.', N'مشروب غازي منعش.', 2.00, 'coca_cola.jpg', 'admin_user', 'admin_user', 1, 1, 9),
('Chocolate Cake', N'كيك بالشوكولاتة', 'A rich chocolate cake with a creamy layer of frosting.', N'كيك شوكولاتة غني مع طبقة كريمة من التغطية.', 5.50, 'chocolate_cake.webp', 'admin_user', 'admin_user', 1, 2, 10);



-- Insert dummy data into Reviews table
INSERT INTO Reviews (Rating, Comment, CreatedBy, UpdatedBy, IsActive, ClientId, OrderId, DriverId, ItemId)
VALUES
(5, 'Excellent service and tasty food!', 'admin_user', 'admin_user',1 ,1, 1, 1, 8),  
(4, 'Good food, but the delivery was a bit slow.', 'admin_user', 'admin_user', 1,2, 2, 2, 9),  
(3, 'The food was okay, not as expected.', 'admin_user', 'admin_user', 0,3, 3, 3, 10),  
(2, 'Did not like the taste at all, very disappointing.', 'admin_user', 'admin_user', 0,4, 4, 4, 11);  




INSERT INTO DiscountOffers (TitleEN, TitleAR, DescriptionEN, DescriptionAR, StartDate, EndDate, LimitAmount, Code, Image, DiscountPercentage, CreatedBy, UpdatedBy, IsActive, AdminId, OrderId, ItemId)
VALUES
('Summer Sale', N'عرض الصيف', 'Get 20% off on all orders this summer!', N'احصل على خصم 20% على جميع الطلبات هذا الصيف!', DATEADD(DAY, 1, GETDATE()), DATEADD(MONTH, 1, GETDATE()), 1000.00, 'SUMMER20', 'summer_offer.jpg', 20, 'admin_user', 'admin_user', 1, 1, 1, 8),
('Weekend Discount', N'خصم نهاية الأسبوع', 'Enjoy a 15% discount on your weekend orders.', N'استمتع بخصم 15% على طلباتك في نهاية الأسبوع.', DATEADD(DAY, 1, GETDATE()), DATEADD(DAY, 7, GETDATE()), 500.00, 'WEEKEND15', 'weekend_discount.jpg', 15, 'admin_user', 'admin_user', 1, 2, 2, 9),
('Black Friday Deal', N'عرض الجمعة السوداء', 'Huge discounts up to 50% on selected items!', N'خصومات ضخمة تصل إلى 50% على العناصر المحددة!', DATEADD(DAY, 1, GETDATE()), DATEADD(DAY, 15, GETDATE()), 2000.00, 'BLACKFRIDAY50', 'black_friday.jpg', 50, 'admin_user', 'admin_user', 1, 3, 3, 10),
('New Year Offer', N'عرض رأس السنة', 'Celebrate the New Year with a 30% discount on your first order.', N'احتفل برأس السنة مع خصم 30% على أول طلب لك.', DATEADD(DAY, 1, GETDATE()), DATEADD(MONTH, 2, GETDATE()), 800.00, 'NEWYEAR30', 'new_year_offer.jpg', 30, 'admin_user', 'admin_user', 1, 4, 4, 11);



ALTER TABLE ItemOption
DROP CONSTRAINT CHK_NameAR_ItemOption_Valid;

-- Correct the constraint for NameAR
ALTER TABLE ItemOption
ADD CONSTRAINT CHK_NameAR_ItemOption_Valid
CHECK (NameAR LIKE '%[^أ-ي ]%' ESCAPE '\');

INSERT INTO ItemOption (NameEN, NameAR, IsRequired, CreatedBy, UpdatedBy, IsActive, AdminId, ItemId)
VALUES
('Extra Cheese', N'جبنة إضافية', 1, 'admin_user', 'admin_user', 1, 1, 8),
('Spicy Sauce', N'صلصة حارة', 0, 'admin_user', 'admin_user', 1, 1, 9),
('Extra Ketchup', N'كاتشب إضافي', 0, 'admin_user', 'admin_user', 1, 1, 10),
('Lettuce', N'خس', 1, 'admin_user', 'admin_user', 1, 2, 11);


INSERT INTO Notifications (Title, NotificationType, IsRead, CreatedBy, UpdatedBy, IsActive, AdminId, EmployeeId, ClientId, DriverId, OfferId)
VALUES
('New Order Received', 'New Order', 0, 'admin_user', 'admin_user', 1, 1, 1, 1, 1, 1),
('System Update Completed', 'New System Action', 1, 'system_admin', 'system_admin', 1, 2, 2, 2, 2, 2),
('Support Ticket Created', 'Support', 0, 'client_user', 'client_user', 1, 3, 3, 3, 3, 3),
('Driver Assigned to Order', 'New System Action', 1, 'admin_user', 'admin_user', 1, 4, 4, 4, 4, 4);



INSERT INTO Issue (Title, Email, [Status], ClientId, CreatedBy, UpdatedBy, IsActive, NotificationId)
VALUES
('Payment Issue', 'customer1@gmail.com', 'Open', 1, 'client_user', 'admin_user', 1, 3),
('Order Delay', 'customer2@hotmail.com', 'Pending', 2, 'client_user', 'admin_user', 1, 4),
('App Bug Report', 'user123@outlook.com', 'Waiting Customer Response', 3, 'client_user', 'support_agent', 1, 5),
('Refund Request', 'buyer456@zoho.com', 'Closed', 4, 'client_user', 'finance_team', 1, 6);



INSERT INTO ClientCategory (ClientId, CategoryId)
VALUES
(1, 7),  
(1, 8),  
(2, 9), 
(2, 10);


INSERT INTO ClientItem (ClientId, ItemId)
VALUES
(1, 8),  
(1, 9),  
(2, 10),  
(3, 11);


INSERT INTO ClientDiscountOffer (ClientId, DiscountOfferId)
VALUES
(1, 1), 
(2, 2),  
(3, 3),  
(4, 1);  


INSERT INTO OrderItem (OrderId, ItemId)
VALUES
(1, 8),  
(1, 9),  
(2, 10),  
(3, 11); 

INSERT INTO CategoryDiscountOffer (CategoryId, DiscountOfferId)
VALUES
(7, 2),  
(8, 3),  
(9, 1),  
(10, 4);



