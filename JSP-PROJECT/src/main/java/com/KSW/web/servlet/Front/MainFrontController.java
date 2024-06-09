package com.KSW.web.servlet.Front;

import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.NotificationDAO;
import com.KSW.web.dto.NotificationDTO;
import com.KSW.web.servlet.Action.BookParamAction;
import com.KSW.web.servlet.Action.CheckLoginDBAction;
import com.KSW.web.servlet.Action.DeleteCartAction;
import com.KSW.web.servlet.Action.FindIdAction;
import com.KSW.web.servlet.Action.FindPwAction;
import com.KSW.web.servlet.Action.InquiryListAction;
import com.KSW.web.servlet.Action.InquiryWriteAction;
import com.KSW.web.servlet.Action.InquiryWriteSuccessAction;
import com.KSW.web.servlet.Action.InsertCartAction;
import com.KSW.web.servlet.Action.InsertOrderListAction;
import com.KSW.web.servlet.Action.LogOutAction;
import com.KSW.web.servlet.Action.OrderListAction;
import com.KSW.web.servlet.Action.SearchViewAction;
import com.KSW.web.servlet.Action.SelectCartListAction;
import com.KSW.web.servlet.Action.UserInfoCheckAction;
import com.KSW.web.servlet.Action.getNotificationListAction;
import com.KSW.web.servlet.Action.insertReplyAction;
import com.KSW.web.servlet.Action.noticeWriteAction;
import com.KSW.web.servlet.Action.noticeWriteOkAction;
import com.KSW.web.servlet.Action.noticedeleteAction;
import com.KSW.web.servlet.Action.noticemodifyAction;
import com.KSW.web.servlet.Action.noticemodifyOkAction;
import com.KSW.web.servlet.Action.writeReplyAction;
import com.KSW.web.servlet.Action.SignUpAction;
import com.KSW.web.servlet.Action.UserInfoChangeSuccessAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("*.bo")
public class MainFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		HttpSession session = req.getSession();
		session.setAttribute("userid", session.getAttribute("userid"));
        ActionForward forward = null;
        switch (requestURI) {
        // 메인페이지로 이동
        case "/main/main-page.bo" :
        	forward = new ActionForward(true, "/main/main-page.jsp");
        	break;
        // 검색페이지로 이동
		case "/search/SearchView.bo": 
			// 검색페이지로 이동할 때에 userid 값을 가져가기 위한 코드 실행
			 forward = new SearchViewAction().execute(req, resp);
			//forward = new ActionForward(true, "/search/searchview.jsp");
			break;
		// 로그인 페이지로 이동
		case "/login/Sign-up-in.bo":
			String undoPage = req.getHeader("Referer");
			URL undoURL = new URL(undoPage);
			System.out.println("undoURL:"+undoURL);
			forward = new ActionForward(true, "/login/sign-up-in.jsp");
			break;
			// 마이페이지 이동 액션
		case "/myPage/myPage.bo":
			forward = new ActionForward(true, "/myPage/myPage.jsp");
			break;
		// 로그아웃
		case "/login/LogOut.bo":
			// 로그아웃을 위한 메서드
			forward = new LogOutAction().execute(req, resp);
			break;
			//구매내역
		case "/myPage/OrderList.bo":
			forward = new OrderListAction().execute(req, resp);
			break;
		// 책 상세 페이지 이동
		case "/search/bookDetails.bo":
        	forward = new BookParamAction().execute(req, resp);
			break;
		// 로그인
		case "/login/Sign-InDB.bo": 
			forward = new CheckLoginDBAction().execute(req, resp);
			break;
		// 화원가입 페이지로 이동
		case "/login/Sign-up.bo":
			forward = new ActionForward(false, "/login/sign-up.jsp");
			break;
		// 회원가입 버튼 클릭 액션
		case "/login/Sign-Up.bo":
			forward = new SignUpAction().execute(req, resp);
			break;
		// 회원가입 완료 시 이동 페이지
		case "/login/Sign-Up-result.bo":
			forward = new ActionForward(true, "/login/sign-up-result.jsp");
			break;
		// 아이디 찾기 페이지로 이동
		case "/login/Find-id.bo":
			System.out.println("/login/Find-id.us");
			forward = new ActionForward(false, "/login/find-id.jsp");
			break;
		// 아이디 찾기 액션
		case "/login/FindId.bo" :
			System.out.println("아이디 찾기 시작");
			forward = new FindIdAction().execute(req, resp);
			break;
		// 아이디 찾기 결과 페이지 이동
		case "/login/FindIdResult.bo":
			forward = new ActionForward(false, "/login/find-id-result.jsp");
			break;
		// 비밀번호 찾기 페이지로 이동
		case "/login/Find-pw.bo":
			System.out.println("/login/Find-pw.us");
			forward = new ActionForward(false, "/login/find-pw.jsp");
			break;
		// 비밀번호 찾기 액션
		case "/login/FindPw.bo":
			forward = new FindPwAction().execute(req, resp);
			break;
		// 비밀번호 찾기 결과 페이지 이동
		case "/login/FindPwResult.bo": 
			forward = new ActionForward(false, "/login/find-pw-result.jsp");
			break;
			// 개인정보 수정 비밀번호 확인
		case "/myPage/UserInfoCheck.bo": 
			forward = new ActionForward(false, "/myPage/UserInfoCheck.jsp");
			break;
			// 개인정보 수정 페이지로 이동
		case "/myPage/UserInfoChange.bo": 
			forward = new UserInfoCheckAction().execute(req, resp);
			break;
			// 장바구니에 책의 정보를 넣는 액션
		case "/myPage/insertCart.bo":
			forward = new InsertCartAction().execute(req, resp);
			break;
			// 장바구니 리스트를 불러오는 액션
		case "/search/CartList.bo":
			forward = new SelectCartListAction().execute(req, resp);
			break;
			// 고객센터 메인페이지로 이동
		case "/notice/notice-main.bo":
		    forward = new ActionForward(true, "/notice/notice-main.jsp");
		    break;
			// 삭제 버튼을 눌렀을 때 장바구니 테이블에서 삭제하는 액션
		case "/delete/CartBook.bo":
			forward = new DeleteCartAction().execute(req,resp);
			break;
			// 회원정보 수정 성공시 페이지
		case "/myPage/UserInfoChangeSuccess.bo":
			forward = new UserInfoChangeSuccessAction().execute(req,resp);
			break;
			// 구매내역에 인서트 후 구매내역으로 이동
		case "/myPage/insertOrderList.bo":
			forward = new InsertOrderListAction().execute(req,resp);
			break;
			// 1:1 문의내역 페이지로 이동
		case "/notice/inquiry.bo":
			forward = new InquiryListAction().execute(req,resp);
			break;
			// 1:1문의 작성페이지로 이동
		case "/notice/inquiryWrite.bo":
			forward = new InquiryWriteAction().execute(req,resp);
			break;
			// 1:1문의 인서트
		case "/notice/inquiryWriteSuccess.bo":
			forward = new InquiryWriteSuccessAction().execute(req,resp);
			break;
			// 공지사항 불러오기
		case "/notice/getNotificationList.bo":
			forward = new getNotificationListAction().execute(req,resp);
			break;	
			// 공지사항 작성
		case "/notice/noticeWrite.bo":
			forward = new noticeWriteAction().execute(req,resp);
			break;	
			// 공지사항 인서트
		case "/notice/noticeWriteOk.bo":
			forward = new noticeWriteOkAction().execute(req,resp);
			break;	
			// 공지사항 수정
		case "/notice/noticemodify.bo":
			forward = new noticemodifyAction().execute(req,resp);
			break;
			// 공지사항 수정
		case "/notice/noticemodifyOk.bo":
			forward = new noticemodifyOkAction().execute(req,resp);
			break;
			// 공지사항 삭제
		case "/notice/noticdelete.bo":
			forward = new noticedeleteAction().execute(req,resp);
			break;	
			// 리뷰작성
		case "/book/writeReply.bo":
			forward = new writeReplyAction().execute(req,resp);
			break;	
			// 작성된 리뷰를 테이블에 인서트
		case "/reply/insertReply.bo":
			System.out.println("인서트 실행");
			forward = new insertReplyAction().execute(req,resp);
			break;
		}
		// 페이지 이동에 대한 일괄 처리
        if (forward != null) {
            if (forward.isRedirect()) { // Redirect 방식
                resp.sendRedirect(forward.getPath());
            } else { // Forward 방식
                req.getRequestDispatcher(forward.getPath()).forward(req, resp);
            }
        }
	}
}
