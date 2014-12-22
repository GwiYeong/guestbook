package com.nhnent.guestbook.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nhnent.guestbook.service.GuestbookService;
import com.nhnent.guestbook.vo.Guestbook;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	GuestbookService guestbookService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		List<Guestbook> guestbookList = guestbookService.selectAllGuestbook();
		
		for(Guestbook g : guestbookList) {
			logger.info("email = {}",g.getEmail());
			logger.info("password = {}",g.getPassword());
			logger.info("content = {}",g.getContent());
			logger.info("registtime = {}",g.getRegistTime().toString());
		}
		
		return "home";
	}
	
}
