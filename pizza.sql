SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE DATABASE pizza;

USE pizza;

CREATE TABLE customer (
  customerID int(11) NOT NULL,
  customerEmail varchar(32) NOT NULL,
  customerUsername varchar(16) NOT NULL,
  customerPassword varchar(16) NOT NULL,
  customerConfirmPassword varchar(16) NOT NULL,
  Role varchar(10) NOT NULL,
  fullName varchar(64) DEFAULT NULL,
  address varchar(64) DEFAULT NULL,
  contactNumber varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE employee (
  employeeID int(11) NOT NULL,
  employeeEmail varchar(32) NOT NULL,
  employeeUsername varchar(16) NOT NULL,
  employeePassword varchar(16) NOT NULL,
  employeeConfirmPassword varchar(16) NOT NULL,
  Role varchar(10) NOT NULL,
  fullName varchar(64) DEFAULT NULL,
  address varchar(64) DEFAULT NULL,
  contactNumber varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO employee (employeeID, employeeEmail, employeeUsername, employeePassword, employeeConfirmPassword, Role, fullName, address, contactNumber) VALUES
(1, 'gabby@gmail.com', 'admin', 'admin123', 'admin123', 'Admin', 'Gabby Santiago', 'Quezon City', '22222222222'),
(2, 'maria@gmail.com', 'empMaria', 'emp123', 'emp123', 'Employee', 'Maria Santiago', 'Quezon City', '4534541');

CREATE TABLE ordereditems (
  orderItemID int(11) NOT NULL,
  orderID int(11) NOT NULL,
  pizzaID int(11) NOT NULL,
  quantity int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE orders (
  orderID int(11) NOT NULL,
  customerID int(11) DEFAULT NULL,
  pizzaID int(11) DEFAULT NULL,
  customerTotal int(11) DEFAULT NULL,
  customerPayment int(11) DEFAULT NULL,
  customerChange int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE pizza (
  pizzaID int(11) NOT NULL,
  pizzaFlavor varchar(100) DEFAULT NULL,
  pizzaSizeInch int(100) DEFAULT NULL,
  price int(11) DEFAULT NULL,
  Stocks int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO pizza (pizzaID, pizzaFlavor, pizzaSizeInch, price, Stocks) VALUES
(1, 'Triple Cheesy Supreme', 9, 399, 19),
(2, 'Triple Cheesy Supreme', 12, 629, 18),
(3, 'Seafood Supreme', 9, 399, 19),
(4, 'Seafood Supreme', 12, 629, 18),
(5, 'Super Supreme', 9, 399, 19),
(6, 'Super Supreme', 12, 629, 17),
(7, 'Cheese Supreme', 9, 399, 18),
(8, 'Cheese Supreme', 12, 589, 20);


ALTER TABLE customer
  ADD PRIMARY KEY (customerID);

ALTER TABLE employee
  ADD PRIMARY KEY (employeeID);

ALTER TABLE ordereditems
  ADD PRIMARY KEY (orderItemID),
  ADD KEY orderID (orderID),
  ADD KEY pizzaID (pizzaID);

ALTER TABLE orders
  ADD PRIMARY KEY (orderID),
  ADD KEY pizzaID (pizzaID),
  ADD KEY customerID (customerID);

ALTER TABLE pizza
  ADD PRIMARY KEY (pizzaID);


ALTER TABLE customer
  MODIFY customerID int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE employee
  MODIFY employeeID int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE ordereditems
  MODIFY orderItemID int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE orders
  MODIFY orderID int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE pizza
  MODIFY pizzaID int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE ordereditems
  ADD CONSTRAINT ordereditems_ibfk_1 FOREIGN KEY (orderID) REFERENCES `orders` (orderID),
  ADD CONSTRAINT ordereditems_ibfk_2 FOREIGN KEY (pizzaID) REFERENCES pizza (pizzaID);

ALTER TABLE orders
  ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (pizzaID) REFERENCES pizza (pizzaID) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT orders_ibfk_2 FOREIGN KEY (customerID) REFERENCES customer (customerID) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
