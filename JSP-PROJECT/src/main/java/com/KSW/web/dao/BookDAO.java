package com.KSW.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.BookDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class BookDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public BookDAO() {
		sqlSession = factory.openSession(true);
	}

	public void insertBookDetails(BookDTO bdto) {
		sqlSession.insert("Search.setBookDetail",bdto);
	}

	public List<BookDTO> traffic(int startRow, int endRow) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow",startRow);
		datas.put("endRow",endRow);
		List<BookDTO> trafficList = sqlSession.selectList("Search.traffic", datas);
		return trafficList;
	}
	
}
