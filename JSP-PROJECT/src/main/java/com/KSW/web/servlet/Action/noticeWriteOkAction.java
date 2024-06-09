package com.KSW.web.servlet.Action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.NotificationDAO;
import com.KSW.web.dao.QnaDAO;
import com.KSW.web.dto.NotificationDTO;
import com.KSW.web.dto.QnaDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class noticeWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		NotificationDTO ndto = new NotificationDTO();
		NotificationDAO ndao = new NotificationDAO();
		
		String notificationTitle = req.getParameter("notificationTitle");
		String notificationDetails = req.getParameter("notificationDetails");
		
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userid");
		
		req.setAttribute("notificationTitle", notificationTitle);
		req.setAttribute("notificationDetails", notificationDetails);
		req.setAttribute("createdAt", formattedDate);
		
		ndto.setUserId(userid);
		ndto.setCreatedAt(formattedDate);
		ndto.setNotificationTitle(notificationTitle);
		ndto.setNotificationDetails(notificationDetails);
		System.out.println(ndto);
		
		if(ndao.insertnoticeWrite(ndto)) {
			System.out.println("성공!");
			forward.setPath(req.getContextPath()+"/notice/getNotificationList.bo");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
