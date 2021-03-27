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
   
   //�α���
   @RequestMapping(value = "/login.do", method = RequestMethod.GET)
   public String getLogin() throws Exception {
      logger.info("login.do ȣ�⼺��");
      return "member/login";
   }
   
   // �α��� ó��
      @RequestMapping(value = "/login.do", method = RequestMethod.POST)
      public String postLogin(@ModelAttribute("MemberVO") MemberVO lvo, HttpSession session, HttpServletRequest request) {
         logger.info("�α��� ó�� ����");
         
         ModelAndView mav = new ModelAndView();
         
         MemberVO vo = service.login(lvo);
         
         if(vo == null) {
            mav.addObject("msg", "���̵� ��Ȯ�� �Է��� �ּ���.");
            //mav.setViewName("member/signup");
            return "redirect:/";
         }
         
         boolean passMatch = pwencoder.matches(lvo.getMember_password(), vo.getMember_password());
         logger.info("��й�ȣ �޾�?"+lvo.getMember_password()+ "��й�ȣ �޾�?222"+vo.getMember_password());
         logger.info("passMatch" + passMatch);
         
         
         //�α��� ����
         if (passMatch) {
        	 session.setAttribute("login", vo);
        	 mav.setViewName("/index");
        	 int member_number = vo.getMember_number();
        	 long count = msgService.getUnreadMsg(member_number);
        	 session.setAttribute("unread", count);
        	 MypagePetVO mpvo = petservice.petMypage(member_number);
  		   	 logger.info("�̰ŵǴ�?"+mpvo);
  		   	 mav.addObject("mpvo", mpvo);
  		   	 session.setAttribute("petMypage", mpvo);
  		   	 //�α��� ��� �����
  		     service.loginLog(member_number);
        	 
        	 return "redirect:/";
 	 
         }else {
            mav.addObject("msg", "�н����带 ��Ȯ�� �Է����ּ���.");
           // mav.setViewName("member/agree");
            return "redirect:/";
         }

      }
      
   //�α׾ƿ� ó��
   @RequestMapping(value = "/logout.do")
   public String logout(HttpSession session, HttpServletRequest request) {
      logger.info("logout ó�� ����");
      
      request.getSession().removeAttribute("login");
      session.removeAttribute("login");
      session.invalidate();
      
      return "redirect:/";
   }
   
   //���̵� ã�� â
   @RequestMapping(value = "/emailFind.do", method = RequestMethod.GET)
   public String getIdFind() throws Exception {
      logger.info("emailFind.do ȣ�� ����");
      return "member/emailFind";
   }
   
   //�н����� ã�� â
   @RequestMapping(value = "/pwFind.do", method = RequestMethod.GET)
   public String getPwFind() throws Exception {
      logger.info("get pwFind");
      return "member/pwFind";
   }
   
      //���̵� ã��
      @ResponseBody
      @GetMapping(value="emailSearch.do",  produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
   	public MemberVO emailFind(String address, String name) throws Exception {
   	   MemberVO vo = service.getEmailSearch(address,name);
   		return vo;
      }
      
      //��й�ȣ ã�� 
      @ResponseBody
      @PostMapping(value = "pwSearch.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
      public MemberVO pwFind(String email) throws Exception{
   		logger.info("�̰� �ų�??"+email);  
   		MemberVO vo = new MemberVO();
   		 String pw = service.getpwSearch(email);
   		 	vo.setMember_password(pw);
   		    logger.info("�̰� ��?"+pw);
   	    return vo;
      }
      
	  //�н����� ����
	  @RequestMapping(value = "/pwModify.do", method = RequestMethod.GET)
	  public String getPwModify() throws Exception {
	     logger.info("get pwModify");
	     return "member/pwModify";
	  }
	  //ȸ�� �н����� ����
	   @RequestMapping(value = "/memberPwdModify.do", method = RequestMethod.GET)
	   public String getMemberPwModify() throws Exception {
	     logger.info("get getMemberPwModify");
	     return "member/memberPwdModify";
	  }
	         
   //�н����� ����
      @RequestMapping(value = "/pwModify.do", method = RequestMethod.POST)
      public String memberUpdate(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
         logger.info("�н����� ���� ����");
         
         String secPwd = pwencoder.encode(vo.getMember_password());
         
         vo.setMember_password(secPwd);
         
         service.pwModify(vo);
         
         session.invalidate();
        
         return "member/login";
      }
}