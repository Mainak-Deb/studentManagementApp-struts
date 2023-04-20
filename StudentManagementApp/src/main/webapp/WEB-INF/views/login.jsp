<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
</head>
<body>
<h1>Login Form</h1>
<form action="login.do" method="post"  id="loginform" onsubmit="clearFormFields('loginform')"  >
    <label>Username:</label>
    <input type="text" name="username"/><br/>
    <label>Password:</label>
    <input type="password" name="password"/><br/>
    <input type="submit" value="Login"/>
</form>
<a href="createUserPage.do">Create a new user</a>

<script type="text/javascript">

function clearFormFields(formId) {
	  var form = document.getElementById(formId);
	  var inputs = form.getElementsByTagName('input');
	  
	  for (var i = 0; i < inputs.length; i++) {
	    inputs[i].value = '';
}
	  
</script>

</body>
</html>