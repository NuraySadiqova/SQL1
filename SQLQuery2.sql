CREATE DATABASE CompanyDB 
USE CompanyDB

CREATE TABLE Departments (
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50) NOT NULL,
Location NVARCHAR(50) ,
)

CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY(1,1),
FullName NVARCHAR(50) NOT NULL,
Salary DECIMAL,
DepartmentId INT,
FOREIGN KEY (DepartmentId) REFERENCES Departments(ID) ON DELETE SET NULL
)

CREATE TABLE Projects (
ID INT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(50) NOT NULL,
Budget DECIMAL,
ManagerId INT,
FOREIGN KEY (ManagerId) REFERENCES  Employees(ID) ON DELETE SET NULL
)

CREATE TABLE  EmployeeProjects(
EmployeeId INT ,
FOREIGN KEY (EmployeeId) REFERENCES Employees(ID) ON DELETE CASCADE,
ProjectId INT,
FOREIGN KEY (ProjectId) REFERENCES Projects(ID)ON DELETE CASCADE,
Primary KEy(EmployeeId,ProjectId),
AssignedDate DATE
)

INSERT INTO Departments(NAME)
VALUES
('INSAN RESURSLARI'),
( 'MALIYYE'),
('SEHIYYE')

INSERT INTO Employees( FullName,Salary)
VALUES 
( 'NURAY' , 1000),
( 'GUNEL' , 800),
('AYGUN' , 600)

INSERT INTO Projects(Title, Budget)
VALUES 
( 'ISCI MEMNUNIYYETI' , 3000),
( 'MALIYYE RISKLERI' , 2000),
( 'ELEKTRON SAGLAMLIQ' , 4000)


INSERT INTO EmployeeProjects (EmployeeId, ProjectId)
VALUES
(2,3),
(2,2),
(3,1)

DELETE FROM Departments WHERE Id = 1

DELETE FROM Employees WHERE Id = 2;

DELETE FROM Projects WHERE Id = 3;



SELECT D.ID,
D.Name,COUNT(E.Id)AS EMPLOYEECOUNT FROM Departments D
JOIN Employees E ON E.DepartmentId=D.Id
GROUP BY D.Id,D.Name

SELECT 
E.FullName,P.Title
FROM EmployeeProjects EP
LEFT JOIN Projects  P ON P.ID=EP.ProjectId
LEFT JOIN Employees  E ON E.Id=EP.EmployeeId

SELECT P.Title AS Project,
       E.FullName AS Manager
FROM Projects P
JOIN Employees E ON P.ManagerId = E.Id;

SELECT E.FullName
FROM Employees E
LEFT JOIN EmployeeProjects EP ON E.Id = EP.EmployeeId
WHERE EP.EmployeeId IS NULL;

SELECT FullName
FROM Employees
WHERE DepartmentId IS NULL;


