<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>createUser</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" href="public/styles/createUser.css" />
    <link rel="stylesheet" href="public/styles/error.css" />
    
  </head>
  <body>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   // Retrieve a session attribute
   String isNormal="true";
   String messege = (String) request.getAttribute("messege");
   isNormal = (String) request.getAttribute("isNormal");
   String username = (String) session.getAttribute("username");

%>

    <div id="main">
      <div id="header">
        <img src="public/images/logo_opt.png" style="width: 10%" alt="" />
        <div class="head-text text">INTERRAIT STUDENT PORTAL</div>
        <div>
          <a
            href="login.do"
            class="head-button text"
            style="border-right: 1px solid rgba(255, 255, 255, 0.544)"
            >
				<c:if test='${username!=null  }'> STUDENT DETAILS</c:if>
		  		<c:if test='${username==null  }'> LOG IN</c:if>
		
		</a>
          
            
				<c:if test='${username!=null  }'> <a href="logout.do" class="head-button text">LOG OUT</a ></c:if>
		  		<c:if test='${username==null  }'> <a href="createUserPage.do" class="head-button text">CREATE NEW USER</a ></c:if>
			
         
        </div>
      </div>
      <div id="user-text">
      	<c:if test='${!isNormal.equals("true") && isNormal==null  }'>
	  		 <c:if test='${username!=null  }'>
			  	Hello 	<%= username %>
			</c:if>
			<c:if test='${username==null  }'>
			  	Please login to our portal
			</c:if>
		</c:if>
      	<c:if test='${isNormal.equals("true") || isNormal!=null  }'>
	  		 <span style="color:red;" >Error, Email Id already exists</span>
		</c:if>
		
      
			  
		
		</div>
      <div id="login-body">
        <div id="logImg">
          <img src="public/images/office.png" alt="" />
          <div id="logForm">
            
            <div>
              <form action="createUser.do" method="POST">
                <div><h1>Create a new User</h1></div>
                 <input type="hidden" name="studentId" value="1">
                <div id="upperForm" >
                  <div id="leftForm">
                    <div>
                      <label for="full-name">Full Name:</label><br>
                      <input type="text" id="full-name" name="fullName"  required/><br />
                    </div>
                    <div>
                        <label for="university-name">University Name:</label><br>
                        <input type="text" id="university-name" name="universityName" required><br>
                    </div>
                    <div>
                        <label for="section">Section:</label><br>
                        <input type="text" id="section" name="section" required>
                    </div>
                    <div>
                        <label for="gender">Gender:</label> <br>
                        <div class="radio">
							<input label="Male" type="radio" id="male" name="gender" value="male" checked>
							<input label="Female" type="radio" id="female" name="gender" value="female">
						</div>
						                                     
                        
                    </div>
                  </div>
                  <div id="rightForm">
                    <div>
                      <label for="college-name">College Name:</label><br>
                      <input
                        type="text"
                        id="college-name"
                        name="collegeName"
                         required
                      /><br />
                    </div>
                    <div>
                        <label for="date-of-birth">Date of Birth:</label><br>
                        <input type="date" id="date-of-birth" name="dateOfBirth" required><br>
                      
                    </div>
                    <div>
                        <label for="department">Stream:</label><br>
                        <input type="text" id="department" name="stream" required><br>
                      
                    </div>
                    <div>
                        <label for="student-email">Email:</label><br>
                        <input type="email" id="student-email" name="studentEmail"  required ><br>
                    </div>
                  </div>
                  
                </div>
                
               
                <div style="margin-top: 20px;" >
                    <input type="submit" value="Submit" />
                </div>
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer>
      <div><h2>InterraIT student Portal</h2></div>
      <div id="footer-text">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nobis
        molestiae exercitationem dolor dolore voluptate tempore corrupti
        eligendi modi consequuntur quidem adipisci, deleniti sapiente? Vel
        inventore quo eos unde vitae.
      </div>
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


 $('.button').bind('click', function() {
	 console.log("hide")
 
	$('.modal').addClass('hide');
});
 $(document).ready(function() {
	  // Get the date input field
	

	  // Add an event listener to the form submit event
	  $('form').on('submit', function(event) {
		  var dateInput = $('#date-of-birth');
	    // Get the value of the date input field
	    var inputValue = dateInput.val();

	    // Convert the input value to a Date object
	    var inputDate = new Date(inputValue);

	    // Get the current date
	    var currentDate = new Date();

	    // Compare the input date with the current date
	    if (inputDate > currentDate) {
	      // Show an error message
	      alert('Please enter a date that is not greater than the current date.');

	      // Prevent the form from being submitted
	      event.preventDefault();
	    } else {
	      // Clear the error message
	      $('#date-of-birth').text('');
	    }
	  });
	});

</script>

  </body>
</html>
