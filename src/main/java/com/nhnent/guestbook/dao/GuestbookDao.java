package com.nhnent.guestbook.dao;

import java.util.List;

import com.nhnent.guestbook.vo.Guestbook;

public interface GuestbookDao {

	public void insertGuestbook(Guestbook guestbook);
	public List<Guestbook> selectAllGuestbook();
	public void deleteGuestbook(Guestbook guestbook);
	public void updateGuestbook(Guestbook guestbook);
}
