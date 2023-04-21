<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
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


<h1>Login Form  </h1>
<form action="login.do" method="post"  id="loginform" onsubmit="clearFormFields('loginform')"  >
    <label>Username:</label>
    <input type="text" name="username"/><br/>
    <label>Password:</label>
    <input type="password" name="password"/><br/>
    <input type="submit" value="Login"/>
</form>
<a href="createUserPage.do">Create a new user</a>

<c:if test='${!isNormal.equals("true") }'>
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