package com.KSW.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.NotificationDTO;
import com.KSW.web.dto.OrderListDTO;
import com.KSW.web.dto.QnaDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class QnaDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public QnaDAO(){
		sqlSession = factory.openSession(true);
	}
	
	public List<QnaDTO> getinquiryList(int startRow, int endRow, String userid) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("userid", userid);
		
		List<QnaDTO> inquiryList 
			= sqlSession.selectList("getinquiryList", datas);
		return inquiryList;
	}
	
	public List<QnaDTO> getinquiryListAdmin(int startRow, int endRow, String userid) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("userid", userid);
		
		List<QnaDTO> inquiryList 
			= sqlSession.selectList("getinquiryListAdmin", datas);
		return inquiryList;
	}
	
	public int getinquiryCnt(String userid) {
		return sqlSession.selectOne("getinquiryCnt", userid);
	}
	
	public String getUserName(String userid) {
		return sqlSession.selectOne("getUserName", userid);
	}
	
	public boolean insertinquiryWrite(QnaDTO qdto) {
		boolean result = false;
		if(sqlSession.insert("insertinquiryWrite",qdto) == 1) {
			result = true;
		}
		return result;
	}
	
}
