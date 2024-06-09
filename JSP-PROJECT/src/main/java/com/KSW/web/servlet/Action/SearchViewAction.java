package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SearchViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		String keyward = req.getParameter("search");
		session.setAttribute("keyward", keyward);
		if(session.getAttribute("userid") != null) {
			String userid = (String)session.getAttribute("userid");
			session.setAttribute("userid", userid);
			System.out.println(userid);
		} else {
			System.out.println("아이디 값 없음");
		}
		
		forward.setPath(req.getContextPath() + "/search/searchview.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
