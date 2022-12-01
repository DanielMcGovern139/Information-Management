DROP DATABASE IF EXISTS `sql_hr`;
CREATE DATABASE `sql_hr`;
USE `sql_hr`;

CREATE TABLE Factory(
factory_id INTEGER NOT NULL,
address VARCHAR(50) NOT NULL,
total_staff INTEGER,
total_machinery INTEGER,
total_vehicles INTEGER,
vehicles_available INTEGER,
PRIMARY KEY (factory_id),
CONSTRAINT check_factory CHECK(factory_id > 0 AND factory_id < 7),
CONSTRAINT check_vehicles CHECK((total_vehicles >= vehicles_available))
);

INSERT INTO Factory VALUES (1, 'Dublin', 100, 20, 15, 15);

#select * from sql_hr.Factory;
CREATE TABLE Employee(
employee_id INTEGER NOT NULL,
ppsn VARCHAR(20) NOT NULL UNIQUE,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
DOB VARCHAR(30) NOT NULL,
role VARCHAR(50) NOT NULL,
PRIMARY KEY (employee_id),
CONSTRAINT check_id_valid CHECK((employee_id>= 99) AND (employee_id) <= 1000),
CONSTRAINT check_ppsn_valid CHECK((LENGTH(ppsn) > 7) AND (LENGTH(ppsn) <= 9)),
CONSTRAINT check_role_valid CHECK (role IN ('Driver', 'Manager', 'Machine Operator', 'Engineer'))
);

INSERT INTO Employee VALUES (100, '9220940A', 'Emmitt', 'Finnegan', '1973-01-22', 'Manager');
INSERT INTO Employee VALUES (101, '9220941B', 'Mary', 'Adams', '1982-08-05','Machine Operator');
INSERT INTO Employee VALUES (102, '9220942C', 'Jack', 'Ryan', '1979-07-10','Engineer');
INSERT INTO Employee VALUES (103, '9220943D', 'David ', 'Carroll','1989-11-17', 'Driver');
INSERT INTO Employee VALUES (104, '9220944E', 'Harvey', 'Gallager', '1971-11-21','Driver');
INSERT INTO Employee VALUES (105, '9220945F', 'Michele', 'Ridge', '1993-12-21','Manager');
INSERT INTO Employee VALUES (106, '9220946G', 'Sandra', 'Farrell', '1962-03-23', 'Machine Operator');
INSERT INTO Employee VALUES (107, '9220947H', 'Jamie', 'Dempsey', '1981-03-03' , 'Driver');
INSERT INTO Employee VALUES (108, '9220948I', 'Patricia', 'Flavin',  '1987-08-10','Machine Operator');
INSERT INTO Employee VALUES (109, '9220949J', 'Steven', 'Porter',  '1976-05-08','Driver');
INSERT INTO Employee VALUES (110, '9220911K', 'David', 'Kelly', '1981-09-21','Driver');
INSERT INTO Employee VALUES (111, '9220921L', 'Seamus', 'Jennings', '1978-02-01','Driver');
INSERT INTO Employee VALUES (112, '9220931M', 'James', 'Kavanagh', '1969-12-10', 'Engineer');
INSERT INTO Employee VALUES (113, '9220831N', 'Jay', 'Furey', '1969-07-10', 'Engineer');
INSERT INTO Employee VALUES (114, '9220948O', 'Conor', 'Gall',  '1985-07-11','Machine Operator');
INSERT INTO Employee VALUES (115, '9220948P', 'Jack', 'Caoimh',  '1975-05-01','Machine Operator');
INSERT INTO Employee VALUES (116, '9220948Q', 'John', 'Obrien',  '1966-04-05','Machine Operator');
INSERT INTO Employee VALUES (117, '9220948R', 'Martin', 'Salbaoz',  '1981-03-08','Machine Operator');
INSERT INTO Employee VALUES (118, '9220948S', 'Amy', 'Stephenson',  '1977-02-23','Machine Operator');

#select * from sql_hr.Employee;
CREATE TABLE Customer(
customer_account_no  VARCHAR(20) NOT NULL UNIQUE,
customer_name VARCHAR(50) NOT NULL,
customer_address VARCHAR(150) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
customer_size VARCHAR(20) NOT NULL,
PRIMARY KEY (customer_account_no),
CONSTRAINT check_customer_type CHECK (customer_type IN ('Hotel','Hospital')),
CONSTRAINT check_customer_size CHECK (customer_size IN ('Large','Medium','Small'))
);

INSERT INTO Customer VALUES (14687, 'Tallaght Hospital', 'Tallaght, Dublin 24, D24 NR0A', 'Hospital', 'Large');
INSERT INTO Customer VALUES (23786, 'St. James', 'Dublin 8, D08 NHY1', 'Hospital', 'Large');
INSERT INTO Customer VALUES (78965,'St Vincents Private', 'Elm Park Dublin 4. D04 T6F4 ', 'Hospital', 'Large');
INSERT INTO Customer VALUES (78966,'St Vincents Public', 'Elm Park Dublin 4. D04 T6F4 ', 'Hospital', 'Large');
INSERT INTO Customer VALUES (25648,'Blackrock Clinic', 'Rock Rd, Blackrock, Dublin, A94 E4X7', 'Hospital', 'Large');
INSERT INTO Customer VALUES (08764, 'Kinsale Hospital', 'Main Street, Cork', 'Hospital', 'Medium');
INSERT INTO Customer VALUES (27890, 'Cork University Hospital', 'Main Street, Cork, T12 DC4A','Hospital','Large');
INSERT INTO Customer VALUES (23769, 'Shelbourne Hotel', 'Stephens Green Dublin', 'Hotel', 'Medium');
INSERT INTO Customer VALUES (78514, 'Fota Island Resort', 'Little Island Cork', 'Hotel', 'Large');
INSERT INTO Customer VALUES (54389,'Radisson Blu Sligo', 'Ballincar, Rosses Point', 'Hotel', 'Large');
INSERT INTO Customer VALUES (18943,'Galway Bay Hotel', ' Upper Salthill, Galway, H91 W295','Hotel', 'Medium');
INSERT INTO Customer VALUES (15648,'Druids Glen Resort', 'Leabeg Upper, Newtown Mount Kennedy, Co. Wicklow, A63 DW08','Hotel','Medium');
INSERT INTO Customer VALUES (08763, 'Jurys Inn', 'Great Victoria St, Belfast BT1 6DY, UK', 'Hotel', 'Medium');
INSERT INTO Customer VALUES (33333, 'Fitzwilliam TownHouse', '41 Fitzwilliam Street Upper, Dublin 2, D02 PW71','Hotel', 'Small');
INSERT INTO Customer VALUES (27654, 'Travelodge Blanchardstown', 'Blanchardstown road Dublin','Hotel', 'Medium');

#select *from sql_hr.Customer;

CREATE TABLE Vehicle(
vehicle_id INTEGER NOT NULL,
vehicle_reg VARCHAR(50) NOT NULL,
vehicle_type VARCHAR(50) NOT NULL,
driver INTEGER NOT NULL,
service_date VARCHAR(20) NOT NULL,
PRIMARY KEY (vehicle_id),
FOREIGN KEY (driver) REFERENCES Employee(employee_id)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

INSERT INTO Vehicle VALUES (1, '151-D-123', 'Lorry', 103,'01-01-2023');
INSERT INTO Vehicle VALUES (2, '131-D-124', 'Lorry', 104, '01-01-2023');
INSERT INTO Vehicle VALUES (3, '131-D-125', 'Van', 107, '01-01-2023');
INSERT INTO Vehicle VALUES (4, '131-D-126', 'Lorry', 110, '01-01-2023');
INSERT INTO Vehicle VALUES (5, '131-C-127', 'Lorry', 111, '01-01-2023');
INSERT INTO Vehicle VALUES (6, '131-C-128', 'Van',109, '01-01-2023');

CREATE TABLE Orders(
Order_id INTEGER NOT NULL UNIQUE,
Customer_id VARCHAR(20) NOT NULL UNIQUE,
driver INTEGER NOT NULL,
vehicle INTEGER NOT NULL,
status VARCHAR(40) NOT NULL DEFAULT 'Not Delivered',
towels_order INTEGER,
sheets_order INTEGER,
pillowcases_order INTEGER,
Duvet_Covers_order INTEGER,
PRIMARY KEY (Order_id),
FOREIGN KEY (Customer_id) REFERENCES Customer(customer_account_no)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (driver) REFERENCES Employee(employee_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (vehicle) REFERENCES Vehicle(vehicle_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
CONSTRAINT check_towels CHECK (towels_order < 5000),
CONSTRAINT check_sheets CHECK (sheets_order < 5000),
CONSTRAINT check_pillowcases CHECK (pillowcases_order < 5000),
CONSTRAINT check_duvets CHECK (Duvet_Covers_order < 5000),
CONSTRAINT check_status CHECK (status IN ('Delivered','Not Delivered'))
);


INSERT INTO Orders VALUES (1, 14687, 111, 1, 'Not Delivered', 2000, 1000, 500, 500);
INSERT INTO Orders VALUES (2, 23786, 110, 2, 'Not Delivered', 2000, 1000, 500, 500);
INSERT INTO Orders VALUES (3, 08764, 109, 4, 'Not Delivered', 1000, 800, 700, 500);
INSERT INTO Orders VALUES (4, 27890, 104, 5, 'Delivered', 2500, 1000, 2500, 500);
INSERT INTO Orders VALUES (5, 23769, 109, 5, 'Delivered', 2100, 1900, 1000, 500);
INSERT INTO Orders VALUES (6, 15648, 104, 1, 'Not Delivered', 1000, 800, 400, 500);
INSERT INTO Orders VALUES (7, 78514, 111, 2, 'Not Delivered', 1000, 1000, 500, 500);
INSERT INTO Orders VALUES (8, 33333, 110, 4, 'Not Delivered', 200, 200, 200, 200);



CREATE TABLE Supplier(
supplier_id INTEGER NOT NULL,
supplier_name VARCHAR(50) NOT NULL,
supplier_address VARCHAR(50) NOT NULL,
contact VARCHAR(50) NOT NULL,
supply VARCHAR(50) NOT NULL,
PRIMARY KEY (supplier_id)
);

INSERT INTO Supplier VALUES (1, 'Jensen', '1 whiteshall, London, England','jensen@gmail.com', 'Machinery');
INSERT INTO Supplier VALUES (2, 'Win Wash Systems', 'Grove, Dublin', 'WinWash@gmail.com', 'Software');
INSERT INTO Supplier VALUES (3, 'Linen Care', 'Cairo, Egypt', 'LinenCare@gmail.com','Linen');
INSERT INTO Supplier VALUES (4, 'Ecolab', 'Kent, England', 'Ecolab@gmail.com','Wash Produvts');

CREATE TABLE Linen(
linen_id INTEGER,
linen_type VARCHAR(50) NOT NULL,
bleach_type VARCHAR(30) NOT NULL,
total_amount INTEGER,
amount_available INTEGER,
PRIMARY KEY (linen_id)
);

INSERT INTO Linen VALUES (1, 'Towels', '1bb', 100000, 100000);
INSERT INTO Linen VALUES (2, 'Sheets', '1aa', 100000, 100000);
INSERT INTO Linen VALUES (3, 'Duvet Covers', '2aa', 100000, 100000);
INSERT INTO Linen VALUES (4, 'Pillowcases', '21a', 100000, 100000);

CREATE TABLE Machinery(
machinery_id INTEGER NOT NULL,
machinery_name VARCHAR(50) NOT NULL,
supplied_by INTEGER,
service_date VARCHAR(20) NOT NULL,
qualified_technicnians INTEGER NOT NULL,
employee_working_on_machine INTEGER NOT NULL,
PRIMARY KEY (machinery_id),
FOREIGN KEY (supplied_by) REFERENCES Supplier(supplier_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (qualified_technicnians) REFERENCES Employee(employee_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (employee_working_on_machine) REFERENCES Employee(employee_id)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

INSERT INTO Machinery VALUES (1, 'Tunnel Washer 1', 1, '01-01-2023', 112, 101);
INSERT INTO Machinery VALUES (2, 'Tunnel Washer 2', 1, '01-01-2023', 112, 106);
INSERT INTO Machinery VALUES (3, 'Tunnel Washer 3', 1, '01-01-2023', 112, 108);
INSERT INTO Machinery VALUES (4, 'Conveyer Belts', 2, '01-01-2023', 112, 114);
INSERT INTO Machinery VALUES (5, 'Ironer 1', 1, '01-01-2023', 112, 115);
INSERT INTO Machinery VALUES (6, 'Ironer 2', 1, '01-01-2023', 112, 116);
INSERT INTO Machinery VALUES (7, 'Ironer 3', 1, '01-01-2023', 112, 117);
INSERT INTO Machinery VALUES (8, 'Towel Presser', 1, '01-01-2023',112, 118);


#select *from sql_hr.Machinery;

CREATE TRIGGER addStaff
AFTER INSERT ON Employee
FOR EACH ROW
  UPDATE Factory
    SET total_staff = total_staff + 1;

CREATE TRIGGER addMachinery
AFTER INSERT ON Machinery
FOR EACH ROW
  UPDATE Factory
    SET total_machinery = total_machinery + 1;
    
CREATE TRIGGER addVehicle
AFTER INSERT ON Vehicle
FOR EACH ROW
  UPDATE Factory
    SET total_vehicles = total_vehicles + 1;

CREATE TRIGGER vehicles
AFTER INSERT ON Orders
FOR EACH ROW
  UPDATE Factory
    SET vehicles_available = vehicles_available - 1;

CREATE TRIGGER Towel_update
AFTER INSERT ON Orders
FOR EACH ROW 
  UPDATE Linen
    SET amount_available = amount_available - NEW.towels_order
    WHERE linen_id = 1;
  
CREATE TRIGGER sheets_update
AFTER INSERT ON Orders
FOR EACH ROW
  UPDATE Linen
    SET amount_available = amount_available - NEW.sheets_order
    WHERE linen_id = 2;

CREATE TRIGGER pillowcase_update
AFTER INSERT ON Orders
FOR EACH ROW
  UPDATE Linen
    SET amount_available = amount_available - NEW.Duvet_Covers_order
    WHERE linen_id = 3;
    
CREATE TRIGGER duvet_cover_update
AFTER INSERT ON Orders
FOR EACH ROW 
  UPDATE Linen
    SET amount_available = amount_available - NEW.pillowcases_order
    WHERE linen_id = 4;

CREATE VIEW drivers_assigned_vehicles AS
SELECT Employee.first_name AS 'Driver First Name',
 Employee.last_name AS 'Driver Last Name',
 Employee.ppsn AS 'Driver PPSN',
 Vehicle.driver AS 'Driver Employee Number',
 Vehicle.vehicle_reg  AS 'Vehicle Registration'
FROM Vehicle
INNER JOIN Employee ON Vehicle.driver=Employee.employee_id;

CREATE VIEW drivers_assigned_orders AS
SELECT Employee.first_name AS 'Driver First Name',
	   Employee.last_name AS 'Driver Last Name',
       Orders.order_id AS 'Customer Delivery',
       Orders.status AS 'Status of delivery'
FROM Orders
INNER JOIN Employee ON Orders.driver = Employee.employee_id;

CREATE VIEW employee_assigned_machines AS
SELECT Employee.first_name AS 'First Name',
	   Employee.last_name AS 'Last Name',
       Machinery.machinery_name AS 'Machine Name'
FROM Machinery
INNER JOIN Employee ON Machinery.employee_working_on_machine = Employee.employee_id;

CREATE VIEW customer_order AS
SELECT Customer.customer_name AS 'Customer Name',
	   Orders.towels_order AS 'Towels Ordered',
       Orders.sheets_order AS 'Sheets Ordered',
       Orders.pillowcases_order AS 'Pillowcases Ordered',
       Orders.Duvet_Covers_order AS 'Duvet covers ordered'
FROM Orders
INNER JOIN Customer ON Orders.customer_id = Customer.customer_account_no;

#SELECT * FROM customer_order;

UPDATE Orders
SET 
   towels_order = towels_order - 500
   WHERE order_id = 3;

UPDATE Employee
SET 
   role = 'Engineer'
   WHERE employee_id = 105;

UPDATE Linen
SET 
   total_amount = total_amount + 10000
   Where linen_id = 1;

#select *from sql_hr.Machinery;

CREATE role Manager;
GRANT CREATE ON Employee TO Manager;
GRANT DELETE ON Employee TO Manager; 
GRANT UPDATE ON Employee TO Manager;
GRANT CREATE ON Orders TO Manager;
GRANT DELETE ON Orders TO Manager; 
GRANT UPDATE ON Orders TO Manager;
GRANT CREATE ON Customer TO Manager;
GRANT DELETE ON Customer TO Manager; 
GRANT UPDATE ON Customer TO Manager;
GRANT CREATE ON Vehicle TO Manager;
GRANT DELETE ON Vehicle TO Manager; 
GRANT UPDATE ON Vehicle TO Manager;
GRANT CREATE ON Supplier TO Manager;
GRANT DELETE ON Supplier TO Manager; 
GRANT UPDATE ON Supplier TO Manager;
GRANT CREATE ON Machinery TO Manager;
GRANT DELETE ON Machinery TO Manager; 
GRANT UPDATE ON Machinery TO Manager;
GRANT CREATE ON Linen TO Manager;
GRANT DELETE ON Linen TO Manager; 
GRANT UPDATE ON Linen TO Manager;

CREATE ROLE Engineer;
GRANT UPDATE ON Machinery TO Engineer;
GRANT UPDATE ON Supplier TO Engineer;

CREATE ROLE Machine_Operator;
GRANT UPDATE ON Machinery TO Machine_Operator;
GRANT UPDATE ON Orders TO Machine_Operator;

CREATE ROLE Driver;
GRANT UPDATE ON vehicles TO Driver;
GRANT UPDATE ON Orders TO Driver;

CREATE USER "Emmitt@localhost"
identified by "Emmitt1";
GRANT INSERT ON Orders TO "Emmitt@localhost";
show grants for "Emmitt@localhost";





