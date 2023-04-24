<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentPortal</title>
<link rel="stylesheet" href="public/styles/StudentList.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   // Retrieve a session attribute
   String username = (String) session.getAttribute("username");
%>
<div id="header">
  <img src="public/images/logo_opt.png" style="width: 10%" alt="" />
  <div class="head-text text">INTERRAIT STUDENT PORTAL</div>
  <div>
    <a
      href="logout.do"
      class="head-button text"
      style="border-right: 1px solid rgba(255, 255, 255, 0.544)"
      >LOG OUT</a
    >
    <a href="createUserPage.do" class="head-button text"
      >CREATE NEW USER</a
    >
  </div>
</div>
<div id="user-text">Welcome, <%= username %>!</div>



<h1 class="maintext text" >Student List will be shown here</h1>


<table  border="0" cellspacing="0" cellpadding="0">
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
      <td id="${student.studentEmail}gender-row" >${student.gender}</td>
      <td>${student.studentEmail}</td>
      <td>
      	<button onclick="deleteStudent('${student.studentEmail}')"   ><span class="material-symbols-outlined">
delete
</span></button>
      </td>
      <td>
      	<button onclick="editStudent('${student.studentEmail}')"   ><span class="material-symbols-outlined">
edit
</span></button>
      </td>
    </tr>
  	
  	<tr  class="hidden" id="${student.studentEmail}-form"  >
  	 
      <td> <input type="text" id="${student.studentEmail}full-name" name="fullName" value= "${student.fullName}"  ></td>
      <td><input type="text" id="${student.studentEmail}college-name" name="collegeName" value="${student.collegeName}" ></td>
      <td><input type="text" id="${student.studentEmail}university-name" name="universityName" value="${student.universityName}" ></td>
      <td><input type="date" id="${student.studentEmail}date-of-birth" name="dateOfBirth" value="${student.dateOfBirth}" ></td>
      <td><input type="text" id="${student.studentEmail}section" name="section" value="${student.section}" ></td>
      <td> <input type="text" id="${student.studentEmail}department" name="stream" value="${student.stream}" ></td>
      <td class="radio-button" >
      	  <input  type="radio"   id="male" name="${student.studentEmail}gender" value="male">
		  <label for="male">male</label>
		  <input  type="radio"   id="female" name="${student.studentEmail}gender" value="female">
		  <label for="female">female</label>
	  </td>
      <td>${student.studentEmail}</td>
      <td>
      	 <button onclick="deleteStudent('${student.studentEmail}')"   ><span class="material-symbols-outlined">
delete
</span></button>
      </td>
      <td><button onclick="updateStudent('${student.studentEmail}')"   ><span class="material-symbols-outlined">
frame_reload
</span></button>
     
      	
      </td>
  
    </tr>
    
  
  </c:forEach>
</table>

<footer>
    <div  > <h2>InterraIT student Portal</h2></div>
    <div id="footer-text" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nobis molestiae exercitationem dolor dolore voluptate tempore corrupti eligendi modi consequuntur quidem adipisci, deleniti sapiente? Vel inventore quo eos unde vitae.</div>
    <div id="socials">
        <div><span class="material-symbols-outlined"> mail</span></div>
        <div><span class="material-symbols-outlined">phone_in_talk</span></div>
        <div><span class="material-symbols-outlined"> sms</span></div>
        <div><span class="material-symbols-outlined">contact_page</span></div>

    </div>
    <div>All rights reserves @2023</div>
</footer>


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
		      location.reload();
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
			gender=document.getElementById(email+"gender-row").innerHTML;
			console.log(gender)
			var genderRadio = document.querySelector('input[name="'+email+'gender"][value="' + gender + '"]');
			console.log(genderRadio)
			if (genderRadio) {
			  genderRadio.checked = true;
			}
		}else{
			alert("Update one row at one time")
		}
		
	}
	function updateStudent(email){
		
			isUpdateOn=false;
			
			var studentData=getData(email)
			var isOk=validate(studentData)
			
			if(!isOk) {
				alert("Field should not be empty")
				return "failure";
			}
			console.log(studentData)
			
			$.ajax({
		    type: "POST",
		    url: "updateStudent.do",
		    data: studentData,
		    success: function(response) {
		      // handle success response
			document.getElementById(email+"-row").style.display="table-row";
			document.getElementById(email+"-form").style.display="none";
		      location.reload();
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		      // handle error response
		      alert("Error deleting student:");
		    }
		  });	
			return "success";
			
			
			
			
			
		

	}
	
	function getData(email){
		var student = {};
		console.log(email)
		// get input fields using their name attribute and assign their values to object properties
		student.fullName = document.getElementById(email+"full-name").value;
		student.collegeName = document.getElementById(email+"college-name").value;
		student.universityName = document.getElementById(email+"university-name").value;
		student.dateOfBirth = document.getElementById(email+"date-of-birth").value;
		student.section = document.getElementById(email+"section").value;
		student.stream = document.getElementById(email+"department").value;
		student.gender = document.querySelector('input[name="'+email+'gender"]:checked').value;
		student.studentEmail = email;

		
		return student;
		
	}
	
	function validate(studentList){
		for (let key in studentList) {
			 if(studentList[key].length==0){
				 return false;
			 }
		}
		return true;
	}
	
	
</script>

</body>
</html>