package com.student.action;




import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.student.DAO.AuthDAO;
import com.student.DAO.StudentDAO;
import com.student.form.CreateUserForm;



public class CreateUserAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	        	
			StudentDAO stdao=new StudentDAO();
			AuthDAO adao= new AuthDAO();
			
			
			
			CreateUserForm userDetails = (CreateUserForm) form;
			try {
				stdao.insertStudent(userDetails);
				adao.insertAuth(userDetails.getStudentEmail(), userDetails.getDateOfBirth());
				System.out.println("no error");
				request.setAttribute("isNormal", "true");
          	  	request.setAttribute("messege","" );
				
				return mapping.findForward("success");
			}catch(SQLException e) {
				
				request.setAttribute("isNormal", "false");
          	  	request.setAttribute("messege", "Email  is already exists");
          	   System.out.println("error occured");
				return mapping.findForward("failure");
			}
			
		
	}
};
