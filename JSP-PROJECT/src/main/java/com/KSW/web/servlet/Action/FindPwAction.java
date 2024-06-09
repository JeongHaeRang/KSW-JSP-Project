package com.KSW.web.servlet.Action;

import java.security.NoSuchAlgorithmException;
import java.util.Random;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.sha256.SHA256;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FindPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		SHA256 sha256 = new SHA256();
		String username = req.getParameter("name");
		String userid = req.getParameter("id");
		String useremail = req.getParameter("email");
		// 10자리의 랜덤한 난수를 생성하기 위한 코드
		Random rd = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 10; i++) {

			if (rd.nextBoolean()) {
				sb.append(rd.nextInt(10));
			} else {
				sb.append((char) (rd.nextInt(26) + 65));
			}
		}

		String newuserpw = sb.toString();
		String pw = newuserpw;
		System.out.println("새 비밀번호 : " + newuserpw);
		if (udao.findpw(username, userid, useremail)) {
			try {
				pw = sha256.encrypt(pw);
				pw = sha256.encrypt(pw + userid);
				pw = sha256.encrypt(userid + pw);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("바뀐비밀번호 : "+pw);
			System.out.println("비밀번호 업데이트 중");
			if (udao.updatepw(userid, pw)) {
				System.out.println("비밀번호 값 변경 완료");
				System.out.println("userpw : " + newuserpw);
				req.setAttribute("userpw", newuserpw);
			} else {
				System.out.println("실패 페이지 이동");
				req.setAttribute("result", "false");
			}
		}

		forward.setPath(req.getContextPath() + "/login/FindPwResult.bo");
		forward.setRedirect(false);
		return forward;
	}
}
