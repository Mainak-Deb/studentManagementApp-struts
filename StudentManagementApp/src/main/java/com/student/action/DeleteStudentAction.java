package com.student.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.student.DAO.StudentDAO;


public class DeleteStudentAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
	    HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		StudentDAO stdao=new StudentDAO();
		stdao.deleteStudent(request.getParameter("email"));
		
		System.out.println(request.getParameter("email"));
		    
	     return mapping.findForward("success");
	}
}
