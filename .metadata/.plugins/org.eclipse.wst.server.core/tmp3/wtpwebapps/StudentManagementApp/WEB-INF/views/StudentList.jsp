<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentPortal</title>
<link rel="stylesheet" href="public/styles/createUser.css">

</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   // Retrieve a session attribute
   String username = (String) session.getAttribute("username");
%>

<p>Welcome, <%= username %>!</p>


<form action="logout.do" method="post">
  <button type="submit">Logout</button>
</form>
<a href="createUserPage.do">Create a new user</a>
<h1>Student List will be shown here</h1>
<table>
  <tr>
    <th>Full Name</th>
    <th>College Name</th>
    <th>University Name</th>
    <th>Date of Birth</th>
    <th>Section</th>
    <th>Stream</th>
    <th>Gender</th>
    <th>Student Email</th>
    <th>Delete</th>
    <th>Update</th>
    
  </tr>
  <c:forEach var="student" items="${studentList}">
    <tr id="${student.studentEmail}-row"  >   
      <td>${student.fullName}</td>
      <td>${student.collegeName}</td>
      <td>${student.universityName}</td>
      <td>${student.dateOfBirth}</td>
      <td>${student.section}</td>
      <td>${student.stream}</td>
      <td>${student.gender}</td>
      <td>${student.studentEmail}</td>
      <td>
      	<button onclick="deleteStudent('${student.studentEmail}')"   >Delete</button>
      </td>
      <td>
      	<button onclick="editStudent('${student.studentEmail}')"   >Edit</button>
      </td>
    </tr>
  	
  	<tr  class="hidden" id="${student.studentEmail}-form"  >
  	 
      <td> <input type="text" id="${student.studentEmail}full-name" name="fullName" value= "${student.fullName}"></td>
      <td><input type="text" id="${student.studentEmail}college-name" name="collegeName" value="${student.collegeName}" ></td>
      <td><input type="text" id="${student.studentEmail}university-name" name="universityName" value="${student.universityName}" ></td>
      <td><input type="date" id="${student.studentEmail}date-of-birth" name="dateOfBirth" value="${student.dateOfBirth}" ></td>
      <td><input type="text" id="${student.studentEmail}section" name="section" value="${student.section}" ></td>
      <td> <input type="text" id="${student.studentEmail}department" name="stream" value="${student.stream}" ></td>
      <td class="radio-button" >
      	  <input  type="radio" id="male" name="${student.studentEmail}gender" value="male" checked>
		  <label for="male">Male</label>
		  <input  type="radio" id="female" name="${student.studentEmail}gender" value="female">
		  <label for="female">Female</label>
	  </td>
      <td><input type="email" id="${student.studentEmail}student-email" name="studentEmail" value="${student.studentEmail}" ></td>
      <td>
      	<button onclick="deleteStudent('${student.studentEmail}')"   >Delete</button>
      </td>
      <td>
      	<button onclick="updateStudent('${student.studentEmail}')"   >Update</button>
      </td>
  
    </tr>
    
  
  </c:forEach>
</table>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

	var isUpdateOn=false;
	function deleteStudent(email){
		console.log(email)
		 $.ajax({
		    type: "GET",
		    url: "deleteStudent.do",
		    data: { email: email },
		    success: function(response) {
		      // handle success response
		      //location.reload();
		      document.getElementById(email+"-row").style.display="none";
		      document.getElementById(email+"-form").style.display="none";
		      console.log("Student deleted successfully.");
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		      // handle error response
		      alert("Error deleting student:");
		    }
		  });	
	}
	
	function editStudent(email){
		if(!isUpdateOn){
			isUpdateOn=true;
			console.log("#"+email+"-row","john.smith@example.com-row")
			document.getElementById(email+"-row").style.display="none";
			document.getElementById(email+"-form").style.display="table-row";
		}else{
			alert("Update one row at one time")
		}
		
	}
	function updateStudent(email){
		if(isUpdateOn){
			isUpdateOn=false;
			
			var studentData=getData(email)
			console.log(studentData)
			
			$.ajax({
		    type: "POST",
		    url: "updateStudent.do",
		    data: studentData,
		    success: function(response) {
		      // handle success response
		      console.log("#"+email+"-row","john.smith@example.com-row")
			document.getElementById(email+"-row").style.display="table-row";
			document.getElementById(email+"-form").style.display="none";
		      location.reload();
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		      // handle error response
		      alert("Error deleting student:");
		    }
		  });	
			
			
			
			
			
		}

	}
	
	function getData(email){
		var student = {};

		// get input fields using their name attribute and assign their values to object properties
		student.fullName = document.getElementById(email+"full-name").value;
		student.collegeName = document.getElementById(email+"college-name").value;
		student.universityName = document.getElementById(email+"university-name").value;
		student.dateOfBirth = document.getElementById(email+"date-of-birth").value;
		student.section = document.getElementById(email+"section").value;
		student.stream = document.getElementById(email+"department").value;
		student.gender = document.querySelector('input[name="'+email+'gender"]:checked').value;
		student.studentEmail = document.getElementById(email+"student-email").value;

		
		return student;
		
	}
	
	
	
</script>

</body>
</html>