package com.KSW.web.servlet.Action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.QnaDAO;
import com.KSW.web.dto.QnaDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InquiryWriteSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		QnaDTO qdto = new QnaDTO();
		QnaDAO qdao = new QnaDAO();
		
		String qnatitle = req.getParameter("qnatitle");
		String qnaDetails = req.getParameter("qnaDetails");
		
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userid");
		
		req.setAttribute("qnatitle", qnatitle);
		req.setAttribute("qnaDetails", qnaDetails);
		req.setAttribute("createdat", formattedDate);
		
		qdto.setUserId(userid);
		qdto.setCreatedat(formattedDate);
		qdto.setQnatitle(qnatitle);
		qdto.setQnaDetails(qnaDetails);
		System.out.println(qdto);
		
		if(qdao.insertinquiryWrite(qdto)) {
			System.out.println("성공!");
			forward.setPath(req.getContextPath()+"/notice/inquiry.bo");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
