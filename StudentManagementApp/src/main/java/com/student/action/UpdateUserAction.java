package com.student.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.student.DAO.StudentDAO;
import com.student.form.CreateUserForm;

public class UpdateUserAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	        	
			StudentDAO stdao=new StudentDAO();
			
			CreateUserForm userDetails = (CreateUserForm) form;
			
			System.out.println(form);
			System.out.println( userDetails);
			
			stdao.updateStudent(userDetails);
			
			return mapping.findForward("success");
	}
}
