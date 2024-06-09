package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.NotificationDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class getNotificationListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		NotificationDAO ndao = new NotificationDAO();
		boolean isAdmin = false;
		if(userid.equals("admin")) {
			isAdmin = true;
		}
		req.setAttribute("isAdmin", isAdmin);
		req.setAttribute("NotificationList", ndao.getNotificationList());
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/notice/notification-list.jsp");
		return forward;
	}

}
