package com.KSW.web.servlet.Action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.NotificationDAO;
import com.KSW.web.dto.NotificationDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class noticemodifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		NotificationDAO ndao = new NotificationDAO();
		NotificationDTO ndto = new NotificationDTO();
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        
        String notificationTitle = (String)req.getParameter("notificationTitle");
        String notificationDetails = (String)req.getParameter("notificationDetails");
        int notificationNum = Integer.parseInt(req.getParameter("notificationNum"));
        
//        req.setAttribute("notificationTitle", notificationTitle);
//        req.setAttribute("notificationDetails", notificationDetails);
//        req.setAttribute("notificationNum", notificationNum);
        
        ndto.setNotificationNum(notificationNum);
        ndto.setNotificationTitle(notificationTitle);
        ndto.setNotificationDetails(notificationDetails);
        ndto.setUpdatedAt(formattedDate);
        
        if(ndao.updatenotice(ndto)) {
			System.out.println("성공!");
			forward.setPath(req.getContextPath()+"/notice/getNotificationList.bo");
			forward.setRedirect(false);
		}
		return forward;
	}

}
