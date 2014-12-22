package com.nhnent.guestbook.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhnent.guestbook.dao.GuestbookDao;
import com.nhnent.guestbook.vo.Guestbook;

@Component
public class GuestbookService {

	
	public static final Logger logger = LoggerFactory.getLogger(GuestbookService.class);
	@Autowired
	SqlSession sqlsession;
	
	public void insertGuestbook(Guestbook guestbook) {
		GuestbookDao guestbookDao = sqlsession.getMapper(GuestbookDao.class);
		logger.info("email = {}",guestbook.getEmail());
		logger.info("password = {}",guestbook.getPassword());
		logger.info("content = {}",guestbook.getContent());
		guestbookDao.insertGuestbook(guestbook);
	}
	
	public List<Guestbook> selectAllGuestbook() {
		GuestbookDao guestbookDao = sqlsession.getMapper(GuestbookDao.class);
		return guestbookDao.selectAllGuestbook();
	}
	
	
}
