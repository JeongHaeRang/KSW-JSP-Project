package com.KSW.web.servlet.Action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.BookDAO;
import com.KSW.web.dao.ReviewDAO;
import com.KSW.web.dto.BookDTO;
import com.KSW.web.dto.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BookParamAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		// 세션에 아이디를 저장 하기 위한 세션 객체 생성
		HttpSession session = req.getSession();
		if(session.getAttribute("userid") != null) {
		   String userid = (String)session.getAttribute("userid");
		   System.out.println(userid);   
		}
		ActionForward forward = new ActionForward();
		BookDTO bdto = new BookDTO();
		BookDAO bdao = new BookDAO();
		String description = req.getParameter("description");
		bdto.setDescription(description);
		bdto.setImage(req.getParameter("imageSrc"));
		bdto.setIsbn(req.getParameter("isbn"));
		bdto.setTitle(req.getParameter("title"));
		bdto.setAuthor(req.getParameter("author"));
		bdto.setPublisher(req.getParameter("publisher"));
		bdto.setDiscount(req.getParameter("discount"));
		String date = req.getParameter("pubdate");
		// 2009-06-20
		// 스트링 타입을 date 타입으로 변환
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date setdate;
		
		ReviewDTO rdto = new ReviewDTO();
		ReviewDAO rdao = new ReviewDAO();
		String isbn = req.getParameter("isbn");
		System.out.println(isbn);
		req.setAttribute("getreplys", rdao.getReplys(isbn));
		System.out.println(rdao.getReplys(isbn));
		
		try {
			setdate = formatter.parse(date);
			bdto.setPubdate(setdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bdao.insertBookDetails(bdto);
		req.setAttribute("bookdetails", bdto);
		forward.setPath(req.getContextPath() + "/search/bookdetails.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
