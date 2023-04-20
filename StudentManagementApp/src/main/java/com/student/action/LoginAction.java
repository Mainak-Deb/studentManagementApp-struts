package com.student.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.student.DAO.AuthDAO;

public class LoginAction extends Action {
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) throws Exception {
            
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        AuthDAO adao= new AuthDAO();
        
        
        try {
        	
        	if ( adao.authenticate(username, password) ) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
               
                return mapping.findForward("success");
              } else {
            	  return mapping.findForward("failure");
              }
        	
        }catch(Exception  e) {
        	HttpSession session = request.getSession(false);
   		 	String isLoggedIn = (String) session.getAttribute("username");
	   		 if(isLoggedIn!=null) {
				 System.out.println("yes");
				 return mapping.findForward("success");
			 }else {
				 return mapping.findForward("failure");
			 }
        }
        
        
        // Perform authentication and validation logic
        
       
        
    }
}
