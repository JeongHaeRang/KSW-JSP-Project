package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.CartDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteCartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		CartDAO cdao = new CartDAO();
		int cartNum = Integer.parseInt(req.getParameter("cartNum"));
		if(cdao.deleteCart(cartNum)) {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath()+"/search/CartList.bo");
		}
		return forward;
	}

}
