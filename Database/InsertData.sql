/* =========================
   INSERT DATA – GRADUATION PROJECT
   MATCH 100% ERD
   ========================= */
use Project7
-- 1. Teachers
INSERT INTO Teachers (teacherId, teacherName, email) VALUES
('T01', 'Nguyen Van An', 'an@uni.edu'),
('T02', 'Tran Thi Binh', 'binh@uni.edu'),
('T03', 'Le Van Cuong', 'cuong@uni.edu');

-- 2. Topics (topicStatus default = 'Still Receiving')
INSERT INTO Topics (topicId, topicName, teacherId) VALUES
('TP01', 'Graduation Thesis Management System', 'T01'),
('TP02', 'AI Application in Education', 'T01'),
('TP03', 'E-commerce Website', 'T02'),
('TP04', 'Student Attendance System', 'T02'),
('TP05', 'Library Management System', 'T03');

-- 3. Teams
INSERT INTO Teams (teamId, teamName) VALUES
('N01', 'Team Alpha'),
('N02', 'Team Beta'),
('N03', 'Team Gamma'),
('N04', 'Team Delta');

-- 4. Students (Students CÓ teamId – đúng ERD)
INSERT INTO Students (studentId, studentName, class, major, email, teamId) VALUES
('SV01', 'Le Van Nam',      'CNTT1', 'IT', 'nam@student.edu',  'N01'),
('SV02', 'Nguyen Thi Hoa',  'CNTT1', 'IT', 'hoa@student.edu',  'N01'),

('SV03', 'Pham Minh Duc',   'CNTT2', 'IT', 'duc@student.edu',  'N02'),
('SV04', 'Tran Thi Lan',    'CNTT2', 'IT', 'lan@student.edu',  'N02'),

('SV05', 'Vo Thanh Tung',   'CNTT3', 'IT', 'tung@student.edu', 'N03'),
('SV06', 'Bui Quoc Huy',    'CNTT3', 'IT', 'huy@student.edu',  'N03'),

('SV07', 'Dang Thi Mai',    'CNTT4', 'IT', 'mai@student.edu',  'N04');

-- 5. Registers (Team đăng ký Topic)
INSERT INTO Registers (registerId, teamId, topicId, registerDate, registerStatus) VALUES
('R01', 'N01', 'TP01', '2025-02-01', 'Approved'),
('R02', 'N02', 'TP02', '2025-02-02', 'Approved'),
('R03', 'N03', 'TP03', '2025-02-03', 'Approved'),
('R04', 'N04', 'TP04', '2025-02-04', 'Awaiting Approval');

-- 6. Update topicStatus → Received (topic đã có team đăng ký)
UPDATE Topics
SET topicStatus = 'Received'
WHERE topicId IN ('TP01', 'TP02', 'TP03', 'TP04');

-- 7. Progresses (tiến độ theo team)
INSERT INTO Progresses (progressId, teamId, progressContent, submitDate) VALUES
('P01', 'N01', 'Requirement analysis completed', '2025-03-01'),
('P02', 'N01', 'Database design finished',       '2025-03-10'),

('P03', 'N02', 'Literature review completed',    '2025-03-05'),
('P04', 'N02', 'AI model selected',              '2025-03-15'),

('P05', 'N03', 'UI design completed',            '2025-03-07'),
('P06', 'N03', 'Backend implementation',         '2025-03-18'),

('P07', 'N04', 'Project planning and analysis',  '2025-03-09');