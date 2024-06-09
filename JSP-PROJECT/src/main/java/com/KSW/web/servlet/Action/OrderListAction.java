package com.KSW.web.servlet.Action;

import java.awt.print.Pageable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.OrderlistDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션에 아이디를 저장 하기 위한 세션 객체 생성
		HttpSession session = request.getSession();
		// 현재 날짜 및 시간을 위한 Date 객체 생성
        Date date = new Date();
        
        // 날짜 형식을 지정하기 위해 SimpleDateFormat 객체 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        // format 메소드를 사용하여 날짜를 지정된 형식의 문자열로 변환
        String formattedDate = sdf.format(date);
		String userid = (String) session.getAttribute("userid");
		
		ActionForward forward = new ActionForward();
		OrderlistDAO bdao = new OrderlistDAO();
		int totalCnt = bdao.getOrderCnt(userid);
		String username = bdao.getUserName(userid);
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
		
		
		request.setAttribute("OrderList", bdao.getOrderList(startRow, endRow, userid));
		request.setAttribute("nowDate", formattedDate);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("username", username);
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// forward방식으로 페이지 이동
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/myPage/OrderList.jsp");
		
		return forward;
	}

}
