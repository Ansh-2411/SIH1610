use edusign;
-- Students Table
CREATE TABLE Students (
    student_id INT  AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(50) NOT NULL,
    address VARCHAR(200),
    phone_number VARCHAR(20),
    assigned_teacher_id INT,
    parent_id INT,
    FOREIGN KEY (assigned_teacher_id) REFERENCES Teachers(teacher_id)
		ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (parent_id) REFERENCES Parents(parent_id)
);

CREATE TABLE AttendanceRecord (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('present', 'absent') NOT NULL,
    remark VARCHAR(200),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Teachers Table
CREATE TABLE Teachers (
    teacher_id INT  AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    subject_taught VARCHAR(50) NOT NULL
);

-- Parents Table
CREATE TABLE Parents (
    parent_id INT  AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    children VARCHAR(500)
);

-- HR Table
CREATE TABLE HR (
    hr_id INT  AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Assignments Table
CREATE TABLE Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    due_date DATE NOT NULL,
    uploaded_by INT NOT NULL,
    FOREIGN KEY (uploaded_by) REFERENCES Teachers(teacher_id)
);

-- SignLanguageTutorials Table
CREATE TABLE SignLanguageTutorials (
    tutorial_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    video_link VARCHAR(200) NOT NULL,
    difficulty_level INT NOT NULL
);

-- SignLanguageRecognition Table
CREATE TABLE SignLanguageRecognition (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    sign_captured VARCHAR(100) NOT NULL,
    recognized_text VARCHAR(100),
    recognized_speech VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);