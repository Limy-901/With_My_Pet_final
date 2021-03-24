package pet.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.log4j.Log4j;
import pet.admin.service.AdminService;
import pet.admin.vo.MemListResult;
import pet.admin.vo.MemberWalkChart;
import pet.admin.vo.OrderStatus;
import pet.admin.vo.Qna;
import pet.member.vo.MemberVO;
import pet.mvc.board.Board;
import pet.shop.domain.Product;
import pet.shop.fileSetting.path;
import pet.shop.service.FileUploadService;
import pet.walk.vo.Walk;
import static pet.admin.vo.Options.*;

@Log4j
@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	@Resource(name="FileUploadServiceImpl")
	private FileUploadService fileService;

	@RequestMapping("index.do")
	private ModelAndView index() {
		Hashtable<String, Object> map = adminService.getIndexData();
		ModelAndView mv = new ModelAndView("admin/adminIndex","indexData",map);
		return mv;
	}
	@RequestMapping("memberList.do")
	private ModelAndView memberList(HttpSession session,
			@RequestParam (defaultValue="0",required=false)int memCp,
			@RequestParam (required=false)String memKeyword) {
		if(memCp == 0) {
			Object cpObj = session.getAttribute("memCp");
			if(cpObj != null) memCp=(Integer)cpObj;
			else memCp = 1;
		}
		session.setAttribute("memCp", memCp);
		if(memKeyword == null) {
			String keySession = (String) session.getAttribute("memKeyword");
			if(keySession != null) keySession = keySession.trim();
			memKeyword = keySession;
		}
		session.setAttribute("memKeyword", memKeyword);
		MemListResult list = adminService.getTotalMemberList(memCp, memKeyword);
		ModelAndView mv = new ModelAndView("admin/memberList","result",list);
		if(list.getList().size() == 0) {
			if(memCp>1) return new ModelAndView("redirect:memberList.do?cp="+(memCp-1));
			else return new ModelAndView("admin/memberList","result",null);
		}else return mv;
	}
	
	@GetMapping(value="memberDelete.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody MemListResult memberDelete(HttpSession session, long member_number) {
		adminService.deleteMember(member_number);
		int memCp = (Integer)session.getAttribute("memCp");
		String memKeyword = null;
		MemListResult list = adminService.getTotalMemberList(memCp, memKeyword);
		return list;
	}
	
	@RequestMapping("nextWalk.do")
	private ModelAndView nextWalk() {
		Hashtable<String, Object> map = new Hashtable<String, Object>();
		ArrayList<Walk> lists = adminService.getWalks(NEXT_WALKS);
		ArrayList<String> times = adminService.getWalkTimes(lists,NEXT_WALKS);
		map.put("lists",lists);
		map.put("times",times);
		ModelAndView mv = new ModelAndView("admin/nextWalk","map",map);
		return mv;
	}
	
	@RequestMapping("previousWalk.do")
	private ModelAndView previousWalk() {
		Hashtable<String, Object> map = new Hashtable<String, Object>();
		ArrayList<Walk> lists = adminService.getWalks(PREVIOUS_WALKS);
		ArrayList<String> times = adminService.getWalkTimes(lists,PREVIOUS_WALKS);
		map.put("lists",lists);
		map.put("times",times);
		ModelAndView mv = new ModelAndView("admin/previousWalk","map",map);
		return mv;
	}
	@GetMapping("registerProduct.do")
	private String registerProduct() {
		return "/admin/registerProduct";
	}
	@RequestMapping("registerProduct.do")
	private String upload(MultipartFile uploadfile,Product product,long catgo_code) throws Exception {
		log.info("register 뷰가 나오네? ㅎ");
		log.info("upload() POST 호출");
	    log.info("파일 이름: {}"+ uploadfile.getOriginalFilename());
	    log.info("파일 크기: {}"+ uploadfile.getSize());
	    log.info("product_name: "+product);
		return saveFilee(uploadfile,product,catgo_code);
	}
	private String saveFilee(MultipartFile file, Product product,long catgo_code) {
		//파일 이름 변경
		UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();
	    log.info("saveName: {}"+saveName);
	    // 저장할 File 객체를 생성(껍데기 파일)
	    File saveFile = new File(path.FILE_STORE,saveName); // 저장할 폴더 이름, 저장할 파일 이름
	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "../category";
	    }
	    
	    if(saveFile.length() !=0) {
	    	String url = fileService.saveStore(file, product);//service로 이동..파일 저장함
	    }
	    return "redirect:category?catgo_code=8";
		}
		
	
	@RequestMapping("productQ.do")
	private ModelAndView productQ() {
		ArrayList<Board> lists = adminService.getNotAnsweredQ();
		ModelAndView mv = new ModelAndView("admin/productQ","lists",lists);
		return mv;
	}
	
	@GetMapping(value="answer.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody ArrayList<Board> answer(HttpSession session, String content, int board_idx) {
		MemberVO vo = (MemberVO)session.getAttribute("login");
		adminService.writeAnswer(content,board_idx,vo.getMember_number());
		ArrayList<Board> lists = adminService.getNotAnsweredQ();
		return lists;
	}
	
	@RequestMapping("productA.do")
	private ModelAndView productA(HttpSession session,
			@RequestParam (defaultValue="0",required=false)int qnaCp,
			@RequestParam (required=false)String qnaKeyword) {
		if(qnaCp == 0) {
			Object cpObj = session.getAttribute("memCp");
			if(cpObj != null) qnaCp=(Integer)cpObj;
			else qnaCp = 1;
		}
		session.setAttribute("memCp", qnaCp);
		if(qnaKeyword == null) {
			String keySession = (String) session.getAttribute("memKeyword");
			if(keySession != null) keySession = keySession.trim();
			qnaKeyword = keySession;
		}
		session.setAttribute("memKeyword", qnaKeyword);
		ArrayList<Qna> lists = adminService.getAnsweredQ(qnaCp, qnaKeyword);
		ModelAndView mv = new ModelAndView("admin/productA","lists",lists);
		return mv;
	}
	
	@RequestMapping("orderStatus.do")
	private ModelAndView orderStatus() {
		ArrayList<OrderStatus> list = adminService.getOrderStatus();
		ModelAndView mv = new ModelAndView("admin/orderStatus","list",list);
		return mv;
	}
	
	@GetMapping(value="editDeli.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody ArrayList<Board> editDeli(HttpSession session, long editType) {
		String edit = "";
		if (editType == 1) edit = "����غ�";
		else if (editType == 2) edit = "�����";
		else if (editType == 3) edit = "��ۿϷ�";
		return null;
	}
	
	@RequestMapping("walkStatistic.do")
	private ModelAndView walkStatistic() {
		Hashtable<String, Object> map = new Hashtable<String, Object>(); 
		ArrayList<MemberWalkChart> lists1 = adminService.getMemChartValues();
		ArrayList<MemberWalkChart> lists2 = adminService.getLocationList();
		map.put("walkLists",lists1);
		map.put("locLists",lists2);
		ModelAndView mv = new ModelAndView("admin/walkStatistic", "map", map);
		return mv;
	}
	
	@RequestMapping("salesStatistic.do")
	private String salesStatistic() {
		return "admin/salesStatistic";
	}
	
	
}
