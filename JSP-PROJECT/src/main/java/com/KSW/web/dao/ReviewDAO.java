package com.KSW.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.ReviewDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class ReviewDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public ReviewDAO() {
		sqlSession = factory.openSession(true);
	}

	public boolean insertReply(ReviewDTO rdto) {
		boolean result = false;
		if(sqlSession.insert("Users.setreply",rdto) == 1) {
			result = true;
		}
		return result;
	}
	
	public List<ReviewDTO> getReplys(String isbn) {
		List<ReviewDTO> replys = sqlSession.selectList("getreplys", isbn);
		return replys;
    }
	public boolean updateReplyStatus(int ordernum) {
		boolean result = false;
		if(sqlSession.update("updateReplyStatus",ordernum) == 1) {
			result = true;
		}
		return result;
	}
	
}
