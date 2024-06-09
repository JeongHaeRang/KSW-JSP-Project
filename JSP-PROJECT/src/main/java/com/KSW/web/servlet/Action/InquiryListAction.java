package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.QnaDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InquiryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse resp) {
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		
		ActionForward forward = new ActionForward();
		QnaDAO qdao = new QnaDAO();
		int totalCnt = qdao.getinquiryCnt(userid);
		String username = qdao.getUserName(userid);
		// 현재 페이지 넘겨받기
		String temp = request.getParameter("page");
		int page = 0;
		page = temp == null ? 1 : Integer.parseInt(temp);
		
		int pageSize = 10;
		int endRow = page * 10;		// 1페이지면 : 10, 4페이지 : 40
		int startRow = endRow - 9;	// 1페이지면 : 1, 4페이지 : 31
		
		// [1][2]..[10]:[1], [11][12]..[20] : [11]
		int startPage = (page-1)/pageSize*pageSize+1;
		// [1][2]..[10]:[10], [11][12]..[20] : [20]
		int endPage = startPage + pageSize-1;
		int totalPage = (totalCnt-1)/pageSize + 1;
		
		endPage = endPage> totalPage ? totalPage : endPage;
		System.out.println(userid);
		if(userid.equals("admin")) {
			request.setAttribute("inquiryList", qdao.getinquiryListAdmin(startRow, endRow, userid));
		} else {
			request.setAttribute("inquiryList", qdao.getinquiryList(startRow, endRow, userid));
		}
		
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("username", username);
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// forward방식으로 페이지 이동
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/notice/inquiry.jsp");
		
		return forward;
	}

}
