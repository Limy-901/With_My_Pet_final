package pet.member.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.inject.Inject;
import javax.servlet.ServletRequest;
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
import pet.mvc.board.BoardListResult;
import pet.mvc.service.BoardService;
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
   @Inject
   private BoardService boardService;
   //내가쓴글
   @RequestMapping(value = "/mypost.do", method = RequestMethod.GET)
   public ModelAndView mypost(HttpServletRequest request, HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("login");
		int member_number = vo.getMember_number();
		
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		String countPageStr = request.getParameter("countPage");
		String startPageStr = request.getParameter("startPage");
		String endPageStr = request.getParameter("endPage");
		String catgo = request.getParameter("catgo");
		String keyword = request.getParameter("keyword");
		String rnum = request.getParameter("rnum");
		String boardIdxStr = request.getParameter("board_idx");

		System.out.println("#"+rnum);

		//(1) cp 
				int cp = 1;
				if(cpStr == null) {
					Object cpObj = session.getAttribute("cp");
					
					if(cpObj != null) {
						cp = (Integer)cpObj;
					}
				}else {
					cpStr = cpStr.trim();
					cp = Integer.parseInt(cpStr);
				}
				//session.setAttribute("cp", cp);
				
				//(2) ps 
				int ps = 20;
				if(psStr == null) {
					Object psObj = session.getAttribute("ps");
					if(psObj != null) {
						ps = (Integer)psObj;
					}
				}else {
					psStr = psStr.trim();
					int psParam = Integer.parseInt(psStr);
					
					Object psObj = session.getAttribute("ps");
					if(psObj != null) {
						int psSession = (Integer)psObj;
						if(psSession != psParam) {
							cp = 1;
							session.setAttribute("cp", cp);
						}
					}else {
						if(ps != psParam) {
							cp = 1;
							session.setAttribute("cp", cp);
						}
					}
					
					ps = psParam;
				}
				session.setAttribute("ps", ps);
				
		//countPage
		int countPage = 10;
		if(countPageStr == null) {
			Object countPageObj = session.getAttribute("countPageStr");
			if(countPageObj != null) {
				countPage = (Integer)countPageObj;
			}
		}else {
			countPageStr = countPageStr.trim();
			countPage = Integer.parseInt(countPageStr);
		}
		session.setAttribute("countPage", countPage);
		
		//startPage
		int startPage = ((cp-1) / countPage) * countPage + 1;	
		if(startPageStr == null) {
			Object startPageObj = session.getAttribute("startPageStr");
			if(startPageObj != null) {
				startPage = (Integer)startPageObj;
			}
		}else {
			startPageStr = startPageStr.trim();
			startPage = Integer.parseInt(startPageStr);
		}
		session.setAttribute("startPage", startPage);
		
		//endPage
		int endPage = startPage + countPage - 1 ;
		if(endPageStr == null) {
			Object endPageObj = session.getAttribute("endPageStr");
			if(endPageObj != null) {
				endPage = (Integer)endPageObj;
			}
		}else {
			endPageStr = endPageStr.trim();
			endPage = Integer.parseInt(endPageStr);
		}
		session.setAttribute("endPage", endPage);
		
	
		
		//board_idx
		int board_idx = 1;
		if(boardIdxStr == null) {
			Object boardIdxObj = session.getAttribute("board_idx");
			if(boardIdxObj != null) {
				board_idx = (Integer)boardIdxObj;
			}
		}else {
			
			boardIdxStr = boardIdxStr.trim();
			board_idx = Integer.parseInt(boardIdxStr);
		}
		session.setAttribute("board_idx", board_idx);
		
		
		//member_number

				if(boardIdxStr == null) {
					Object boardIdxObj = session.getAttribute("board_idx");
					if(boardIdxObj != null) {
						board_idx = (Integer)boardIdxObj;
					}
				}else {
					
					boardIdxStr = boardIdxStr.trim();
					board_idx = Integer.parseInt(boardIdxStr);
				}
				session.setAttribute("board_idx", board_idx);
		
		
		BoardListResult listResult = null;
		ModelAndView mv = null;
	
		
		
		if(catgo!=null && keyword !=null) {
			listResult = boardService.getBoardListResultPerMember(cp, ps, board_idx, countPage, startPage, endPage, member_number);
			mv = new ModelAndView("member/mypost", "listResult", listResult);
			if(listResult.getList().size()==0) {
				if(cp>1)
					return new ModelAndView("redirect:mypost.do");
				
				else
					return new ModelAndView("member/mypost", "listResult", null);
			}
			return mv;
			
		}else {
			listResult = boardService.getBoardListResultPerMember(cp, ps, board_idx, countPage, startPage, endPage, member_number);
			mv = new ModelAndView("member/mypost", "listResult", listResult);
			if(listResult.getList().size() == 0) {
				if(cp>1)
					return new ModelAndView("redirect:mypost.do");
				
				else
					return new ModelAndView("member/mypost", "listResult", null);
			}else {
				return mv;
			
			
			
			}
		}
		
	}
 //=======================마이페이지==============================================
   @RequestMapping(value="/mypage.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
   public ModelAndView mypage(MemberVO vo, MypagePetVO pvo, HttpSession session,  HttpServletRequest request) throws Exception {
	   ModelAndView mav = new ModelAndView();
	   
	      MemberVO mvo = (MemberVO) session.getAttribute("login");
	      log.info("#######mvo + " + mvo);
		  int target_member_number = mvo.getMember_number();
		  log.info("#### 타겟멤버넘버 >>> " + target_member_number);
		  int member_number = mvo.getMember_number();
		  log.info("#### 멤버넘버 >>> " + member_number);
		
	      MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
	
	      ArrayList<FollowVO> followingvo = followservice.following(member_number);
		  ArrayList<FollowVO> followervo = followservice.follower(target_member_number);
		  
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
	  
	      // <--팔로워-->
	      for(FollowVO fvolist : followvo1) {
	    	  fvolist.getMember_number();
	    	  log.info("멤버 넘버 >>>" + fvolist.getMember_number());
	    // target의 내정보 불러오기
	    	  MemberVO tmvo = service.followmypage(fvolist.getMember_number());
	    	  followerMembervo1.add(tmvo);
	    // target의 강아지 정보 불러오기
	    	  MypagePetVO tpvo = petservice.petMypage(fvolist.getMember_number());
	    	  followerMembervo2.add(tpvo);
	      }
	     
	      mav.addObject("followerMembervo1", followerMembervo1);
	      mav.addObject("followerMembervo2", followerMembervo2);
	     
	      // <--팔로잉-->
	      for(FollowVO fvolist : followvo2) {
	    	  fvolist.getTarget_member_number();
	    	  log.info("타겟 멤버 넘버 >>>" + fvolist.getTarget_member_number());
	    // target의 내정보 불러오기
	    	  MemberVO tmvo = service.followmypage(fvolist.getTarget_member_number());
	    	  followingMembervo1.add(tmvo);
	    // target의 강아지 정보 불러오기
	    	  MypagePetVO tpvo = petservice.petMypage(fvolist.getTarget_member_number());
	    	  followingMembervo2.add(tpvo);
	      }
	      mav.addObject("followingMembervo1", followingMembervo1);
	      mav.addObject("followingMembervo2", followingMembervo2);
	   
	     
	
	      session.setAttribute("petMypage", mpvo);
		  mav.addObject("mpvo", mpvo);
		
		  return mav;
	   }
 //=======================팔로워 페이지==============================================
   @RequestMapping(value = "/follower.do", method = RequestMethod.GET)
   public ModelAndView follower(MemberVO vo, MypagePetVO pvo, FollowVO fvo, HttpSession session,  HttpServletRequest request) throws Exception {
	   logger.info("follower.do 호출 성공");
	   ModelAndView mav = new ModelAndView();
	    
	   MemberVO mvo = (MemberVO) session.getAttribute("login");
	      log.info("#######mvo + " + mvo);
		  int target_member_number = mvo.getMember_number();
		  log.info("#### 타겟멤버넘버 >>> " + target_member_number);
		  int member_number = mvo.getMember_number();
		  log.info("#### 멤버넘버 >>> " + member_number);
		
	      MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
	
	      ArrayList<FollowVO> followingvo = followservice.following(member_number);
		  ArrayList<FollowVO> followervo = followservice.follower(target_member_number);
		  
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
	    
	    
	      // <--팔로워-->
	      for(FollowVO fvolist : followvo1) {
	    	  fvolist.getMember_number();
	    	  log.info("멤버 넘버 >>>" + fvolist.getMember_number());
	    // target의 내정보 불러오기
	    	  MemberVO tmvo = service.followmypage(fvolist.getMember_number());
	    	  followerMembervo1.add(tmvo);
	    // target의 강아지 정보 불러오기
	    	  MypagePetVO tpvo = petservice.petMypage(fvolist.getMember_number());
	    	  followerMembervo2.add(tpvo);
	      }
	     
	      mav.addObject("followerMembervo1", followerMembervo1);
	      mav.addObject("followerMembervo2", followerMembervo2);
	     
	      // <--팔로잉-->
	      for(FollowVO fvolist : followvo2) {
	    	  fvolist.getTarget_member_number();
	    	  log.info("타겟 멤버 넘버 >>>" + fvolist.getTarget_member_number());
	    // target의 내정보 불러오기
	    	  MemberVO tmvo = service.followmypage(fvolist.getTarget_member_number());
	    	  followingMembervo1.add(tmvo);
	    // target의 강아지 정보 불러오기
	    	  MypagePetVO tpvo = petservice.petMypage(fvolist.getTarget_member_number());
	    	  followingMembervo2.add(tpvo);
	      }
	      mav.addObject("followingMembervo1", followingMembervo1);
	      mav.addObject("followingMembervo2", followingMembervo2);
	    
	      mav.setViewName("/member/follower");
	      return mav;
	   }
 //=======================팔로잉 페이지==============================================
   @RequestMapping(value = "/following.do", method = RequestMethod.GET)
   public ModelAndView following(MemberVO vo, MypagePetVO pvo, FollowVO fvo, HttpSession session,  HttpServletRequest request) throws Exception {
	   logger.info("following.do 호출 성공");
	   ModelAndView mav = new ModelAndView();
	  
	   MemberVO mvo = (MemberVO) session.getAttribute("login");
	      log.info("#######mvo + " + mvo);
		  int target_member_number = mvo.getMember_number();
		  log.info("#### 타겟멤버넘버 >>> " + target_member_number);
		  int member_number = mvo.getMember_number();
		  log.info("#### 멤버넘버 >>> " + member_number);
		
	      MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
	
	      ArrayList<FollowVO> followingvo = followservice.following(member_number);
		  ArrayList<FollowVO> followervo = followservice.follower(target_member_number);
		  
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
	    
	    
	      // <--팔로워-->
	      for(FollowVO fvolist : followvo1) {
	    	  fvolist.getMember_number();
	    	  log.info("멤버 넘버 >>>" + fvolist.getMember_number());
	    // target의 내정보 불러오기
	    	  MemberVO tmvo = service.followmypage(fvolist.getMember_number());
	    	  followerMembervo1.add(tmvo);
	    // target의 강아지 정보 불러오기
	    	  MypagePetVO tpvo = petservice.petMypage(fvolist.getMember_number());
	    	  followerMembervo2.add(tpvo);
	      }
	     
	      mav.addObject("followerMembervo1", followerMembervo1);
	      mav.addObject("followerMembervo2", followerMembervo2);
	     
	      // <--팔로잉-->
	      for(FollowVO fvolist : followvo2) {
	    	  fvolist.getTarget_member_number();
	    	  log.info("타겟 멤버 넘버 >>>" + fvolist.getTarget_member_number());
	    // target의 내정보 불러오기
	    	  MemberVO tmvo = service.followmypage(fvolist.getTarget_member_number());
	    	  followingMembervo1.add(tmvo);
	    // target의 강아지 정보 불러오기
	    	  MypagePetVO tpvo = petservice.petMypage(fvolist.getTarget_member_number());
	    	  followingMembervo2.add(tpvo);
	      }
	      mav.addObject("followingMembervo1", followingMembervo1);
	      mav.addObject("followingMembervo2", followingMembervo2);
	     
	      mav.setViewName("/member/following");
	      return mav;
	   }
   
 //=======================팔로잉 하기==============================================
   @ResponseBody
   @RequestMapping(value = "addfollow.do", method = RequestMethod.POST)
   public String addfollow(@ModelAttribute FollowVO vo, HttpServletRequest request) throws Exception {
      logger.info("Following");
      String member_number = request.getParameter("member_number");
      String target_member_number = request.getParameter("target_member_number");
      logger.info("Following >>>>>>>" + member_number + target_member_number);
      followservice.addfollow(vo);
      return null;
   }
   //=======================팔로잉 끊기==============================================
   @ResponseBody
   @RequestMapping(value = "deleteFollowing.do", method = RequestMethod.POST)
   public ArrayList<FollowVO> deleteFollowing(HttpSession session, HttpServletRequest request) throws Exception {
      logger.info("deleteFollowing");
      String following_delete = request.getParameter("member_number");
      logger.info("following_delete >>>>>>>"+following_delete);
      ArrayList<FollowVO> fvo = followservice.deleteFollowing(following_delete);
      return fvo;
   }
   //=======================팔로워 끊기==============================================
   @ResponseBody
   @RequestMapping(value = "deleteFollower.do", method = RequestMethod.POST)
   public ArrayList<FollowVO> deleteFollower(HttpSession session, HttpServletRequest request) throws Exception {
      logger.info("deleteFollowing");
      String follower_delete = request.getParameter("member_number");
      logger.info("following_delete >>>>>>>"+follower_delete);
      ArrayList<FollowVO> fvo = followservice.deleteFollower(follower_delete);
      return fvo;
   }
	
   //=======================마이페이지정보수정창  view==============================================
     @RequestMapping(value = "/mypageupdate.do", method = RequestMethod.GET)
     public ModelAndView getmypageupdate(HttpSession session) throws Exception {    	
  	   MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
  	   session.setAttribute("petMypage", mpvo);
  	   ModelAndView mv = new ModelAndView("/member/mypageupdate","mpvo",mpvo);
   	 
       return mv;
     }
   //=======================마이페이지 강아지 정보수정창==============================================
     @RequestMapping(value = "/mypagepetupdate.do", method = RequestMethod.GET)
     public ModelAndView getmypagepetupdate(HttpSession session) throws Exception {
        MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
   	    session.setAttribute("petMypage", mpvo);
   	    ModelAndView mv = new ModelAndView("/member/mypagepetupdate","mpvo",mpvo);
   	   
        return mv;
     }
   //=======================마이페이지 정보수정 로직==============================================
 	@RequestMapping(value = "/mypageupdate.do", method = RequestMethod.POST)
 		public String postmemberModify(@ModelAttribute MemberVO vo ,MultipartFile uploadfile, HttpSession session,  HttpServletRequest request) throws Exception {
 		   MemberVO vo2 = (MemberVO) session.getAttribute("login");			
 		
 	      logger.info("mypage 정보수정 호출 성공"+vo2.getMember_number());
 	    
 	      vo.setMember_number(vo2.getMember_number());	
            //  브라우저에서 입력한 패스워드를 암호화한다.
            String secPwd = pwencoder.encode(vo.getMember_password());
            logger.info("정보수정 : " +vo.getMember_number()+","+ vo.getMember_password() + ", "+vo.getMember_name() + ", " + vo.getMember_address());
            //  암호화된 비밀번호를 VO에 SET한다.
            vo.setMember_password(secPwd);
            //  DB에 회원정보 수정 처리 성공
            service.memberModify(vo);
            return "member/mypage";
       }
	 
  //=======================강아지 정보 수정 처리==============================================
   @RequestMapping(value = "/mypagepetupdate.do", method = RequestMethod.POST)
   public String postPetupdatedo(@ModelAttribute  MypagePetVO vo, MultipartFile uploadfile, HttpSession session,  HttpServletRequest request) throws Exception {
	  MemberVO mvo = (MemberVO) session.getAttribute("login");	 
	  int member_number = mvo.getMember_number();
		
	  MypagePetVO mpvo = petservice.petMypage(member_number);
	  session.setAttribute("petMypage", mpvo);
      vo.setMember_number(member_number);
      logger.info("upload() POST 호출");
      logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
      logger.info("파일 크기: {}", uploadfile.getSize());
       String savename = saveFile(uploadfile);
       String pet_ofname = uploadfile.getOriginalFilename();
       vo.setPet_fname(savename);
       vo.setPet_ofname(pet_ofname);
       long pet_fsize = uploadfile.getSize();
       vo.setPet_fsize(pet_fsize);
       logger.info("정보수정 : " +vo.getMember_number()+"#s"+ vo.getPet_name() + ", "+vo.getPet_sex() + ", " + vo.getPet_age()
        			+ ", " + vo.getPet_walkarea() + ", " + vo.getPet_fname() + ", " + vo.getPet_ofname() + ", " + vo.getPet_fsize());
       petservice.petUpdateDo(vo);
       return "member/mypagepetupdate";
   }
//==========================================================================================================================================
   private static final String UPLOAD_PATH =  "C:\\Users\\bit\\Desktop\\WithMyPet_Member_ImgUpload";
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
   }
	  
	  
 //=======================뷰 마이페이지==============================================
   @RequestMapping(value="/viewmypage.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
   public ModelAndView viewmypage(HttpSession session,  HttpServletRequest request, ServletRequest element, int member_number) throws Exception {
	   ModelAndView mav = new ModelAndView();
	      
	   MemberVO mvo = service.mypage(member_number);
	   log.info("member_number: >>>>>> " + member_number);
	   log.info("mvo: >>>>>> " + mvo);
	   	
	   element.setAttribute("viewMypage",mvo);
	   	
	  int target_member_number = mvo.getMember_number();
	  log.info("#### 멤버넘버 + " + target_member_number);
	 
      MypagePetVO mpvo = petservice.petMypage(member_number);
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
      session.setAttribute("viewMypage", mpvo);
	  mav.addObject("mpvo", mpvo);
	  mav.setViewName("/member/viewMypage");
	 
	  return mav;
   }
	 
	 
}