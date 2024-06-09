package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.CartDAO;
import com.KSW.web.dto.CartDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InsertCartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		CartDTO cdto = new CartDTO();
		CartDAO cdao = new CartDAO();
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userid");
		String title = req.getParameter("title");
		String discount = req.getParameter("discount");
		discount = discount.trim().replace(",", "").replace("원", "");
		int dis = Integer.parseInt(discount);
		String image = req.getParameter("image");
		String isbn = req.getParameter("isbn");
		System.out.println(cdao.getCart(userid,isbn));
		
		cdto.setUserId(userid);
		cdto.setTitle(title);
		cdto.setDiscount(dis);
		cdto.setImage(image);
		cdto.setIsbn(isbn);
		System.out.println(cdto);
		if(cdao.getCart(userid,isbn) >= 1) {
			System.out.println("이미 있음");
			forward.setPath(req.getContextPath()+"/search/CartList.bo");
			req.setAttribute("flag", "false");
			forward.setRedirect(false);
		} else if(cdao.insertCart(cdto)) {
			System.out.println("성공!");
			forward.setPath(req.getContextPath()+"/search/CartList.bo");
			forward.setRedirect(false);
		}
		return forward;
	}

}
