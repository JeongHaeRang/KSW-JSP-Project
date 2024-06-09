package com.KSW.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.BookDTO;
import com.KSW.web.dto.CartDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class SearchDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public SearchDAO() {
		sqlSession = factory.openSession(true);
	}
	
	public boolean insertBookDb() {
		boolean result = false;
		BookDTO bdto = new BookDTO();
		if (sqlSession.insert("Reply.insertReply", bdto) == 1) {
			result = true;
		}
		
		return result;
	}

	public boolean countCartList(String userid) {
		boolean result = false;
		if((Integer)sqlSession.selectOne("Search.selectCartListCount", userid) != 0) {
			result = true;
		}
		return result;
	}

	public List<CartDTO> getCartList(String userid) {
		List<CartDTO> cartList
			= sqlSession.selectList("Search.getCartList", userid);
		return cartList;
	}

	public int getCartCnt(String userid) {
		return sqlSession.selectOne("Search.getCartCnt",userid);
	}

}
