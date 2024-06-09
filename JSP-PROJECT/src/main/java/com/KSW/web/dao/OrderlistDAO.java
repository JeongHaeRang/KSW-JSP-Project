package com.KSW.web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.CartDTO;
import com.KSW.web.dto.OrderListDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class OrderlistDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public OrderlistDAO() {
		sqlSession = factory.openSession(true);
	}
	
	public List<OrderListDTO> getOrderList(int startRow, int endRow, String userid) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("userid", userid);
		
		List<OrderListDTO> OrderList 
			= sqlSession.selectList("getOrderList", datas);
		return OrderList;
	}
	
	public int getOrderCnt(String userid) {
		return sqlSession.selectOne("getOrderCnt", userid);
	}
	
	public String getUserName(String userid) {
		return sqlSession.selectOne("getUserName", userid);
	}
	
	public boolean insertOrderList(OrderListDTO odto) {
		boolean result = false;
		if(sqlSession.insert("MyPage.setOrder",odto) == 1) {
			result = true;
		}
		return result;
	}
	
	public String getTitle(String ordernum) {
		return sqlSession.selectOne("getTitle", ordernum);
	}
	
}
