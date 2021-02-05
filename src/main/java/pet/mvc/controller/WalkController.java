package pet.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class WalkController {
	@RequestMapping("/walk.do")
	public String walk() {
		log.info("산책모집");
		return "/pet/about";
	}
	@RequestMapping("/walklist.do")
	public String walklist() {
		return "/pet/walklist";
	}
	
	@RequestMapping("/walkblog.do")
	public String walkblog() {
		log.info("산책글작성");
		return "/pet/walkblog";
	}
	@RequestMapping("/walkpost.do")
	public String walkpost() {
		log.info("산책글작성");
	return "/pet/walkpost";
	}
}
