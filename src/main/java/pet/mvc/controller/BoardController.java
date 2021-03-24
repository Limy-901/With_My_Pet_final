package pet.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Service;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.mvc.board.Board;
import pet.mvc.board.BoardCmt;
import pet.mvc.board.BoardLike;
import pet.mvc.board.BoardListResult;
import pet.mvc.board.BoardTag;
import pet.mvc.service.BoardService;
import sun.print.resources.serviceui;
import pet.member.vo.MemberVO;



@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService service;

	
	@RequestMapping("list.do")
	public ModelAndView search(HttpServletRequest request, HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		String countPageStr = request.getParameter("countPage");
		String startPageStr = request.getParameter("startPage");
		String endPageStr = request.getParameter("endPage");
		String catgo = request.getParameter("catgo");
		String keyword = request.getParameter("keyword");
		String rnum = request.getParameter("rnum");
		String boardIdxStr = request.getParameter("board_idx");
		String memberNumberStr = request.getParameter("member_number");
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
		int countPage = 10;//1로 초기화하면 arithmetic exception
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
		int startPage = ((cp-1) / countPage) * countPage + 1;;
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
		
		


		int member_number=0;
		BoardListResult listResult = null;
		ModelAndView mv = null;
	
		
		if(catgo!=null && keyword !=null) {
			listResult = service.getBoardListResult(catgo, keyword, cp, ps, board_idx, countPage, startPage, endPage);		
			mv = new ModelAndView("board/list", "listResult", listResult);
			if(listResult.getList().size()==0) {
				if(cp>1)
					return new ModelAndView("redirect:list.do?&board_idx="+board_idx);
				
				else
					return new ModelAndView("board/list", "listResult", null);
			}
			return mv;
		
			
		}else if(member_number!= 0) {	
			String post_idxStr = request.getParameter("post_idx");
			int post_idx = 1;
			Object post_idxObj = session.getAttribute("post_idxStr");
			post_idx = (Integer)post_idxObj;
			
			Board b = service.getBoard(post_idx);
			int mnum = (int) b.getMember_number();
			
			
			listResult = service.getBoardListResultPerMember(cp, ps, board_idx, countPage, startPage, endPage, mnum);
			mv = new ModelAndView("board/list", "listResult", listResult);
			if(listResult.getList().size()==0) {
				if(cp>1)
					return new ModelAndView("redirect:list.do?&member_number="+mnum);
				
				else
					return new ModelAndView("board/list", "listResult", null);
			}
			return mv;
		}else {
			listResult = service.getBoardListResult(cp, ps, board_idx, countPage, startPage, endPage);	
			listResult.setTotalCount(100);
			mv = new ModelAndView("board/list", "listResult", listResult);
			if(listResult.getList().size() == 0) {
				if(cp>1)
					return new ModelAndView("redirect:list.do?&board_idx="+board_idx);
				
				else
					return new ModelAndView("board/list", "listResult", null);
			}else {
				return mv;
			
			
			
			}
		}
		
	}
	
	
	@GetMapping("write.do")//string으로 리턴할때 신뢰할수없는 라우팅이라고 함
	public ModelAndView write() {
		Board board = new Board();

		ModelAndView mv = new ModelAndView("board/write", "board", board);		
		return mv;
	}
	
	@PostMapping("write.do")
	public String upload(Board board) {
		service.write(board);
		
		return "redirect:list.do";
	}



	
	

	
	@GetMapping("content.do")
	public ModelAndView content(HttpSession session, HttpServletRequest request, HttpServletResponse response, long post_idx) {
		
		Board board = service.getBoard(post_idx);		
		int like = service.getLikeCount(post_idx);
		ArrayList<BoardCmt> comment = service.selectCmtBySeq(post_idx);
		board.setComment(comment);	
		board.setLike(like);
		ModelAndView mv = new ModelAndView();
		
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		if (cookies != null && cookies.length>0)
		{
			for(int i = 0; i < cookies.length; i++)
			{	log.info("cookies[i]1:"+cookies[i]);
				if(cookies[i].getName().equals("cookie"+post_idx))
				{
					System.out.println("처음 쿠키 생성후 들어옴");
					viewCookie = cookies[i];
				}
			}
		}
		if(board != null) {
			System.out.println("System-해당 상세 리뷰페이지로 넘어감");
			
			mv.addObject("board", board);
			
			if(viewCookie == null) {
				System.out.println("cookie없음");
				
				Cookie newCookie = new Cookie("cookie"+post_idx, "|"+post_idx+"|");
				
				response.addCookie(newCookie);
				int result = service.updateHitCount(post_idx);
				log.info("@@@int result"+ result);//서비스로직에  board호출?
				
				if(result>0) {
					System.out.println("조회수 증가");
				}else{
					System.out.println("조회수증가에러");
				}
			}
			
			else {
				System.out.println("cookie있음");
				
				String value = viewCookie.getValue();
				System.out.println("cookie값:"+value);
			}
			
			mv.setViewName("board/content");
			return mv;
			
		}
		else {
			mv.setViewName("error/reviewError");//에러페이지 만들어줘야함- 시러
			return mv;
		}
	}
	
		
	@GetMapping("delete.do")
	public String delete(long post_idx) {
		service.remove(post_idx);
		return "redirect:list.do";
	}
	
	@ResponseBody
	@GetMapping("deleteCmt.do")
	public String deleteCmt(long comment_idx) {
		service.removeCmt(comment_idx);
	
		return "success";
	}
	


	@PostMapping("replyUpload.do")
	public String uploadReply(BoardCmt boardCmt) {
		service.writeCmt(boardCmt);
		log.info("@boardCmt:"+boardCmt);
		return "redirect:content.do?post_idx="+boardCmt.getPost_idx();
		
	}	
	
	
	 
	
	@ResponseBody
	@PostMapping("updateReply.do")
	public String updateReply(BoardCmt boardCmt, HttpServletResponse response) {
			
			service.updateCmt(boardCmt);

		return "success";
	}
	@GetMapping("modify.do")
	public ModelAndView modify(long post_idx) {
		Board board = service.getBoard(post_idx);	
		ModelAndView mv = new ModelAndView("board/write", "board", board);
		
		return mv;
	}
	
	@PostMapping("modify.do")
	public String edit(Board board) {		
		service.edit(board);
		
		return "redirect:list.do";
	}
	
	



	

	@RequestMapping(value="uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		//String fileRoot = "C:/cha/summernotePics/";
		
		
		 String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		 String fileRoot = contextRoot+"resources/fileupload/";
		 
		log.info("###fileroot"+fileRoot);
		
		String ofname = multipartFile.getOriginalFilename();	
		String extension = ofname.substring(ofname.lastIndexOf("."));	
		String savedFileName = UUID.randomUUID() + extension;	

		
		File targetFile = new File(fileRoot + savedFileName);	
		log.info("####targetfile:"+targetFile);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", fileRoot+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		log.info("@@jsonObject:"+jsonObject);
		String a = jsonObject.toString();
		log.info("%aaaa:"+a);
		return a;
	}
	
	
	
	@GetMapping("rewrite.do")
	public ModelAndView writeReply(long post_idx) {
		Board board = service.getBoard(post_idx);
		ModelAndView mv = new ModelAndView("board/rewrite", "board", board);		
		return mv;
	}
	
	@PostMapping("rewrite.do")
	public String rewrite(Board board) {
		service.rewrite(board);
		
		return "redirect:list.do";
	}
	

	
	@ResponseBody
	@GetMapping("insertLike.do")
	public long insertLike(long post_idx, long member_number, HttpServletResponse response) {
		BoardLike boardLike = new BoardLike(post_idx, member_number);
		
		int likeToggle = service.divideLike(boardLike);
		if(likeToggle==0) {
			log.info("##0or1##"+likeToggle);
			service.insertLike(boardLike);
			long like = service.getLikeCount(post_idx);
			
			return like;
		}else {
			service.deleteLike(boardLike);
			long like = service.getLikeCount(post_idx);
			
			return like;
		}
	}
	@PostMapping("rewriteCmt.do")
	public String rewriteCmt(BoardCmt boardCmt) {
		service.rewirteCmt(boardCmt);
		
		return "redirect:content.do?post_idx="+boardCmt.getPost_idx();
	}
	
	@ResponseBody
	@GetMapping("enterTag.do")
	public List<BoardTag> enterTag(BoardTag boardTag) {
		BoardTag tag = service.enterTag(boardTag);
		long post_idx= tag.getPost_idx();
		List<BoardTag> tagResult= service.getTag(post_idx);
		return tagResult;
	}

	
//	@getMapping("viewPost.do")
//	public ModelAndView viewPost(Board board) {
//		service.getBoardListResultPerMember(cp, ps, board_idx, countPage, startPage, endPage, member_number);
//		
//	}

	
}