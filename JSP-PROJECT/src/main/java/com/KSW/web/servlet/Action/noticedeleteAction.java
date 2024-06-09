package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.NotificationDAO;
import com.KSW.web.dto.NotificationDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class noticedeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		NotificationDAO ndao = new NotificationDAO();
		NotificationDTO ndto = new NotificationDTO();
		
		int notificationNum = Integer.parseInt(req.getParameter("notificationNum"));
		
		ndao.deletenotice(notificationNum);
		
		forward.setPath(req.getContextPath() + "/notice/getNotificationList.bo");
		forward.setRedirect(false);
		return forward;
	}

}
