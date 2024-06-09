package com.KSW.web.servlet.Action;

import java.security.NoSuchAlgorithmException;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.dto.UsersDTO;
import com.KSW.web.sha256.SHA256;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInfoChangeSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		SHA256 sha256 = new SHA256();
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("password");
		String username = req.getParameter("username");
		String useremail = req.getParameter("useremail");
		String userbirth = req.getParameter("userbirth");
		String userphone = req.getParameter("userphone");
		String add1 = req.getParameter("add1");
		String add2 = req.getParameter("add2");
		String add3 = req.getParameter("add3");
		String useraddr = add1+" ("+add2+") "+add3;
		
		
		req.setAttribute("userid", userid);
		req.setAttribute("userpw", userpw);
		req.setAttribute("useremail", useremail);
		req.setAttribute("username", username);
		req.setAttribute("userbirth", userbirth);
		req.setAttribute("userphone", userphone);
		req.setAttribute("useraddr", useraddr);
		
		try {
			userpw = sha256.encrypt(userpw);
			userpw = sha256.encrypt(userpw + userid);
			userpw = sha256.encrypt(userid + userpw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		if (useraddr != null && !useraddr.isEmpty()) {
	        udao.updateUserAddress(userid, useraddr);
	    }
	    if (username != null && !username.isEmpty()) {
	        udao.updateUserName(userid, username);
	    }
	    if (userpw != null && !userpw.isEmpty()) {
	        udao.updateUserPassword(userid, userpw);
	    }
		session.removeAttribute("userid");
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/main/main-page.bo");
		return forward;
	}
}
