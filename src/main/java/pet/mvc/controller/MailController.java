package pet.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import lombok.extern.log4j.Log4j;
import pet.mvc.walk.Mailer;

@Controller
public class MailController {
	@Autowired(required=false)
	private Mailer mailer; 

	@RequestMapping(value = "/sendmail.do")
	@ResponseBody
	public String sendmail(String receiver,String sender) {
		String subject = sender+"님이 함께 산책하고 싶어합니다.";
		try {
			mailer.sendMail(receiver, subject, "산책요청내용");
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";			
		}
		
		return "SUCC";
	}	
}