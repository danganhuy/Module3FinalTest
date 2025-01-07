DROP DATABASE IF EXISTS module_3_final_test;
CREATE DATABASE module_3_final_test;
USE module_3_final_test;

CREATE TABLE Products (
  productId INT AUTO_INCREMENT PRIMARY KEY,
  productName VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  discount int DEFAULT 0 CHECK (discount >= 0 AND discount < 100),
  stock INT NOT NULL DEFAULT 0,
  description TEXT
);

CREATE TABLE Employees (
  employeeId INT AUTO_INCREMENT PRIMARY KEY,
  fullName VARCHAR(50) NOT NULL,
  dateOfBirth DATE,
  phoneNumber VARCHAR(20),
  address VARCHAR(255)
);

CREATE TABLE Customers (
  customerId INT AUTO_INCREMENT PRIMARY KEY,
  fullName VARCHAR(50) NOT NULL,
  dateOfBirth DATE,
  phoneNumber VARCHAR(20),
  address VARCHAR(255),
  email VARCHAR(100) UNIQUE
);

CREATE TABLE Orders (
  orderId INT AUTO_INCREMENT PRIMARY KEY,
  paymentMethod VARCHAR(50) NOT NULL,
  customerId INT,
  employeeId INT,
  orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  deliveryDate DATETIME,
  deliveryAddress VARCHAR(255) NOT NULL,
  FOREIGN KEY (customerId) REFERENCES Customers(customerId),
  FOREIGN KEY (employeeId) REFERENCES Employees(employeeId)
);

CREATE TABLE OrderDetails (
  orderId INT,
  productId INT,
  quantity INT NOT NULL,
  PRIMARY KEY (orderId,productId),
  FOREIGN KEY (orderId) REFERENCES Orders(orderId),
  FOREIGN KEY (productId) REFERENCES Products(productId)
);

INSERT INTO Products (productName, price, discount, stock, description) VALUES
('Sản phẩm A', 100.00, 10, 50, 'Mô tả sản phẩm A'),
('Sản phẩm B', 150.50, 15, 30, 'Mô tả sản phẩm B'),
('Sản phẩm C', 200.00, 5, 20, 'Mô tả sản phẩm C'),
('Sản phẩm D', 250.75, 10, 10, 'Mô tả sản phẩm D'),
('Sản phẩm E', 300.00, 10, 5, 'Mô tả sản phẩm E'),
('Sản phẩm F', 350.25, 0, 15, 'Mô tả sản phẩm F'),
('Sản phẩm G', 400.50, 20, 25, 'Mô tả sản phẩm G'),
('Sản phẩm H', 450.00, 10, 12, 'Mô tả sản phẩm H'),
('Sản phẩm I', 500.00, 25, 8, 'Mô tả sản phẩm I'),
('Sản phẩm J', 550.00, 10, 0, 'Mô tả sản phẩm J');

INSERT INTO Employees (fullName, dateOfBirth, phoneNumber, address) VALUES
('Nguyễn Văn A', '1980-01-15', '0901234567', 'Địa chỉ A'),
('Trần Thị B', '1985-03-22', '0902345678', 'Địa chỉ B'),
('Lê Văn C', '1990-05-10', '0903456789', 'Địa chỉ C'),
('Phạm Thị D', '1975-07-18', '0904567890', 'Địa chỉ D'),
('Hoàng Văn E', '1982-09-30', '0905678901', 'Địa chỉ E'),
('Vũ Thị F', '1995-11-05', '0906789012', 'Địa chỉ F'),
('Đỗ Văn G', '1988-12-12', '0907890123', 'Địa chỉ G'),
('Bùi Thị H', '1992-02-20', '0908901234', 'Địa chỉ H'),
('Phan Văn I', '1981-04-17', '0909012345', 'Địa chỉ I'),
('Trịnh Thị K', '1979-06-25', '0900123456', 'Địa chỉ K');

INSERT INTO Customers (fullName, dateOfBirth, phoneNumber, address, email) VALUES
('Khách Hàng 1', '1990-01-01', '0911111111', 'Địa chỉ 1', 'kh1@example.com'),
('Khách Hàng 2', '1991-02-02', '0922222222', 'Địa chỉ 2', 'kh2@example.com'),
('Khách Hàng 3', '1992-03-03', '0933333333', 'Địa chỉ 3', 'kh3@example.com'),
('Khách Hàng 4', '1993-04-04', '0944444444', 'Địa chỉ 4', 'kh4@example.com'),
('Khách Hàng 5', '1994-05-05', '0955555555', 'Địa chỉ 5', 'kh5@example.com'),
('Khách Hàng 6', '1995-06-06', '0966666666', 'Địa chỉ 6', 'kh6@example.com'),
('Khách Hàng 7', '1996-07-07', '0977777777', 'Địa chỉ 7', 'kh7@example.com'),
('Khách Hàng 8', '1997-08-08', '0988888888', 'Địa chỉ 8', 'kh8@example.com'),
('Khách Hàng 9', '1998-09-09', '0999999999', 'Địa chỉ 9', 'kh9@example.com'),
('Khách Hàng 10', '1999-10-10', '0900000000', 'Địa chỉ 10', 'kh10@example.com');

INSERT INTO Orders (paymentMethod, customerId, employeeId, orderDate, deliveryDate, deliveryAddress) VALUES
('Tiền mặt', 1, 1, '2023-01-01 10:00:00', '2023-01-05 12:00:00', 'Địa chỉ giao hàng 1'),
('Thẻ tín dụng', 2, 2, '2023-02-01 11:00:00', '2023-02-06 13:00:00', 'Địa chỉ giao hàng 2'),
('Chuyển khoản', 3, 3, '2023-03-01 12:00:00', '2023-03-07 14:00:00', 'Địa chỉ giao hàng 3'),
('Tiền mặt', 4, 4, '2023-04-01 13:00:00', '2023-04-08 15:00:00', 'Địa chỉ giao hàng 4'),
('Thẻ tín dụng', 5, 5, '2023-05-01 14:00:00', '2023-05-09 16:00:00', 'Địa chỉ giao hàng 5'),
('Chuyển khoản', 6, 6, '2023-06-01 15:00:00', '2023-06-10 17:00:00', 'Địa chỉ giao hàng 6'),
('Tiền mặt', 7, 7, '2023-07-01 16:00:00', '2023-07-11 18:00:00', 'Địa chỉ giao hàng 7'),
('Thẻ tín dụng', 8, 8, '2023-08-01 17:00:00', '2023-08-12 19:00:00', 'Địa chỉ giao hàng 8'),
('Chuyển khoản', 9, 9, '2023-09-01 18:00:00', '2023-09-13 20:00:00', 'Địa chỉ giao hàng 9'),
('Tiền mặt', 10, 10, '2023-10-01 19:00:00', '2023-10-14 21:00:00', 'Địa chỉ giao hàng 10');

INSERT INTO OrderDetails (orderId, productId, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 4),
(2, 4, 2),
(3, 5, 1),
(3, 1, 3),
(4, 2, 2),
(5, 3, 1),
(6, 4, 5),
(7, 5, 2);
