package com.KSW.web.servlet.Action;

import java.util.List;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.ReviewDAO;
import com.KSW.web.dto.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class insertReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		// 객체 생성
		ReviewDTO rdto = new ReviewDTO();
		ReviewDAO rdao = new ReviewDAO();
		HttpSession session = req.getSession();
		// 파라미터 값 받아오기
		String isbn = req.getParameter("isbn");
		String reply = req.getParameter("reply");
		int rating = Integer.parseInt(req.getParameter("rating"));
		String userid = (String)session.getAttribute("userid");
		
		int ordernum = Integer.parseInt(req.getParameter("ordernum"));
		
		// dto에 받아온 파라미터 값 담기
		rdto.setIsbn(isbn);
		rdto.setReply(reply);
		rdto.setReplygrade(rating);
		rdto.setUserid(userid);
		System.out.println("id : "+userid);
		System.out.println("isbn : "+isbn);
		System.out.println("reply : "+reply);
		System.out.println("rating : "+rating);
		// dto를 파라미터로 dao 실행
		if(rdao.insertReply(rdto)) {
			rdao.updateReplyStatus(ordernum);
			forward.setPath(req.getContextPath()+"/main/main-page.bo");
			forward.setRedirect(false);
		}
		
		return forward;
	}
	
}
