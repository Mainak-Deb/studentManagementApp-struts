<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="public/styles/error.css">
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   // Retrieve a session attribute
   String isNormal="true";
   String messege = (String) request.getAttribute("messege");
   isNormal = (String) request.getAttribute("isNormal");

%>

	<h1>Create a new User  <%= isNormal %></h1>
	
	<form action="createUser.do" method="POST">


  <label for="full-name">Full Name:</label>
  <input type="text" id="full-name" name="fullName"><br>

  <label for="college-name">College Name:</label>
  <input type="text" id="college-name" name="collegeName"><br>

  <label for="university-name">University Name:</label>
  <input type="text" id="university-name" name="universityName"><br>

  <label for="date-of-birth">Date of Birth:</label>
  <input type="date" id="date-of-birth" name="dateOfBirth"><br>

  <label for="section">Section:</label>
  <input type="text" id="section" name="section"><br>

  <label for="department">Stream/Department:</label>
  <input type="text" id="department" name="stream"><br>

  <label for="gender">Gender:</label>
  <input type="radio" id="male" name="gender" value="male">
  <label for="male">Male</label>
  <input type="radio" id="female" name="gender" value="female">
  <label for="female">Female</label><br>

  <label for="student-email">Email:</label>
  <input type="email" id="student-email" name="studentEmail"><br>

  <input type="submit" value="Submit">
</form>
	
	

<c:if test='${isNormal.equals("true") || isNormal!=null  }'>
   <div class="frame">
	  <div class="modal">
	    <img src="https://100dayscss.com/codepen/alert.png" width="44" height="38" />
			<span class="title">Oh snap!</span>
			<p><%= messege %></p>
			<div class="button">Dismiss</div>
	  </div>
	</div>
</c:if>


	
	

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


 $('.button').bind('click', function() {
	 console.log("hide")
 
	$('.modal').addClass('hide');
});
 
</script>
	
</body>
</html>