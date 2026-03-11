CREATE DATABASE BikeRentalDB;
USE BikeRentalDB;
GO

CREATE TABLE Accounts (
    AccountsID INT IDENTITY(1,1) PRIMARY KEY,
    lastName NVARCHAR(100),
    firstName NVARCHAR(100),
    PhoneNumber VARCHAR(20) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    PasswordHash VARCHAR(255),
    AvatarUrl NVARCHAR(255),
    Role INT CHECK (Role IN (0,1)), 
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Employees(
	EmployeeID int IDENTITY(1, 1) primary key,
	Position nvarchar(50),
	Salary decimal(18,2),
	HireDate DATE DEFAULT GETDATE(),
	FullName NVARCHAR(100),
	Phone VARCHAR(20) UNIQUE,
	Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active', 'On Leave', 'Resigned', 'Probation'))
);

CREATE TABLE Bike (
    BikeID INT IDENTITY(1,1) PRIMARY KEY,
    PlateNumber VARCHAR(20) UNIQUE,
    Brand NVARCHAR(50),
    Model NVARCHAR(100),
    ImgBike VARCHAR(255),
    Color NVARCHAR(20),
    PricePreDay DECIMAL(18,2),
    Status VARCHAR(20) CHECK (Status IN ('Available','Reserved','Rented','Maintenance'))
);

CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    BikeID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    PickupType VARCHAR(20),
    PickupAddress NVARCHAR(255),
    ReturnType VARCHAR(20),
    ReturnAddress NVARCHAR(255),
    ActualReturnDate DATETIME NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    BookingStatus VARCHAR(20) CHECK (BookingStatus IN ('Pending','Ongoing','Completed','Cancelled')),
    IdentityFrontImg VARCHAR(255),
	IdentityBackImg VARCHAR(255),
    LicenseFrontImg VARCHAR(255),
	LicenseBackImg VARCHAR(255),
    IsVerified BIT DEFAULT 0,
    VerifiedAt DATETIME NULL,
    CONSTRAINT FK_Booking_Account FOREIGN KEY (CustomerID) REFERENCES Accounts(AccountsID),
    CONSTRAINT FK_Booking_Bike FOREIGN KEY (BikeID) REFERENCES Bike(BikeID)
);

CREATE TABLE Invoices (
    InvoicesID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT,
    InvoiceDate DATETIME DEFAULT GETDATE(),
    RentFee DECIMAL(18,2),
    TotalExtraFee DECIMAL(18,2),
    DepositUsed DECIMAL(18,2),
    TotalAmount DECIMAL(18,2),
    InvoiceStatus VARCHAR(30),
    Note NVARCHAR(255),
    CONSTRAINT FK_Invoice_Booking FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT,
    InvoicesID INT NULL,
    Amount DECIMAL(18,2),
    Type VARCHAR(20) CHECK (Type IN ('Deposit','Payment','Refund')),
    Method VARCHAR(20) CHECK (Method IN ('Cash','Transfer','E-Wallet')),
    TransactionDate DATETIME DEFAULT GETDATE(),
    Message NVARCHAR(255),
    TransactionsStatus NVARCHAR(20) CHECK (TransactionsStatus IN ('Pending','Success','Failed')),
    CONSTRAINT FK_Transactions_Booking FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    CONSTRAINT FK_Transactions_Invoice FOREIGN KEY (InvoicesID) REFERENCES Invoices(InvoicesID)
);

CREATE TABLE ExtraFee (
    fee_id INT IDENTITY(1,1) PRIMARY KEY,
    InvoicesID INT,
    type NVARCHAR(50),
    amount DECIMAL(18,2),
    note NVARCHAR(255),
    CONSTRAINT FK_ExtraFee_Invoice FOREIGN KEY (InvoicesID) REFERENCES Invoices(InvoicesID)
);

CREATE TABLE Feedback (
    feedback_id INT IDENTITY(1,1) PRIMARY KEY,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment NVARCHAR(255),
    reply NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    AccountsID INT,
    booking_id INT,
    BikeID INT,
    CONSTRAINT FK_Feedback_Account FOREIGN KEY (AccountsID) REFERENCES Accounts(AccountsID),
    CONSTRAINT FK_Feedback_Booking FOREIGN KEY (booking_id) REFERENCES Booking(BookingID),
    CONSTRAINT FK_Feedback_Bike FOREIGN KEY (BikeID) REFERENCES Bike(BikeID)
);
GO 

INSERT INTO Accounts (lastName, firstName, PhoneNumber, Email, PasswordHash, Role) VALUES 
(N'Nguyễn', N'Admin', '0900000001', 'admin@motogo.com', 'admin', 1),
(N'Trần', N'Thị An', '0911111111', 'an.tran@gmail.com', 'customer1', 0),
(N'Lê', N'Văn Bình', '0922222222', 'binh.le@gmail.com', 'customer2', 0),
(N'Phạm', N'Minh Cường', '0933333333', 'cuong.pham@gmail.com', 'customer3', 0);

INSERT INTO Employees (FullName, Position, Salary, Phone, Status) VALUES
(N'Trần Tùng', N'Giao xe', 15000000, '0912345677', 'Active'),
(N'Phương Anh', N'Thu ngân', 8000000, '0912345678', 'Active'),
(N'Viết Minh', N'Kỹ thuật', 10000000, '0912345679', 'Active');

INSERT INTO Bike (PlateNumber, Brand, Model, ImgBike, Color, PricePreDay, Status) VALUES 
('29A-11111', 'Honda', 'Air Blade 2023', 'assets/img/bikes/Honda-Airblade 2023.jpg', N'Đen Nhám', 150000.00, 'Available'),
('29B-22222', 'Yamaha', 'Exciter 155', 'assets/img/bikes/Yamaha-Exciter 155.jpg', N'Xanh GP', 200000.00, 'Rented'),
('29C-33333', 'Honda', 'Vision', 'assets/img/bikes/Honda-Wave 2023.jpg', N'Trắng', 120000.00, 'Available'),
('29D-44444', 'Piaggio', 'Vespa Sprint', 'assets/img/bikes/Honda-SH150i 2024.jpg', N'Vàng', 350000.00, 'Maintenance');

INSERT INTO Booking (
    CustomerID, BikeID, StartDate, EndDate, ActualReturnDate, 
    PickupType, PickupAddress, ReturnType, ReturnAddress, 
    BookingStatus, IsVerified, VerifiedAt, 
    IdentityFrontImg, IdentityBackImg, LicenseFrontImg, LicenseBackImg
)
VALUES 
(2, 1, '2023-10-01 08:00:00', '2023-10-03 08:00:00', '2023-10-03 09:30:00', 'Delivery', N'123 Cầu Giấy', 'At Store', N'Số 1 Đại Cồ Việt', 
'Completed', 1, '2023-10-01', 'assets/img/identity/id_an_front.jpg', 'assets/img/identity/id_an_back.jpg', 'assets/img/license/lic_an_front.jpg',
'assets/img/license/lic_an_back.jpg'),
(3, 3, '2023-10-05 09:00:00', '2023-10-06 09:00:00', '2023-10-06 15:00:00', 'At Store', N'Số 1 Đại Cồ Việt', 'At Store', N'Số 1 Đại Cồ Việt',
'Completed', 1, '2023-10-05', 'assets/img/identity/id_binh_front.png', 'assets/img/identity/id_binh_back.png', 'assets/img/license/lic_binh_front.png',
'assets/img/license/lic_binh_back.png'),
(4, 2, '2023-10-10 10:00:00', '2023-10-12 10:00:00', NULL, 'Delivery', N'Times City', 'Delivery', N'Times City', 
'Ongoing', 1, '2023-10-10', 'assets/img/identity/1697011200_id_f.jpg', 'assets/img/identity/1697011200_id_b.jpg', 
'assets/img/license/1697011200_lic_f.jpg', 'assets/img/license/1697011200_lic_b.jpg'),
(2, 1, '2023-11-01 08:00:00', '2023-11-02 08:00:00', NULL, 'At Store', N'Số 1 Đại Cồ Việt', 
'At Store', N'Số 1 Đại Cồ Việt', 'Cancelled', 0, NULL, 'assets/img/identity/default_f.jpg', 'assets/img/identity/default_b.jpg',
'assets/img/license/default_f.jpg', 'assets/img/license/default_b.jpg');

INSERT INTO Transactions (BookingID, Amount, Type, Method, Message, TransactionsStatus) VALUES 
(1, 500000.00, 'Deposit', 'Transfer', N'Cọc đơn 1', 'Success'),
(2, 200000.00, 'Deposit', 'Cash', N'Cọc đơn 2', 'Success'),
(3, 1000000.00, 'Deposit', 'Transfer', N'Cọc đơn 3', 'Success'),
(4, 300000.00, 'Deposit', 'E-Wallet', N'Cọc đơn 4', 'Success');

INSERT INTO Invoices (BookingID, RentFee, TotalExtraFee, DepositUsed, TotalAmount, InvoiceStatus) VALUES 
(1, 300000.00, 50000.00, 350000.00, 350000.00, 'Paid'),
(2, 120000.00, 280000.00, 200000.00, 400000.00, 'Paid');

INSERT INTO ExtraFee (InvoicesID, type, amount, note) VALUES 
(1, N'Late Return', 50000.00, N'Trễ 1.5h'),
(2, N'Late Return', 80000.00, N'Trễ 6h'),
(2, N'Damage', 200000.00, N'Vỡ gương');

INSERT INTO Transactions (BookingID, InvoicesID, Amount, Type, Method, Message, TransactionsStatus) VALUES 
(1, 1, 150000.00, 'Refund', 'Transfer', N'Hoàn cọc thừa đơn 1', 'Success'),
(2, 2, 200000.00, 'Payment', 'Cash', N'Thu thêm đơn 2', 'Success'),
(4, NULL, 300000.00, 'Refund', 'E-Wallet', N'Hoàn tiền hủy đơn 4', 'Success');

UPDATE Transactions SET InvoicesID = 1 WHERE TransactionID = 1;
UPDATE Transactions SET InvoicesID = 2 WHERE TransactionID = 2;

INSERT INTO Feedback (rating, comment, reply, AccountsID, booking_id, BikeID) VALUES 
(5, N'Dịch vụ tốt!', N'Cảm ơn bạn!', 2, 1, 1);
GO

-- Kiểm tra
SELECT * FROM Accounts;
SELECT * FROM Bike;
SELECT * FROM Booking;
SELECT * FROM Invoices;
SELECT * FROM Transactions;
SELECT * FROM ExtraFee;
SELECT * FROM Feedback;