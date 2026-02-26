use Project7
go
drop table if exists Progresses
drop table if exists Registers
drop table if exists Topics
drop table if exists MembersInTeam
drop table if exists Teams
drop table if exists Teachers
drop table if exists Students
drop table if exists Accounts
drop table if exists Roles
create table Roles(
	roleId int primary key,
	roleName varchar(20)
);
create table Accounts(
	email varchar(100) primary key
	check (email like '%@%.%'),
	password varchar(50),
	roleId int,
	foreign key (roleId) references Roles(roleId)
);
create table Students (
	studentId varchar(20) primary key,
	studentName nvarchar(100),
	class varchar(100),
	major varchar(50),
	email varchar(100) references Accounts(email),
);
create table Teachers (
	teacherId varchar(20) primary key,
	teacherName varchar(100),
	email varchar(100) references Accounts(email)
);
create table Teams (
	teamId varchar(20) primary key,
	teamName varchar(100),
	leaderId varchar(20) references Students(studentId)
);
create table MembersInTeam (
	studentId varchar(20) primary key,
	foreign key (studentId) references Students(studentId),
	teamId varchar(20) references Teams(teamId)
);
create table Topics (
	topicId varchar(20) primary key,
	topicName varchar(100),
	teacherId varchar(20) references Teachers(teacherId),
	topicStatus varchar(20) default 'Still Receiving' 
	check (topicStatus in ('Still Receiving', 'Received'))
);
create table Registers (
	registerId varchar(20) primary key,
	teamId varchar(20) unique,
	foreign key (teamId) references Teams(teamId),
	topicId varchar(20) references Topics(topicId),
	registerDate datetime,
	registerStatus varchar(20) default 'Awaiting Approval'
	check (registerStatus in ('Awaiting Approval', 'Approved', 'Rejected'))
);
create table Progresses (
	progressId varchar(20) primary key,
	teamId varchar(20) references Teams(teamId),
	progressContent nvarchar(500),
	submitDate datetime
);

GO
-- =====================
-- INSERT ROLES
-- =====================
INSERT INTO Roles VALUES
(1, 'Admin'),
(2, 'Teacher'),
(3, 'Student');

-- =====================
-- INSERT ACCOUNTS
-- =====================
INSERT INTO Accounts VALUES
('a@gmail.com', '123', 3),
('b@gmail.com', '123', 3),
('c@gmail.com', '123', 3),
('d@gmail.com', '123', 3),
('e@gmail.com', '123', 3),
('teacher1@gmail.com', '123', 2),
('teacher2@gmail.com', '123', 2);

-- =====================
-- INSERT STUDENTS
-- =====================
INSERT INTO Students VALUES
('S01', N'Nguyen Van A', 'SE1701', 'Software Engineering', 'a@gmail.com'),
('S02', N'Tran Thi B', 'SE1701', 'Software Engineering', 'b@gmail.com'),
('S03', N'Tran Thi D', 'SE1703', 'Software Engineering', 'd@gmail.com'),
('S04', N'Tran Thi E', 'SE1704', 'Software Engineering', 'e@gmail.com'),
('S05', N'Le Van C', 'SE1702', 'Information Technology', 'c@gmail.com');

-- =====================
-- INSERT TEACHERS
-- =====================
INSERT INTO Teachers VALUES
('GV01', 'Dr. Nguyen Van X', 'teacher1@gmail.com'),
('GV02', 'Dr. Tran Thi Y', 'teacher2@gmail.com');

-- =====================
-- INSERT TEAMS
-- =====================
INSERT INTO Teams VALUES
('T01', 'Team Alpha', 'S01'),
('T02', 'Team Beta', 'S02'),
('T03', 'Team Gamma', 'S03');

-- =====================
-- INSERT MembersInTeam
-- =====================
INSERT INTO MembersInTeam VALUES
('S01', 'T01'),
('S02', 'T02'),
('S03', 'T02'),
('S04', 'T03');

-- =====================
-- INSERT TOPICS
-- =====================
INSERT INTO Topics VALUES
('TP01', 'AI Research System', 'GV01', 'Still Receiving'),
('TP02', 'E-Learning Website', 'GV02', 'Received');

-- =====================
-- INSERT REGISTERS
-- =====================
INSERT INTO Registers VALUES
('R01', 'T01', 'TP01', GETDATE(), 'Approved'),
('R02', 'T02', 'TP02', GETDATE(), 'Awaiting Approval');

-- =====================
-- INSERT PROGRESSES
-- =====================
INSERT INTO Progresses VALUES
('P01', 'T01', N'Completed database design and ERD.', GETDATE()),
('P02', 'T02', N'Finished UI and login function.', GETDATE());