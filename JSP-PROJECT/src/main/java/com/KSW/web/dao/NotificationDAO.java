package com.KSW.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.NotificationDTO;
import com.KSW.web.dto.QnaDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class NotificationDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;

	public NotificationDAO(){
		sqlSession = factory.openSession(true);
	}
	
	public List<NotificationDTO> getNotificationList(){
		return sqlSession.selectList("getNotificationList");
	}
	
	public boolean insertnoticeWrite(NotificationDTO ndto) {
		boolean result = false;
		if(sqlSession.insert("insertnoticeWrite",ndto) == 1) {
			result = true;
		}
		return result;
	}
	
	public boolean deletenotice(int notificationNum) {
		boolean result = false;
		if(sqlSession.delete("deletenotice",notificationNum) == 1) {
			result = true;
		}
		return result;
	}
	
	public boolean updatenotice(NotificationDTO ndto) {
		boolean result = false;
		if(sqlSession.update("updatenotice",ndto) == 1) {
			result = true;
		}
		return result;
	}
	
	public String getnotificationTitle(int notificationNum) {
		return sqlSession.selectOne("getnotificationTitle",notificationNum);
	}
	public String getnotificationDetails(int notificationNum) {
		return sqlSession.selectOne("getnotificationDetails",notificationNum);
	}
}
