package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.NotificationDAO;
import com.KSW.web.dto.NotificationDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class noticemodifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		NotificationDAO ndao = new NotificationDAO();
		NotificationDTO ndto = new NotificationDTO();
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		
		int notificationNum = Integer.parseInt(req.getParameter("notificationNum"));
		
		String getnotificationTitle = ndao.getnotificationTitle(notificationNum);
		String getnotificationDetails = ndao.getnotificationDetails(notificationNum);
		
		req.setAttribute("notificationNum", notificationNum);
		req.setAttribute("getnotificationTitle", getnotificationTitle);
		req.setAttribute("getnotificationTitle", getnotificationDetails);
		
		forward.setPath(req.getContextPath() + "/notice/noticemodify.jsp");
		forward.setRedirect(false);
		return forward;
	} 

}
