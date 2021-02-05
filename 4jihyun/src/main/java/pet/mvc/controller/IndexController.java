package pet.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class IndexController {
	@RequestMapping("/")
	public String home() {
		log.info("안녕");
		return "index";
	}
	
}
