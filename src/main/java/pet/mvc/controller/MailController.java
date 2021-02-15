package pet.mvc.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;
import pet.mvc.vo.TestMailer;

@Log4j
@Controller
public class MailController {
	@Autowired
	private TestMailer testMailer;  //사용

	@RequestMapping(value = "/sendmail.do")
	@ResponseBody
	public String sendmail(@RequestParam HashMap<Object, Object> param) {
		try {
			testMailer.sendMail("thisis_chloe@naver.com", "이것은 제목", "스프링으로 구현해서 보내본다.");
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";			
		}
		
		return "SUCC";
	}	
}
