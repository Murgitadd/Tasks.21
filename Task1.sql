-- 1

CREATE DATABASE RolesNCategories

USE RolesNCategories

CREATE TABLE Users(
 Id INT PRIMARY KEY identity,
Username varchar(50),
[Password] nvarchar(50)
);


CREATE TABLE Roles(
 Id INT PRIMARY KEY identity,
[Name] varchar(50)
);

CREATE TABLE UserRole(
Id INT PRIMARY KEY identity,
UserId int REFERENCES [Users](Id),
RoleId int REFERENCES Roles (Id)
);

INSERT INTO Users (Username, [Password]) VALUES
('Murad', '12345678'),
('Subhan', '345246357'),
('Vagif', '324mj6453'),
('Adil', 'dsafdgs'),
('Sabir', 'qwertyu');

INSERT INTO Roles ([Name]) VALUES
('Admin'),
('User'),
('Guest');

SELECT U.Username, R.[Name] AS [Role]
FROM Users U
JOIN UserRole UR ON U.Id = UR.UserId
JOIN Roles R ON UR.RoleId = R.Id;

INSERT INTO UserRole (UserId, RoleId)
values (1,3), (2,2), (3,2), (4,3), (5,2)

DROP TABLE UserRole;
------------------------------------------------------
--====================================================
------------------------------------------------------
-- 2

CREATE TABLE Products (
Id INT PRIMARY KEY identity,
[Name] varchar(50),
Price decimal,
Cost decimal
);

CREATE TABLE Categories (
Id INT PRIMARY KEY identity,
[Name] varchar(50)
);

CREATE TABLE Colors (
Id INT PRIMARY KEY identity,
[Name] varchar(50)
);

CREATE TABLE MyShop(
Id INT PRIMARY KEY identity,
PriductId int REFERENCES Products(Id),
CategoryId int REFERENCES Categories(Id),
ColorId int REFERENCES Colors(Id)
);

INSERT INTO Products ([Name], Price, Cost) VALUES
('Bag', 30, 25),
('Shirt', 50, 35),
('Phone', 100, 80),
('Perfume', 93,80),
('Missille', 5000, 4000);

INSERT INTO Categories ([Name]) VALUES
('Travel'),
('Electronics'),
('Artilery');

INSERT INTO Colors ([Name]) VALUES
('Blue'),
('Red'),
('Green'),
('Yellow');

INSERT INTO MyShop(PriductId, CategoryId, ColorId)
values (1,1,1), (2,1,2), (2,3,3), (3,2,1), (4,1,4), (5,3,3)

SELECT
    P.[Name] AS ProductName,
    C.[Name] AS CategoryName,
    Co.[Name] AS ColorName
FROM
    Products P
JOIN
    MyShop MS ON P.Id = MS.PriductId
JOIN
    Categories C ON MS.CategoryId = C.Id
JOIN
    Colors Co ON MS.ColorId = Co.Id;
