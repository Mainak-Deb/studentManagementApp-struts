package com.student.action;

import java.util.ArrayList;
import java.util.List;

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
			
			stdao.insertStudent(userDetails);
			adao.insertAuth(userDetails.getStudentEmail(), userDetails.getDateOfBirth());
			
			List<CreateUserForm> l = stdao.getAllStudents();
			for(CreateUserForm c : l) {
				System.out.println(c.getFullName());
			}

			
			
			return mapping.findForward("success");
		
		
	}
};