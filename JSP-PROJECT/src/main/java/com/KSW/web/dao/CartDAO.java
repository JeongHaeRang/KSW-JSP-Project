package com.KSW.web.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.CartDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class CartDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public CartDAO() {
		sqlSession = factory.openSession(true);
	}

	public boolean insertCart(CartDTO cdto) {
		boolean result = false;
		if(sqlSession.insert("MyPage.setCart",cdto) == 1) {
			result = true;
		}
		return result;
	}
	
	public int getCart(String userid, String isbn) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("userid", userid);
		datas.put("isbn", isbn);
		
		return sqlSession.selectOne("MyPage.getCart",datas);
	}
	
	public boolean deleteCart(int cartNum) {
		boolean result = false;
		if(sqlSession.delete("MyPage.delCart",cartNum) == 1) {
			result = true;
		}
		return result;
	}

	
	
}
