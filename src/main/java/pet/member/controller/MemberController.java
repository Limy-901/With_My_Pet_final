package pet.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pet.member.service.MemberService;
import pet.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
   private Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   
   @Inject
   private MemberService service;
   
   @Inject
   private BCryptPasswordEncoder pwencoder;
   
   
   //이용약관
   @RequestMapping(value = "/agree.do", method = RequestMethod.GET)
   
   public String getClause() throws Exception {
      logger.info("agree.do 호출 성공");
      return "/member/agree";
   }
   
   //회원가입
   @RequestMapping(value = "/signup.do", method = RequestMethod.GET)
   
   public String getJoin() throws Exception {
      logger.info("signup.do 호출 성공");
      return "/member/signup";
   }
   
   
  //회원가입 처리
  @RequestMapping(value = "/signup.do", method = RequestMethod.POST)
  public String postJoin(@ModelAttribute MemberVO vo ,  HttpServletRequest request) throws Exception {
     logger.info("회원가입 처리 성공");
     int result = service.mailChk(vo.getMember_email());
     
     try {
        if(result == 1) {
           return "member/signup";
           
        }else if(result == 0) {
           //  브라우저에서 입력한 패스워드를 암호화한다.
           String secPwd = pwencoder.encode(vo.getMember_password());
           logger.info("회원가입 정보 : " + vo.getMember_email() + ", "+vo.getMember_password() + ", "+vo.getMember_name() + ", " + vo.getMember_address());
           //  암호화된 비밀번호를 VO에 SET한다.
           vo.setMember_password(secPwd);
           //  DB에 회원가입 처리 성공
           service.join(vo);
        }
        //입력된 아이디가 존재한다면 다시 회원가입 페이지로 돌아간다
     } catch(Exception e) {
        throw new RuntimeException();
     }
     return "member/login";
  }

      
  //이메일 중복 체크
  @ResponseBody
  @PostMapping(value="mailChk.do",  produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
  public int mailChk(String email) throws Exception {
     logger.info("이메일 중복체크 성공"+email);
     int result = service.mailChk(email);
     return result;
  }
}