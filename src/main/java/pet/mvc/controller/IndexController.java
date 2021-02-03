package pet.mvc.controller;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
