package com.student.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.student.DAO.StudentDAO;
import com.student.form.CreateUserForm;

public class StudentListAction  extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
	        HttpServletRequest request, HttpServletResponse response) throws Exception {  
		
		StudentDAO stdao=new StudentDAO();
		List<CreateUserForm> studentList = stdao.getAllStudents();
		
		 request.setAttribute("studentList", studentList);
		    
	     return mapping.findForward("success");
	       
	}
}
