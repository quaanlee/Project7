use Project7
go
drop table if exists FinalMark
drop table if exists MarkTeam
drop table if exists Reports
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
create table Reports (
	teamId varchar(20) references Teams(teamId),
	category varchar(200) check (category in ('Proposal', 'Report 1', 'Report 2', 'FinalReport')),
	primary key (teamId, category),
	filePath varchar(200),
	submitDate datetime,
	deadline datetime
);

create table MarkTeam (
	teamId varchar(20) primary key references Teams(teamId),
	proposal decimal(3, 1),
	report_1 decimal(3, 1),
	report_2 decimal(3, 1),
	finalReport decimal(3, 1),
	total as round((proposal + report_1 + report_2) * 0.1 + finalReport * 0.2, 1)
);

create table FinalMark (
	studentId varchar(20) primary key,
	foreign key (studentId) references Students(studentId),
	teamId varchar(20) references Teams(teamId),
	markPersonal decimal(3, 1),
	total decimal(3, 1),
);

GO
create trigger trg_insert_team 
on Teams
after insert
as begin
	insert into MembersInTeam (studentId, teamId) 
	select i.leaderId, i.teamId
	from inserted i
end;
go
create trigger trg_insert_member
on MembersInTeam
after insert
as begin
	if exists 
	(select 1 from inserted i
	inner join Registers r on r.teamId = i.teamId
	where r.registerStatus = 'Approved')
	begin
		insert into FinalMark (studentId, teamId, markPersonal, total)
		select i.studentId, i.teamId, null, null
		from inserted i
	end;
end;
go
create trigger trg_delete_member
on MembersInTeam
after delete
as begin
	delete FinalMark
	from FinalMark fm inner join deleted d on d.studentId = fm.studentId
end;
go
create trigger trg_update_markTeam
on MarkTeam
after update
as begin
	update FinalMark set total = markPersonal * 0.5 + i.total * 0.5
	from FinalMark f
	inner join inserted i on i.teamId = f.teamId
end;
go
create trigger trg_update_finalMark
on FinalMark
after update
as begin
	update FinalMark set total = i.markPersonal * 0.5 + mt.total * 0.5
	from FinalMark fm
	inner join inserted i on i.teamId = fm.teamId
	inner join MarkTeam mt on i.teamId = mt.teamId
end;
go
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
/*
INSERT INTO MembersInTeam VALUES
('S01', 'T01'),
('S02', 'T02'),
('S03', 'T02'),
('S04', 'T03'); 
*/

-- =====================
-- INSERT TOPICS
-- =====================
INSERT INTO Topics VALUES
('TP01', 'AI Research System', 'GV01', 'Still Receiving'),
('TP02', 'E-Learning Website', 'GV02', 'Still Receiving');

-- =====================
-- INSERT REGISTERS
-- =====================
INSERT INTO Registers VALUES
('R01', 'T01', 'TP01', GETDATE(), 'Awaiting Approval'),
('R02', 'T02', 'TP02', GETDATE(), 'Awaiting Approval');

-- =====================