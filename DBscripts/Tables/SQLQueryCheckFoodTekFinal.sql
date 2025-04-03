USE FOODTEKPROJECTDB ;

 GO 

--For Super Admin Table :
ALTER TABLE SuperAdmin
ADD CONSTRAINT CHK_Username_Valid
CHECK (Username LIKE '[A-Za-z]%');


ALTER TABLE SuperAdmin
ADD CONSTRAINT CHK_Password_Valid
CHECK (LEN([password]) >= 8 AND
    [password] LIKE '%[abcdefghijklmnopqrstuvwxyz]%' AND
    [password] LIKE '%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%' AND
    [password] LIKE '%[0123456789]%' AND
    [password] LIKE '%[@$!%*?&]%'
	);


ALTER TABLE SuperAdmin
ADD CONSTRAINT CHK_Email_Valid
CHECK (Email LIKE '%@gmail.com' OR 
       Email LIKE '%@hotmail.com' OR 
       Email LIKE '%@outlook.com' OR 
       Email LIKE '%@zoho.com');



--For Admin Table:
ALTER TABLE Admin
ADD CONSTRAINT CHK_FirstName_Admin_Valid
CHECK (FirstName LIKE '%[A-Za-z]%' AND FirstName NOT LIKE '%[^A-Za-z ]%');

ALTER TABLE Admin
ADD CONSTRAINT CHK_LastName_Admin_Valid
CHECK (LastName LIKE '%[A-Za-z]%' AND LastName NOT LIKE '%[^A-Za-z ]%');

ALTER TABLE Admin
ADD CONSTRAINT CHK_PhoneNumber_Admin_Valid
CHECK (PhoneNumber LIKE '07[789]%%%%%%%' AND LEN(PhoneNumber) = 10);


ALTER TABLE Admin
ADD CONSTRAINT CHK_Email_Admin_Valid
CHECK (Email LIKE '%@gmail.com' OR Email LIKE '%@hotmail.com' OR Email LIKE '%@outlook.com' OR Email LIKE '%@zoho.com');


ALTER TABLE Admin
ADD CONSTRAINT CHK_Password_Admin_Valid
CHECK (
    LEN([password]) >= 8 AND
    [password] LIKE '%[abcdefghijklmnopqrstuvwxyz]%' AND
    [password] LIKE '%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%' AND
    [password] LIKE '%[0123456789]%' AND
    [password] LIKE '%[@$!%*?&]%'
);

	 

--For Role Table:

ALTER TABLE Role
ADD CONSTRAINT CHK_RoleNameEN_Valid
CHECK (RoleNameEN LIKE '%[^a-zA-Z ]%' OR LEN(RoleNameEN) > 0); 

ALTER TABLE Role
ADD CONSTRAINT CHK_RoleNameAR_Valid
CHECK (RoleNameAR LIKE '%[^ء-ي ]%' OR LEN(RoleNameAR) > 0);


---For Employee Table:
ALTER TABLE Employee
ADD CONSTRAINT CHK_FirstName_Employee_Valid
CHECK (FirstName LIKE '[A-Za-z ]%');

ALTER TABLE Employee
ADD CONSTRAINT CHK_LastName_Employee_Valid
CHECK (LastName LIKE '[A-Za-z ]%');

ALTER TABLE Employee
ADD CONSTRAINT CHK_PhoneNumber_Employee_Valid
CHECK (PhoneNumber LIKE '07[789]%' AND LEN(PhoneNumber) = 10);


ALTER TABLE Employee
ADD CONSTRAINT CHK_Email_Employee_Valid
CHECK (Email LIKE '%@gmail.com' OR Email LIKE '%@hotmail.com' OR Email LIKE '%@outlook.com' OR Email LIKE '%@zoho.com');


ALTER TABLE Employee
ADD CONSTRAINT CHK_Password_Employee_Valid
CHECK (
    LEN(Password) >= 8 AND
    Password LIKE '%[a-z]%' AND  
    Password LIKE '%[A-Z]%' AND  
    Password LIKE '%[0-9]%' AND  
    Password LIKE '%[^a-zA-Z0-9]%' 
);


----For Client table :
ALTER TABLE Client
ADD CONSTRAINT CHK_Email_Client_Valid
CHECK (Email LIKE '%@gmail.com' OR Email LIKE '%@hotmail.com' OR Email LIKE '%@outlook.com' OR Email LIKE '%@zoho.com');

ALTER TABLE Client
ADD CONSTRAINT CHK_PhoneNumber_Client_Valid
CHECK (PhoneNumber LIKE '07[789]%' AND LEN(PhoneNumber) = 10);

ALTER TABLE Client
ADD CONSTRAINT CHK_Client_Status CHECK (Status IN ('Active', 'Not Activated Yet', 'Forbidden', 'Blocked'));


--For Order Table:


ALTER TABLE Orders
ADD CONSTRAINT CHK_Orders_Status CHECK (Status IN ('Active', 'On Shipment', 'Complete', 'Canceled'));








--For Issue Table:
ALTER TABLE Issue
ADD CONSTRAINT CHK_Email_Issue_Valid
CHECK (Email LIKE '%@gmail.com' OR 
       Email LIKE '%@hotmail.com' OR 
       Email LIKE '%@outlook.com' OR 
       Email LIKE '%@zoho.com');

	   ALTER TABLE Issue
ADD CONSTRAINT CHK_Issue_Status CHECK (Status IN ('Open', 'Pending', 'Waiting Customer Response', 'Closed'));



--For Suggest Table:

ALTER TABLE Suggest
ADD CONSTRAINT CHK_Email_Suggest_Valid
CHECK (Email LIKE '%@gmail.com' OR 
       Email LIKE '%@hotmail.com' OR 
       Email LIKE '%@outlook.com' OR 
       Email LIKE '%@zoho.com');

ALTER TABLE Suggest
ADD CONSTRAINT CHK_Suggest_Status CHECK (Status IN ('Received', 'Approved', 'Rejected'));

--For Deliveries Table:
ALTER TABLE Deliveries
ADD CONSTRAINT CHK_Deliveries_Status CHECK (DeliveryStatus IN ('Pending', 'In-Transit', 'Delivered', 'Canceled'));


--For Category Table:

ALTER TABLE Category
ADD CONSTRAINT CHK_NameAR_Valid
CHECK (NameAR LIKE '%[ء-ي]%' AND LTRIM(RTRIM(NameAR)) = NameAR AND NameAR NOT LIKE '%  %');


ALTER TABLE Category
ADD CONSTRAINT CHK_NameEN_Valid
CHECK (NameEN LIKE '%[a-zA-Z]%' AND LTRIM(RTRIM(NameEN)) = NameEN AND NameEN NOT LIKE '%  %');


ALTER TABLE Category
ADD CONSTRAINT CHK_Image_Valid
CHECK (Image LIKE '%.png' OR Image LIKE '%.jpg' OR Image LIKE '%.webp');




--- For DisscountOffer Table:

ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_TitleEN_Valid
CHECK (TitleEN LIKE '%[a-zA-Z ]%' OR TitleEN LIKE '%[%$%?]%' );

ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_DescriptionEN_Valid
CHECK (DescriptionEN LIKE '%[a-zA-Z ]%' OR DescriptionEN LIKE '%[%$%?]%' );


ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_TitleAR_Valid
CHECK (TitleAR LIKE '%[ء-ي ]%' OR TitleAR LIKE '%[%$%?]%' );

ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_DescriptionAR_Valid
CHECK (DescriptionAR LIKE '%[ء-ي ]%' OR DescriptionAR LIKE '%[%$%?]%' );


ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_StartDate_Valid
CHECK (StartDate >= GETDATE());


ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_EndDate_Valid
CHECK (EndDate >= GETDATE() AND EndDate > StartDate);


ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_LimitAmount_Valid
CHECK (LimitAmount > 0);



ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_Code_Valid
CHECK (Code LIKE '%[a-zA-Z0-9]%');


ALTER TABLE DiscountOffers
ADD CONSTRAINT CHK_Percentage_Valid
CHECK (DiscountPercentage BETWEEN 1 AND 50);



---For Item Table:

ALTER TABLE Item
ADD CONSTRAINT CHK_NameAR_Item_Valid
CHECK (NameAR LIKE '%[ء-ي ]%');

ALTER TABLE Item
ADD CONSTRAINT CHK_DescriptionAR_Item_Valid
CHECK (DescriptionAR LIKE '%[ء-ي ]%');


ALTER TABLE Item
ADD CONSTRAINT CHK_NameEN_Item_Valid
CHECK (NameEN LIKE '%[a-zA-Z ]%');

ALTER TABLE Item
ADD CONSTRAINT CHK_DescriptionEN_Item_Valid
CHECK (DescriptionEN LIKE '%[a-zA-Z ]%');



ALTER TABLE Item
ADD CONSTRAINT CHK_Image_Item_Valid
CHECK (Image LIKE '%.png' OR Image LIKE '%.jpg' OR Image LIKE '%.webp');


ALTER TABLE Item
ADD CONSTRAINT CHK_Price_Item_Valid
CHECK (Price > 0);


-- For ItemOptionTable:
ALTER TABLE ItemOption
ADD CONSTRAINT CHK_NameAR_ItemOption_Valid
CHECK (NameAR LIKE '%[ء-ي ]%');

ALTER TABLE ItemOption
ADD CONSTRAINT CHK_NameEN_ItemOption_Valid
CHECK (NameEN LIKE '%[a-zA-Z ]%');

 

 --For Notification Table:
 ALTER TABLE Notifications
ADD CONSTRAINT CHK_Notifications_NotificationType CHECK (NotificationType IN ('Issue', 'Support', 'New Order', 'New System Action'));


--For Driver Table:

ALTER TABLE Driver
ADD CONSTRAINT CHK_Email_Driver_Valid
CHECK (Email LIKE '%@gmail.com' OR 
       Email LIKE '%@hotmail.com' OR 
       Email LIKE '%@outlook.com' OR 
       Email LIKE '%@zoho.com');

ALTER TABLE Driver
ADD CONSTRAINT CHK_Password_Driver_Valid
check (
    len([password]) >=8 and
    [password] LIKE '%[a-z]%' and
    [password] LIKE '%[A-Z]%' and 
    [password] LIKE '%[0-9]%' and 
    [password] LIKE '%[@$!%*?&]%'
	);


	--For Payment Table:
	ALTER TABLE Payment
ADD CONSTRAINT CHK_Payment_PaymentType CHECK (PaymentType IN ('Credit Card', 'Debit Card'));


ALTER TABLE Payment
ADD CONSTRAINT CHK_Payment_PaymentStatus CHECK (PaymentStatus IN ('Pending', 'Completed', 'Failed'));


--For OrderHistory Table:

ALTER TABLE OrderHistory
ADD CONSTRAINT CHK_Orders_Rate CHECK (Rate IN ('With Shipment', 'Canceled', 'Complete'));


ALTER TABLE OrderHistory
ADD CONSTRAINT CHK_Order_Status CHECK ([Status] IN ('Active', 'On Shipment', 'Complete', 'Canceled'));



