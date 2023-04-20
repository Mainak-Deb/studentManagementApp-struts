show databases;
drop database student_master ;
create database student_master ;
use student_master ;


drop table student_details ;
CREATE TABLE student_details  (
    student_id int Primary key auto_increment,
    full_name VARCHAR(100) NOT NULL,
    college_name VARCHAR(100) NOT NULL,
    university_name VARCHAR(100) NOT NULL,
    dob VARCHAR(10) NOT NULL,
    section VARCHAR(10) NOT NULL,
    department VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(100) 
);

INSERT INTO student_details  ( full_name, college_name, university_name, dob, section, department, gender, email)
VALUES 
( 'John Smith', 'ABC College', 'XYZ University', '1995-03-15', 'A', 'Computer Science', 'Male', 'john.smith@example.com'),
( 'Jane Doe', 'DEF College', 'PQR University', '1997-05-22', 'B', 'Mechanical Engineering', 'Female', 'jane.doe@example.com'),
( 'Alex Johnson', 'GHI College', 'LMN University', '1994-11-01', 'C', 'Electrical Engineering', 'Male', 'alex.johnson@example.com'),
('Sarah Williams', 'JKL College', 'STU University', '1996-02-12', 'D', 'Civil Engineering', 'Female', 'sarah.williams@example.com'),
('Mike Brown', 'MNO College', 'VWX University', '1993-07-29', 'E', 'Chemical Engineering', 'Male', 'mike.brown@example.com'),
( 'Emily Wilson', 'PQR College', 'ABC University', '1998-09-10', 'F', 'Computer Science', 'Female', 'emily.wilson@example.com'),
('David Lee', 'STU College', 'DEF University', '1995-04-18', 'G', 'Mechanical Engineering', 'Male', 'david.lee@example.com'),
( 'Jessica Taylor', 'UVW College', 'GHI University', '1997-01-25', 'H', 'Electrical Engineering', 'Female', 'jessica.taylor@example.com'),
( 'Ryan Wilson', 'XYZ College', 'JKL University', '1994-12-08', 'I', 'Civil Engineering', 'Male', 'ryan.wilson@example.com'),
( 'Amanda Brown', 'ABC College', 'MNO University', '1996-06-05', 'J', 'Chemical Engineering', 'Female', 'amanda.brown@example.com');

select *from student_details ;


drop table user_credential ;

create table user_credential (
	username varchar(100) primary key,
    password varchar(100) not null
);

insert into user_credential (username,password)
	values ( 'admin','admin');
    
select * from user_credential ;


select *from student_details ;
select * from user_credential ;

SELECT * FROM user_credential  WHERE username = 'admin';
