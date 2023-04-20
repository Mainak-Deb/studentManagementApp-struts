<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentPortal</title>
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
    <td>
      Delete
     </td>
  </tr>
  <c:forEach var="student" items="${studentList}">
    <tr>
      
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
    </tr>
  </c:forEach>
</table>


<script type="text/javascript">

	function deleteStudent(email){
		console.log(email)
		alert(email+" it deleted");
	}
</script>

</body>
</html>