package com.KSW.web.servlet.Action;

import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.dto.UsersDTO;
import com.KSW.web.sha256.SHA256;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignUpAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
        ActionForward forward = new ActionForward();
        UsersDTO udto = new UsersDTO();
        UsersDAO udao = new UsersDAO();
        SHA256 sha256 = new SHA256();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        String userid = req.getParameter("userid");
        String pw = req.getParameter("confirmPassword");
        String username = req.getParameter("username");
        String userbirth = req.getParameter("userbirth");
        String userphone = req.getParameter("userphone");
        String add1 = req.getParameter("add1");
        String add2 = req.getParameter("add2");
        String add3 = req.getParameter("add3");
        String useraddr = add1 + " (" + add2 + ") " + add3;
        String useremail1 = req.getParameter("useremail1");
        String useremail2 = req.getParameter("useremail2");
        String userEmailFull = useremail1 + "@" + useremail2;

        

        try {
            // 유효성 검사 로직 추가
            udto.setUserid(userid);
            udto.setUserpw(pw);
            udto.setUsername(username);
            // 다른 필드 설정 로직 생략...
        } catch (IllegalArgumentException e) {
            // 유효성 검사 실패 시 처리
            req.setAttribute("errorMessage", e.getMessage());
            forward.setPath("/login/sign-up.jsp");
            forward.setRedirect(false);
            return forward;
        }
        
        try {
            String cryptpw = sha256.encrypt(pw);
            cryptpw = cryptpw + userid;
            cryptpw = sha256.encrypt(cryptpw);
            cryptpw = userid + cryptpw;
            cryptpw = sha256.encrypt(cryptpw);
            udto.setUserpw(cryptpw);
        } catch (NoSuchAlgorithmException e) {
            System.out.println("암호화 실패");
            e.printStackTrace();
            // 예외 처리 필요: 비밀번호 암호화 실패 시 어떻게 처리할 지 결정해야 합니다.
            return null; // 또는 적절한 오류 처리 후 종료
        }

        udto.setUsername(username);

        Date date;
        try {
            date = formatter.parse(userbirth);
            udto.setUserbirth(date);
        } catch (ParseException e) {
            System.out.println("생일 변환 실패");
            e.printStackTrace();
            // 예외 처리 필요: 생일 변환 실패 시 어떻게 처리할 지 결정해야 합니다.
            return null; // 또는 적절한 오류 처리 후 종료
        }

        udto.setUserphone(userphone);
        udto.setUseraddr(useraddr);
        udto.setUseremail(userEmailFull);

        if (udao.insertJoin(udto)) {
            forward.setPath(req.getContextPath() + "/login/Sign-Up-result.bo");
            forward.setRedirect(true);
        }

        return forward;
    }

}
