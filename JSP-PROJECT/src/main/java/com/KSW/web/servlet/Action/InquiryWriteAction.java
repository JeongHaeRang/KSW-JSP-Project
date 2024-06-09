package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.QnaDAO;
import com.KSW.web.dto.QnaDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InquiryWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userid");
		
		forward.setPath(req.getContextPath()+"/notice/inquiryWrite.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
