<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="public/styles/home.css">
     <link rel="stylesheet" href="public/styles/error.css" />
</head>
<body>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   // Retrieve a session attribute
   String isNormal="true";
   String messege = (String) request.getAttribute("messege");
   isNormal = (String) request.getAttribute("isNormal");

%>

<div id="main">
    <div id="header">
        <img src="public/images/logo_opt.png" style="width:10%" alt="">
        <div class="head-text text"  >
            INTERRAIT STUDENT PORTAL
        </div>
        <div>
            <a href="login.do" class="head-button text" style="border-right:1px solid rgba(255, 255, 255, 0.544)" >LOGIN</a>
            <a href="createUserPage.do" class="head-button text">CREATE NEW USER</a>
        </div>
    </div>
    <div id="user-text">
    	
		<c:if test='${isNormal.equals("false") }'>
		  <span style="color:red;" >Error, Invalid username or password</span>
		</c:if>
           
    </div>
    <div id="login-body">
        <div id="logImg">
            <img src="public/images/office.png"  alt="">
            <div id="logForm">                             
                <h1>InterraIT Change Password Form  </h1>
                <form action="updatePassword.do" method="post"  id="loginform" onsubmit="clearFormFields('loginform')">
                    <label>Username:</label>
                    
                    <input type="text" name="username"  placeholder="type your email as username"   /><br/>
                    <label>Password:</label>
                    <input type="password" name="password"   placeholder="Password"    /><br/>
                    
                    <label>New password:</label>
                    <input type="password" name="newpassword"   placeholder="Password"    /><br/>
                   
                    <input type="submit" value="Update"/>
                </form>
                <br>
                <a href="login.do">Login</a>
                <a href="">forgot your password?</a>
            </div>

        </div>
        
    </div>


</div>


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


</body>
</html>