package com.KSW.web.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.UsersDTO;
import com.KSW.web.mybatis.SqlMapConfig;

import jakarta.servlet.jsp.jstl.sql.Result;

public class UsersDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public UsersDAO() {
		sqlSession = factory.openSession(true);
	}
	
	// 회원가입 절차
	public boolean join(UsersDTO udto) {
		boolean result = false;
		
		if(sqlSession.insert("Users.join",udto) == 1) {
			result = true;
		}
		
		return result;
	}
	
	// 로그인 기능
	public boolean login(String userid, String userpw) {
		boolean result = false;
		HashMap<String, String> idpw = new HashMap<>();
		idpw.put("userid", userid);
		idpw.put("userpw", userpw);
		if((Integer)sqlSession.selectOne("Users.loginboolean", idpw) == 1) {
			result = true;
		}
		
		return result;
	}
	
	public UsersDTO getparam(String userid, String userpw) {
		HashMap<String, String> idpw = new HashMap<>();
		idpw.put("userid", userid);
		idpw.put("userpw", userpw);
		return sqlSession.selectOne("Users.login", idpw);
	}
	
	// 아이디 중복체크
	public boolean CheckId(String userid) {
		boolean result = false;
		int cnt = 0;
		cnt = sqlSession.selectOne("Users.CheckId",userid);
		if(cnt >= 1) {
			result = true;
		}
		return result;
	}

	

	public boolean findId(String username, String useremail) {
		boolean result = false;
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("username", username);
		data.put("useremail", useremail);
		
		if((Integer)sqlSession.selectOne("Users.findid",data) == 1) {
			System.out.println("아이디 찾기 성공");
			result = true;
		} else {
			System.out.println("아이디 찾기 실패");
		}
		
		return result;
	}

	public String getid(String username, String useremail) {
		String id = null;
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("username", username);
		data.put("useremail", useremail);
		id = sqlSession.selectOne("Users.getid",data);
		
		return id;
	}

	public boolean findpw(String username, String userid, String useremail) {
		boolean result = false;
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("username", username);
		data.put("userid", userid);
		data.put("useremail", useremail);
		if((Integer)sqlSession.selectOne("Users.findpw",data) == 1) {
			System.out.println("비밀번호 찾기 성공");
			result = true;
		} else {
			System.out.println("비밀번호 찾기 실패");
		}
		return result;
	}

	public boolean updatepw(String userid, String newuserpw) {
		boolean result = false;
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("userid", userid);
		data.put("newuserpw", newuserpw);
		if((Integer)sqlSession.update("Users.updatepw",data) ==1) {
			result = true;
		}
		return result;
	}

	public boolean insertJoin(UsersDTO udto) {
		boolean result = false;
		if(sqlSession.insert("Users.join",udto) == 1) {
			result = true;
		}
		return result;
	}

	public String getuseremail(String userid) {
		return sqlSession.selectOne("getuseremail", userid);
	}
	
	public String getusername(String userid) {
		return sqlSession.selectOne("getusername", userid);
	}
	
	public String getuserbirth(String userid) {
		return sqlSession.selectOne("getuserbirth", userid);
	}
	
	public String getuserphone(String userid) {
		return sqlSession.selectOne("getuserphone", userid);
	}
	
	public String getuseraddr(String userid) {
		return sqlSession.selectOne("getuseraddr", userid);
	}	
    public void updateUserName(String userid, String username) {
        sqlSession.update("updateUserName", Map.of("userid", userid, "username", username));
    }
    
    public void updateUserPassword(String userid, String userpw) {
        sqlSession.update("updateUserPassword", Map.of("userid", userid, "userpw", userpw));
    }
    
    public void updateUserAddress(String userid, String useraddr) {
        sqlSession.update("updateUserAddress", Map.of("userid", userid, "useraddr", useraddr));
    }
	
    // 다른 메서드들...
}
        

