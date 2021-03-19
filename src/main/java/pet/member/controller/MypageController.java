package pet.member.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.log4j.Log4j;
import pet.member.service.FollowService;
import pet.member.service.MemberService;
import pet.member.service.MypagePetService;
import pet.member.service.MypagePetServiceImpl;
import pet.member.vo.FollowVO;
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
   private FollowService followservice;
   @Inject
   private BCryptPasswordEncoder pwencoder;
   //회원가입
   @RequestMapping(value = "/mypost.do", method = RequestMethod.GET)
   public String mypost() throws Exception {
      logger.info("mypost.do 호출 성공");
      return "/member/mypost";
   }
 //마이페이지
   @RequestMapping(value="/mypage.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
   public ModelAndView mypage(MemberVO vo, MypagePetVO pvo, HttpSession session,  HttpServletRequest request) throws Exception {
	   ModelAndView mav = new ModelAndView();
	     
	      MemberVO mvo = (MemberVO) session.getAttribute("login");
	      log.info("#######mvo + " + mvo);
		  int target_member_number = mvo.getMember_number();
		  log.info("#### 멤버넘버 + " + target_member_number);
		  int member_number = mvo.getMember_number();
		  log.info("#### 멤버넘버 + " + member_number);
		  
	      MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
	
	      ArrayList<FollowVO> followingvo = followservice.following(member_number);
		  log.info("이거되니?`"+followingvo);
		  ArrayList<FollowVO> followervo = followservice.follower(target_member_number);
		  log.info("이거되니?`"+followervo);
		    
	   	  mav.addObject("followingvo", followingvo);
	   	  session.setAttribute("followingvo", followingvo);
	      log.info("### followingvo + " + followingvo);
		    
	   	  mav.addObject("followervo", followervo);
	   	  session.setAttribute("followervo", followervo);
	      log.info("### followervo + " + followervo);
	     
	      //받아온 target_member_number로 member_number 검색하여 정보들 뽑아오기
	      ArrayList<FollowVO> followvo1 = (ArrayList<FollowVO>) session.getAttribute("followervo");
	      ArrayList<FollowVO> followvo2 = (ArrayList<FollowVO>) session.getAttribute("followingvo");
	     
	      ArrayList<MemberVO> followingMembervo1 = new ArrayList<MemberVO>();
	      ArrayList<MypagePetVO> followingMembervo2 = new ArrayList<MypagePetVO>();
	     
	      ArrayList<MemberVO> followerMembervo1 = new ArrayList<MemberVO>();
	      ArrayList<MypagePetVO> followerMembervo2 = new ArrayList<MypagePetVO>();
	     
	     
	    
	      for(FollowVO fvolist : followvo1) {
	    	  fvolist.getMember_number();
	    	  log.info("############################~~~" + fvolist.getMember_number());
	    	 
	    	  // target의 내정보 불러오기
	    	  MemberVO fffmmm = service.followmypage(fvolist.getMember_number());
	    	  followerMembervo1.add(fffmmm);
	    	  //log.info(">>>>>>>... 최종 ...>>>>>>>> + " + followingMembervo);
	    	 
	    	  // target의 강아지 정보 불러오기
	    	  MypagePetVO fpm = petservice.petMypage(fvolist.getMember_number());
	    	  followerMembervo2.add(fpm);
	    	  //log.info("*****pet정보임 ***** >>>>>" + followingPetMembervo);
	      }
	    
	      for(FollowVO fvolist : followvo2) {
	    	  fvolist.getTarget_member_number();
	    	  log.info("############################~~~" + fvolist.getTarget_member_number());
	    	 
	    	  // target의 내정보 불러오기
	    	  MemberVO fffmmm = service.followmypage(fvolist.getTarget_member_number());
	    	  followingMembervo1.add(fffmmm);
	    	  //log.info(">>>>>>>... 최종 ...>>>>>>>> + " + followingMembervo);
	    	 
	    	  // target의 강아지 정보 불러오기
	    	  MypagePetVO fpm = petservice.petMypage(fvolist.getTarget_member_number());
	    	  followingMembervo2.add(fpm);
	    	  //log.info("*****pet정보임 ***** >>>>>" + followingPetMembervo);
	      }
	      mav.addObject("followingMembervo1", followingMembervo1);
	      mav.addObject("followingMembervo2", followingMembervo2);
	      log.info(followingMembervo1);
	     
	      mav.addObject("followerMembervo1", followerMembervo1);
	      mav.addObject("followerMembervo2", followerMembervo2);
	      log.info(followerMembervo1);
	
	      session.setAttribute("petMypage", mpvo);
		  mav.addObject("mpvo", mpvo);
		  
		  return mav;
	   }
   
 //팔로워 페이지
   @RequestMapping(value = "/follower.do", method = RequestMethod.GET)
   public ModelAndView follower(MemberVO vo, MypagePetVO pvo, FollowVO fvo, HttpSession session,  HttpServletRequest request) throws Exception {
	   logger.info("follower.do 호출 성공");
	   ModelAndView mav = new ModelAndView();
	     
	      MemberVO mvo = (MemberVO) session.getAttribute("login");
	      log.info("#######mvo + " + mvo);
		  int target_member_number = mvo.getMember_number();
		  log.info("#### 멤버넘버 + " + target_member_number);
		  int member_number = mvo.getMember_number();
		  log.info("#### 멤버넘버 + " + member_number);
		  
	      MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
	
	      ArrayList<FollowVO> followingvo = followservice.following(member_number);
		  log.info("이거되니?`"+followingvo);
		  ArrayList<FollowVO> followervo = followservice.follower(target_member_number);
		  log.info("이거되니?`"+followervo);
		    
	   	  mav.addObject("followingvo", followingvo);
	   	  session.setAttribute("followingvo", followingvo);
	      log.info("### 팔로잉vo + " + followingvo);
		    
	   	  mav.addObject("followervo", followervo);
	   	  session.setAttribute("followervo", followervo);
	      log.info("### 팔로워vo + " + followervo);
	     
	      //받아온 target_member_number로 member_number 검색하여 정보들 뽑아오기
	      ArrayList<FollowVO> followvo1 = (ArrayList<FollowVO>) session.getAttribute("followervo");
	      ArrayList<FollowVO> followvo2 = (ArrayList<FollowVO>) session.getAttribute("followingvo");
	     
	      ArrayList<MemberVO> followingMembervo1 = new ArrayList<MemberVO>();
	      ArrayList<MypagePetVO> followingMembervo2 = new ArrayList<MypagePetVO>();
	     
	      ArrayList<MemberVO> followerMembervo1 = new ArrayList<MemberVO>();
	      ArrayList<MypagePetVO> followerMembervo2 = new ArrayList<MypagePetVO>();
	     
	     
	     //팔로워
	      for(FollowVO fvolist : followvo1) {
	    	  fvolist.getMember_number();
	    	  log.info("팔로워의 멤버넘버 불러오기  >>>>>" + fvolist.getMember_number());
	    	 
	    	  // target의 내정보 불러오기
	    	  MemberVO fffmmm = service.followmypage(fvolist.getMember_number());
	    	  followerMembervo1.add(fffmmm);
	    	  log.info("팔로워의 멤버vo 전부  불러오기  >>>>> + " + followerMembervo1);
	    	 
	    	  // target의 강아지 정보 불러오기
	    	  MypagePetVO fpm = petservice.petMypage(fvolist.getMember_number());
	    	  followerMembervo2.add(fpm);
	    	  log.info("팔로워의 강아지 정보vo 전부  불러오기  >>>>>" + followerMembervo2);
	      }
	      mav.addObject("followerMembervo1", followerMembervo1);
	      mav.addObject("followerMembervo2", followerMembervo2);
	      log.info(followerMembervo1);
	   
	      //팔로잉
	      for(FollowVO fvolist : followvo2) {
	    	  fvolist.getTarget_member_number();
	    	  log.info("팔로잉의 멤버넘버 불러오기  >>>>>" + fvolist.getTarget_member_number());
	    	 
	    	  // target의 내정보 불러오기
	    	  MemberVO fffmmm = service.followmypage(fvolist.getTarget_member_number());
	    	  followingMembervo1.add(fffmmm);
	    	 log.info("팔로잉의 멤버vo 전부  불러오기  >>>>> + " + followingMembervo1);
	    	 
	    	  // target의 강아지 정보 불러오기
	    	  MypagePetVO fpm = petservice.petMypage(fvolist.getTarget_member_number());
	    	  followingMembervo2.add(fpm);
	    	  log.info("팔로잉의 강아지 정보vo 전부  불러오기  >>>>>" + followingMembervo2);
	      }
	      mav.addObject("followingMembervo1", followingMembervo1);
	      mav.addObject("followingMembervo2", followingMembervo2);
	      log.info(followingMembervo1);
	     
	      mav.setViewName("/member/follower");
	      return mav;
	   }
 //팔로잉 페이지
   @RequestMapping(value = "/following.do", method = RequestMethod.GET)
   public ModelAndView following(MemberVO vo, MypagePetVO pvo, FollowVO fvo, HttpSession session,  HttpServletRequest request) throws Exception {
      logger.info("following.do 호출 성공");
      ModelAndView mav = new ModelAndView();
      MemberVO mvo = (MemberVO) session.getAttribute("login");
      log.info("#######mvo + " + mvo);
	  int target_member_number = mvo.getMember_number();
	  log.info("#### 멤버넘버 + " + target_member_number);
	  int member_number = mvo.getMember_number();
	  log.info("#### 멤버넘버 + " + member_number);
	  
      MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
      ArrayList<FollowVO> followingvo = followservice.following(member_number);
	  log.info("이거되니?`"+followingvo);
	  ArrayList<FollowVO> followervo = followservice.follower(target_member_number);
	  log.info("이거되니?`"+followervo);
	    
   	  mav.addObject("followingvo", followingvo);
   	  session.setAttribute("followingvo", followingvo);
      log.info("### followingvo + " + followingvo);
	    
   	  mav.addObject("followervo", followervo);
   	  session.setAttribute("followervo", followervo);
      log.info("### followervo + " + followervo);
      //받아온 target_member_number로 member_number 검색하여 정보들 뽑아오기
      ArrayList<FollowVO> followvo1 = (ArrayList<FollowVO>) session.getAttribute("followervo");
      ArrayList<FollowVO> followvo2 = (ArrayList<FollowVO>) session.getAttribute("followingvo");
      ArrayList<MemberVO> followingMembervo1 = new ArrayList<MemberVO>();
      ArrayList<MypagePetVO> followingMembervo2 = new ArrayList<MypagePetVO>();
      ArrayList<MemberVO> followerMembervo1 = new ArrayList<MemberVO>();
      ArrayList<MypagePetVO> followerMembervo2 = new ArrayList<MypagePetVO>();
      for(FollowVO fvolist : followvo1) {
    	  fvolist.getMember_number();
    	  log.info("############################~~~" + fvolist.getMember_number());
    	 
    	  // target의 내정보 불러오기
    	  MemberVO fffmmm = service.followmypage(fvolist.getMember_number());
    	  followerMembervo1.add(fffmmm);
    	  //log.info(">>>>>>>... 최종 ...>>>>>>>> + " + followingMembervo);
    	 
    	  // target의 강아지 정보 불러오기
    	  MypagePetVO fpm = petservice.petMypage(fvolist.getMember_number());
    	  followerMembervo2.add(fpm);
    	  //log.info("*****pet정보임 ***** >>>>>" + followingPetMembervo);
      }
      for(FollowVO fvolist : followvo2) {
    	  fvolist.getTarget_member_number();
    	  log.info("############################~~~" + fvolist.getTarget_member_number());
    	 
    	  // target의 내정보 불러오기
    	  MemberVO fffmmm = service.followmypage(fvolist.getTarget_member_number());
    	  followingMembervo1.add(fffmmm);
    	  log.info("팔로잉의 멤버넘버 불러오기  >>>>> + " + followingMembervo1);
    	 
    	  // target의 강아지 정보 불러오기
    	  MypagePetVO fpm = petservice.petMypage(fvolist.getTarget_member_number());
    	  followingMembervo2.add(fpm);
    	  log.info("팔로잉의 강아지 정보vo 전부  불러오기  >>>>>" + followingMembervo2);
      }
      mav.addObject("followingMembervo1", followingMembervo1);
      mav.addObject("followingMembervo2", followingMembervo2);
      log.info(followingMembervo1);
      mav.addObject("followerMembervo1", followerMembervo1);
      mav.addObject("followerMembervo2", followerMembervo2);
      log.info(followerMembervo1);
      mav.setViewName("/member/following");
      return mav;
   }
   //팔로잉 끊기
   @ResponseBody
   @RequestMapping(value = "deleteFollowing.do", method = RequestMethod.POST)
   public ArrayList<FollowVO> deleteFollowing(HttpSession session, HttpServletRequest request) throws Exception {
      logger.info("deleteFollowing");
      String following_delete = request.getParameter("member_number");
      logger.info("following_delete >>>>>>>"+following_delete);
      ArrayList<FollowVO> fvo = followservice.deleteFollowing(following_delete);
      return fvo;
   }
   
 //팔로워 끊기
   @ResponseBody
   @RequestMapping(value = "deleteFollower.do", method = RequestMethod.POST)
   public ArrayList<FollowVO> deleteFollower(HttpSession session, HttpServletRequest request) throws Exception {
      logger.info("deleteFollowing");
      String follower_delete = request.getParameter("member_number");
      logger.info("following_delete >>>>>>>"+follower_delete);
      ArrayList<FollowVO> fvo = followservice.deleteFollower(follower_delete);
      return fvo;
   }
	
       //마이페이지정보수정창  view
         @RequestMapping(value = "/mypageupdate.do", method = RequestMethod.GET)
         public ModelAndView getmypageupdate(HttpSession session) throws Exception {
        	
      	   MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
      	   log.info("####이게 중요함"+mpvo);
      	   session.setAttribute("petMypage", mpvo);
      	 ModelAndView mv = new ModelAndView("/member/mypageupdate","mpvo",mpvo);
            return mv;
         }
       //마이페이지 강아지 정보수정창
         @RequestMapping(value = "/mypagepetupdate.do", method = RequestMethod.GET)
         public ModelAndView getmypagepetupdate(HttpSession session) throws Exception {
            logger.info("mypagepetupdate호출성공");
            MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
       	    log.info("####이게 중요함22"+mpvo);
       	    session.setAttribute("petMypage", mpvo);
       	    ModelAndView mv = new ModelAndView("/member/mypagepetupdate","mpvo",mpvo);
            return mv;
         }
  /*
       //마이페이지 view
  	   @RequestMapping(value="/viewMypage.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
  	   public ModelAndView viewmypage(MemberVO vo, MypagePetVO pvo, HttpSession session,  HttpServletRequest request) throws Exception {
  	
  		   ModelAndView mav = new ModelAndView();
  		     
  		      MemberVO mvo = (MemberVO) session.getAttribute("login");
  		      log.info("#######mvo + " + mvo);
  			  int target_member_number = mvo.getMember_number();
  			  log.info("#### 멤버넘버 + " + target_member_number);
  			  int member_number = mvo.getMember_number();
  			  log.info("#### 멤버넘버 + " + member_number);
  			  
  		      MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
  		      ArrayList<FollowVO> followingvo = followservice.following(member_number);
  			  log.info("이거되니?`"+followingvo);
  			  ArrayList<FollowVO> followervo = followservice.follower(target_member_number);
  			  log.info("이거되니?`"+followervo);
  			    
  		   	  mav.addObject("followingvo", followingvo);
  		   	  session.setAttribute("followingvo", followingvo);
  		      log.info("### followingvo + " + followingvo);
  			    
  		   	  mav.addObject("followervo", followervo);
  		   	  session.setAttribute("followervo", followervo);
  		      log.info("### followervo + " + followervo);
  		     
  		      //받아온 target_member_number로 member_number 검색하여 정보들 뽑아오기
  		      ArrayList<FollowVO> followvo1 = (ArrayList<FollowVO>) session.getAttribute("followervo");
  		      ArrayList<FollowVO> followvo2 = (ArrayList<FollowVO>) session.getAttribute("followingvo");
  		     
  		      ArrayList<MemberVO> followingMembervo1 = new ArrayList<MemberVO>();
  		      ArrayList<MypagePetVO> followingMembervo2 = new ArrayList<MypagePetVO>();
  		     
  		      ArrayList<MemberVO> followerMembervo1 = new ArrayList<MemberVO>();
  		      ArrayList<MypagePetVO> followerMembervo2 = new ArrayList<MypagePetVO>();
  		     
  		     
  		    
  		      for(FollowVO fvolist : followvo1) {
  		    	  fvolist.getMember_number();
  		    	  log.info("############################~~~" + fvolist.getMember_number());
  		    	 
  		    	  // target의 내정보 불러오기
  		    	  MemberVO fffmmm = service.followmypage(fvolist.getMember_number());
  		    	  followerMembervo1.add(fffmmm);
  		    	  //log.info(">>>>>>>... 최종 ...>>>>>>>> + " + followingMembervo);
  		    	 
  		    	  // target의 강아지 정보 불러오기
  		    	  MypagePetVO fpm = petservice.petMypage(fvolist.getMember_number());
  		    	  followerMembervo2.add(fpm);
  		    	  //log.info("*****pet정보임 ***** >>>>>" + followingPetMembervo);
  		      }
  		    
  		      for(FollowVO fvolist : followvo2) {
  		    	  fvolist.getTarget_member_number();
  		    	  log.info("############################~~~" + fvolist.getTarget_member_number());
  		    	 
  		    	  // target의 내정보 불러오기
  		    	  MemberVO fffmmm = service.followmypage(fvolist.getTarget_member_number());
  		    	  followingMembervo1.add(fffmmm);
  		    	  //log.info(">>>>>>>... 최종 ...>>>>>>>> + " + followingMembervo);
  		    	 
  		    	  // target의 강아지 정보 불러오기
  		    	  MypagePetVO fpm = petservice.petMypage(fvolist.getTarget_member_number());
  		    	  followingMembervo2.add(fpm);
  		    	  //log.info("*****pet정보임 ***** >>>>>" + followingPetMembervo);
  		      }
  		      mav.addObject("followingMembervo1", followingMembervo1);
  		      mav.addObject("followingMembervo2", followingMembervo2);
  		      log.info(followingMembervo1);
  		     
  		      mav.addObject("followerMembervo1", followerMembervo1);
  		      mav.addObject("followerMembervo2", followerMembervo2);
  		      log.info(followerMembervo1);
  	   session.setAttribute("petMypage", mpvo);
  	   mav.addObject("mpvo", mpvo);
  	  
  	   return mav;
  	}
   */
   //마이페이지 정보수정 로직
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