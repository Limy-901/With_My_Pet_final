package pet.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pet.member.service.MemberService;
import pet.member.service.MypagePetService;
import pet.member.service.MypagePetServiceImpl;
import pet.member.vo.MemberVO;
import pet.member.vo.MypagePetVO;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MypageController {
   private Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   
   @Inject
   private MemberService service;
   
   @Inject
   private MypagePetService petservice;
   
   @Inject
   private BCryptPasswordEncoder pwencoder;
   
         

        //마이페이지 
         @RequestMapping(value = "/mypage.do")
         public String mypage() {
            logger.info(" mypage호출성공");
            return "/member/mypage";
         }
         
       //마이페이지정보수정창 
         @RequestMapping(value = "/mypageupdate.do", method = RequestMethod.GET)
         public ModelAndView getmypageupdate(HttpSession session) throws Exception {
        	
      	   MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
      	   log.info("####이게 중요함"+mpvo);
      	   session.setAttribute("petMypage", mpvo);
      	 ModelAndView mv = new ModelAndView("/member/mypageupdate","mpvo",mpvo);
            return mv;
         }

         
       
       //마이페이지갱얼쥐정보수정창 
         @RequestMapping(value = "/mypagepetupdate.do", method = RequestMethod.GET)
         public ModelAndView getmypagepetupdate(HttpSession session) throws Exception {
            logger.info("mypagepetupdate호출성공");

            MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
       	    log.info("####이게 중요함22"+mpvo);
       	    session.setAttribute("petMypage", mpvo);
       	    ModelAndView mv = new ModelAndView("/member/mypagepetupdate","mpvo",mpvo);
            return mv;
         }

   
   
 //마이페이지
   @ResponseBody
   @GetMapping(value="mypage.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public MypagePetVO mypage(MypagePetVO pvo, MemberVO vo, HttpSession session,  HttpServletRequest request) throws Exception {
	   log.info("#### 여기임 ㅎ");
	   MemberVO mvo = (MemberVO) session.getAttribute("login");
	   int member_number = mvo.getMember_number();
	   
	   
	   MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
	   log.info("####이게 중요함"+mpvo);
	   
	   session.setAttribute("petMypage", mpvo);
	   session.setAttribute("login", vo);
	   
	   return mpvo;
   }
   
   //마이페이지 정보수정
	@RequestMapping(value = "/mypageupdate.do", method = RequestMethod.POST)
		public String postMemberupdatedo(@ModelAttribute MemberVO vo ,MultipartFile uploadfile, HttpSession session,  HttpServletRequest request) throws Exception {
			ModelAndView mav = new ModelAndView();
			 
			String mpvo = (String) session.getAttribute("petMypage");
			 
			session.setAttribute("petMypage", mpvo);
			mav.setViewName("/member/mypageupdate");

			
			
		
		   MemberVO vo2 = (MemberVO) session.getAttribute("login");			  
		  
	      logger.info("mypage 정보수정 호출 성공"+vo2.getMember_number());
	      
	      vo.setMember_number(vo2.getMember_number());	      

           //  브라우저에서 입력한 패스워드를 암호화한다.
           String secPwd = pwencoder.encode(vo.getMember_password());
           logger.info("정보수정 : " +vo.getMember_number()+","+ vo.getMember_password() + ", "+vo.getMember_name() + ", " + vo.getMember_address());
           //  암호화된 비밀번호를 VO에 SET한다.
           
           vo.setMember_password(secPwd);
           //  DB에 회원가입 처리 성공
           service.memberModify(vo);
           
           return "member/mypageupdate";
         //마이페이지 수정이 아닌 진짜 마이페이지 창으로 나가야함
      }
	   
	   

	 //강아지 정보 수정 처리
	   @RequestMapping(value = "/mypagepetupdate.do", method = RequestMethod.POST)
	   
	   public String postPetupdatedo(@ModelAttribute  MypagePetVO vo, MultipartFile uploadfile, HttpSession session,  HttpServletRequest request) throws Exception {
		   
		   //
		   MemberVO mvo = (MemberVO) session.getAttribute("login");
		   int member_number = mvo.getMember_number();
			  
			  MypagePetVO mpvo = petservice.petMypage(member_number);
			  log.info(mpvo);
			   
			  session.setAttribute("petMypage", mpvo);
		   //
		   
		   logger.info("upload() POST 호출");
	       logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
	       logger.info("파일 크기: {}", uploadfile.getSize());

	       String savename = saveFile(uploadfile);
	       
	       String pet_ofname = uploadfile.getOriginalFilename();
	       vo.setPet_ofname(pet_ofname);
	       
	       long pet_fsize = uploadfile.getSize();
	       vo.setPet_fsize(pet_fsize);
	       
	       vo.setPet_fname(savename);
	       
	       
	       
	       
		  MemberVO vo2 = (MemberVO) session.getAttribute("login");
		  
	      logger.info("mypage 정보수정 호출 성공"+vo2.getMember_number());
	      
	      vo.setMember_number(vo2.getMember_number());	      

           
           logger.info("정보수정 : " +vo.getMember_number()+"#s"+ vo.getPet_name() + ", "+vo.getPet_sex() + ", " + vo.getPet_age() 
           			+ ", " + vo.getPet_walkarea() + ", " + vo.getPet_fname() + ", " + vo.getPet_ofname() + ", " + vo.getPet_fsize());
         
           //  DB에 회원가입 처리 성공
           petservice.petUpdateDo(vo);
           
           
           return "member/mypagepetupdate";
         //마이페이지 수정이 아닌 진짜 마이페이지 창으로 나가야함
      }

	   /*
	   @RequestMapping(value = "/mypet.do",method = RequestMethod.POST)
	   public void upload(MultipartFile uploadfile){
	       logger.info("upload() POST 호출");
	       logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
	       logger.info("파일 크기: {}", uploadfile.getSize());

	       saveFile(uploadfile);

	   }
	   */
	   private static final String UPLOAD_PATH = "C:\\Users\\bit\\Desktop\\WithMyPet_Member_ImgUpload";
	   

	   private String saveFile(MultipartFile file){
		   
	       // 파일 이름 변경
	       UUID uuid = UUID.randomUUID();
	       String saveName = uuid + "_" + file.getOriginalFilename();

	       logger.info("saveName: {}",saveName);

	       // 저장할 File 객체를 생성(껍데기 파일)ㄴ
	       File saveFile = new File(UPLOAD_PATH,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	       try {
	           file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	       } catch (IOException e) {
	           e.printStackTrace();
	           return null;
	       }

	       return saveName;
	   } // end saveFile(


}
