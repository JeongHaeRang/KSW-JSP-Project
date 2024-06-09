package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FindIdAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		String username = req.getParameter("name");
		String useremail = req.getParameter("email");
		if (udao.findId(username, useremail)) {
			System.out.println("아이디 값 불렁오는 중");
			String id = udao.getid(username, useremail);
			System.out.println("아이디 값 불러옴");
			req.setAttribute("userid", id);
			System.out.println("userid : " + id);
		} else {
			System.out.println("실패 페이지 이동");
			req.setAttribute("result", "false");
		}
		forward.setPath(req.getContextPath() + "/login/FindIdResult.bo");
		forward.setRedirect(false);
		return forward;
	}
}
