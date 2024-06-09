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

public class UserInfoCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		SHA256 sha256 = new SHA256();
		// 세션에 아이디를 저장 하기 위한 세션 객체 생성
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String userpw = null;
		String useremail = udao.getuseremail(userid);
		String username = udao.getusername(userid);
		String userbirth = udao.getuserbirth(userid);
		String userphone = udao.getuserphone(userid);
		String useraddr = udao.getuseraddr(userid);
		
		req.setAttribute("useremail", useremail);
		req.setAttribute("username", username);
		req.setAttribute("userbirth", userbirth);
		req.setAttribute("userphone", userphone);
		req.setAttribute("useraddr", useraddr);
		
		try {
			userpw = sha256.encrypt(req.getParameter("userpw"));
			userpw = sha256.encrypt(userpw + userid);
			userpw = sha256.encrypt(userid + userpw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		System.out.println(userpw);
		if(udao.login(userid, userpw)) {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/myPage/UserInfoChange.jsp");
		} else {
			forward.setPath(req.getContextPath() + "/myPage/UserInfoCheck.jsp?flag=false");
			forward.setRedirect(false);
		}
		return forward;
		
		

		
	}

}
