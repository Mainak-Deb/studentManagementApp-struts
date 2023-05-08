package com.student.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.student.DAO.AuthDAO;

public class ChangePasswordAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
		    HttpServletRequest request, HttpServletResponse response) throws Exception {
			AuthDAO adao= new AuthDAO();
			
			String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String newpassword = request.getParameter("newpassword");
	        
	        System.out.println(username+","+password+","+newpassword);
	        
	        try {
	        	if (adao.authenticate(username, password)) {
	        		adao.updatePassword(username, newpassword);
	        		request.setAttribute("isNormal", "true");
	        		return mapping.findForward("success");
	        	}
	        	else {
	        		request.setAttribute("isNormal", "false");
	        	return mapping.findForward("failure");
	        	}
	        	
	        }catch(Exception  e) {
	        	request.setAttribute("isNormal", "false");
	        	return mapping.findForward("failure");
	        }
			 
			
		     
		}
}
