package pet.mvc.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.mvc.service.IndexService;
import pet.walk.vo.Walk;


@Log4j
@Controller
@AllArgsConstructor
public class IndexController {
	private IndexService indexService;
	
	@RequestMapping("/")
	public ModelAndView home() {
		log.info("¾È³ç");
		ArrayList<Walk> dtos = indexService.getWalkList();
		ModelAndView mv = new ModelAndView("index","walks",dtos);
		return mv;
	}
}
