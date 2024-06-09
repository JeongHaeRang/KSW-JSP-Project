package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.dto.UsersDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInfoChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		
		// forward방식으로 페이지 이동
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/myPage/myPage.jsp");

		return forward;
	}

}
