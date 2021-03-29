package pet.mvc.controller;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.member.vo.MemberVO;
import pet.mvc.board.Board;
import pet.mvc.service.BoardService;
import pet.mvc.service.IndexService;
import pet.walk.service.WalkService;
import pet.walk.vo.IndexData;
import pet.walk.vo.Walk;


@Log4j
@Controller
@AllArgsConstructor
public class IndexController {
	private IndexService indexService;
	private WalkService walkService;
	private BoardService boardService;
	
	@RequestMapping("/")
	public ModelAndView home(HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("login");
		log.info("�ȳ�");
		Hashtable<String, Object> map = new Hashtable<String, Object>();
		ArrayList<Walk> walks = indexService.getWalkList();
		ArrayList<String> walkPics = new ArrayList<String>();
		List<Board> board = boardService.getRecent();
		for(Walk dto : walks) {
			String walkPic = walkService.getWalkPic(dto.getMember_number());
			walkPics.add(walkPic);
		}
		IndexData walkData = indexService.getWalkData();
		if(vo != null) {
			Walk recentWalk = indexService.getRecentWalk(vo.getMember_number());
			if(recentWalk != null) {
				long sender_number = indexService.getJoinMemberNumber(recentWalk.getWalk_idx(), vo.getMember_number());
				map.put("recentWalk",recentWalk);
				map.put("sender_number",sender_number);
				log.info("산책있음. 셋팅완료");
			}
		}
		map. put("walk",walks);
		map. put("walkPics",walkPics);
		map. put("walkData",walkData);
		
		ModelAndView mv = new ModelAndView("index","map",map);
		mv.addObject("board", board);
		return mv;
	}
}
