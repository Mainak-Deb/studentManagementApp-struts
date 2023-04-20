package com.student.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.student.form.CreateUserForm;

public class StudentDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public StudentDAO() {
        this.jdbcURL = "jdbc:mysql://localhost:3306/student_master";
        this.jdbcUsername = "root";
        this.jdbcPassword = "root";
    }

    // Establishes a database connection
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    // Closes the database connection
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // Inserts a new student record into the database
    public boolean insertStudent(CreateUserForm student) throws SQLException {
        String sql = "INSERT INTO student_details (full_name, college_name, university_name, dob, section, department, gender, email ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        
        statement.setString(1, student.getFullName());
        statement.setString(2, student.getCollegeName());
        statement.setString(3, student.getUniversityName());
        statement.setString(4, student.getDateOfBirth());
        statement.setString(5, student.getSection());
        statement.setString(6, student.getStream());
        statement.setString(7, student.getGender());
        statement.setString(8, student.getStudentEmail());
        
        

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    // Retrieves a student record from the database using the student ID
    public CreateUserForm getStudent(String studentId) throws SQLException {
    	CreateUserForm student = null;
        String sql = "SELECT * FROM student_details WHERE student_id = '"+studentId+"'";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String fullName = resultSet.getString("full_name");
            String collegeName = resultSet.getString("college_name");
            String universityName = resultSet.getString("university_name");
            String dateOfBirth = resultSet.getString("dob");
            String section = resultSet.getString("section");
            String department = resultSet.getString("department");
            String gender = resultSet.getString("gender");
            String studentEmail = resultSet.getString("email");
            
            student =this.makeStudent (fullName, collegeName, universityName, dateOfBirth, section, department, gender, studentEmail);
        }
        resultSet.close();
        statement.close();
        disconnect();
        return student;
    }
    

    public List<CreateUserForm> getAllStudents() throws SQLException {
        List<CreateUserForm> students = new ArrayList<>();
        String sql = "SELECT * FROM student_details";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            String fullName = resultSet.getString("full_name");
            String collegeName = resultSet.getString("college_name");
            String universityName = resultSet.getString("university_name");
            String dateOfBirth = resultSet.getString("dob");
            String section = resultSet.getString("section");
            String department = resultSet.getString("department");
            String gender = resultSet.getString("gender");
            String studentEmail = resultSet.getString("email");
            CreateUserForm  newStudent = this.makeStudent( fullName, collegeName, universityName, dateOfBirth, section, department, gender, studentEmail);
            students.add(newStudent);
        }
        resultSet.close();
        statement.close();
        disconnect();
        
    	return students;
    }

    public CreateUserForm makeStudent( String fullName, String collegeName, String universityName,
            String dateOfBirth, String section, String stream , String gender, String studentEmail) {
    	CreateUserForm student = new CreateUserForm();
    	
    	student.setFullName(fullName);
    	student.setCollegeName(collegeName);
    	student.setUniversityName(universityName);
    	student.setDateOfBirth(dateOfBirth);
    	student.setSection(section);
    	student.setStream(stream);
    	student.setGender(gender);
    	student.setStudentEmail(studentEmail);
    	
    	return student;
    }
    
    
   
}