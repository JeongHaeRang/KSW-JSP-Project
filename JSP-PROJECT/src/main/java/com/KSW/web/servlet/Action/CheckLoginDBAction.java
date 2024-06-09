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

public class CheckLoginDBAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		SHA256 sha256 = new SHA256();
		// 세션에 아이디를 저장 하기 위한 세션 객체 생성
		HttpSession session = req.getSession();
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		try {
			String pw = "";
			// 비밀번호 암호화
			pw = sha256.encrypt(userpw);
			pw = pw+userid;
			pw = sha256.encrypt(pw);
			pw = userid + pw;
			pw = sha256.encrypt(pw);
			System.out.println(pw);
			// dto 객체에 저장
			udto.setUserpw(pw);

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String undoPage = req.getHeader("Referer");
		System.out.println(undoPage);
		// dto 객체에 저장된 비밀번호를 불러옴
		userpw = udto.getUserpw();
		System.out.println("userid : " + userid);
		System.out.println("userpw : " + userpw);
		if (udao.login(userid, userpw)) {
			udto = udao.getparam(userid, userpw);
			session.setAttribute("userid", udto.getUserid());
			forward.setPath(req.getContextPath() + "/main/main-page.jsp");
			forward.setRedirect(true);
		} else {
			forward.setPath(req.getContextPath() + "/login/sign-up-in.jsp?flag=false");
			forward.setRedirect(false);
		}
		return forward;
	}

}
