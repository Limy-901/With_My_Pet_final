package pet.member.controller;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pet.member.service.MemberService;
import pet.member.service.MypagePetService;

import pet.member.vo.MemberVO;
import pet.member.vo.MypagePetVO;
import pet.message.service.MsgService;

@Controller
@RequestMapping(value = "/member")
public class LoginController {
	
   private Logger logger = LoggerFactory.getLogger(LoginController.class);
   
   @Inject
   private MemberService service;
   
   @Inject()
   private MsgService msgService;
   
   @Inject
   private MypagePetService petservice;
   
   @Inject
   private BCryptPasswordEncoder pwencoder;
   
   //로그인
   @RequestMapping(value = "/login.do", method = RequestMethod.GET)
   public String getLogin() throws Exception {
      logger.info("login.do 호출성공");
      return "member/login";
   }
   
   // 로그인 처리
      @RequestMapping(value = "/login.do", method = RequestMethod.POST)
      public ModelAndView postLogin(@ModelAttribute("MemberVO") MemberVO lvo, HttpSession session, HttpServletRequest request) {
         logger.info("로그인 처리 성공");
         
         ModelAndView mav = new ModelAndView();
         
         MemberVO vo = service.login(lvo);
         
         if(vo == null) {
            mav.addObject("msg", "아이디를 정확히 입력해 주세요.");
            mav.setViewName("member/signup");
            return mav;
         }
         
         boolean passMatch = pwencoder.matches(lvo.getMember_password(), vo.getMember_password());
        
         
         //로그인 성공
         if (passMatch) {
        	 session.setAttribute("login", vo);
        	 mav.setViewName("member/mypage");
        	 int member_number = vo.getMember_number();
        	 long count = msgService.getUnreadMsg(member_number);
        	 session.setAttribute("unread", count);
        	 logger.info("읽지 않은 메시지"+count);
        	 MypagePetVO mpvo = petservice.petMypage(member_number);
  		   	 logger.info("이거되니?"+mpvo);
  		     
  		   	 mav.addObject("mpvo", mpvo);
  		   	 session.setAttribute("petMypage", mpvo);
        	 
        	 
        	 return mav;
 	 
         }else {
            mav.addObject("msg", "패스워드를 정확히 입력해주세요.");
            mav.setViewName("member/agree");
            return mav;
         }

      }
      
   //로그아웃 처리
   @RequestMapping(value = "/logout.do")
   public String logout(HttpSession session, HttpServletRequest request) {
      logger.info("logout 처리 성공");
      
      request.getSession().removeAttribute("login");
      session.removeAttribute("login");
      session.invalidate();
      
      return "redirect:/";
   }
   
   //아이디 찾기 창
   @RequestMapping(value = "/emailFind.do", method = RequestMethod.GET)
   public String getIdFind() throws Exception {
      logger.info("emailFind.do 호출 성공");
      return "member/emailFind";
   }
   
   //패스워드 찾기 창
   @RequestMapping(value = "/pwFind.do", method = RequestMethod.GET)
   public String getPwFind() throws Exception {
      logger.info("get pwFind");
      return "member/pwFind";
   }
   
      //아이디 찾기
      @ResponseBody
      @GetMapping(value="emailSearch.do",  produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
   	public MemberVO emailFind(String address, String name) throws Exception {
   	   MemberVO vo = service.getEmailSearch(address,name);
   		return vo;
      }
      
      //비밀번호 찾기 
      @ResponseBody
      @PostMapping(value = "pwSearch.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
      public MemberVO pwFind(String email) throws Exception{
   		logger.info("이거 돼냐??"+email);  
   		MemberVO vo = new MemberVO();
   		 String pw = service.getpwSearch(email);
   		 	vo.setMember_password(pw);
   		    logger.info("이거 돼?"+pw);
   	    return vo;
      }
      
	  //패스워드 수정
	  @RequestMapping(value = "/pwModify.do", method = RequestMethod.GET)
	  public String getPwModify() throws Exception {
	     logger.info("get pwModify");
	     return "member/pwModify";
	  }
	  //회원 패스워드 수정
	   @RequestMapping(value = "/memberPwdModify.do", method = RequestMethod.GET)
	   public String getMemberPwModify() throws Exception {
	     logger.info("get getMemberPwModify");
	     return "member/memberPwdModify";
	  }
	         
   //패스워드 수정
      @RequestMapping(value = "/pwModify.do", method = RequestMethod.POST)
      public String memberUpdate(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
         logger.info("패스워드 변경 성공");
         
         String secPwd = pwencoder.encode(vo.getMember_password());
         
         vo.setMember_password(secPwd);
         
         service.pwModify(vo);
         
         session.invalidate();
        
         return "member/login";
      }
}