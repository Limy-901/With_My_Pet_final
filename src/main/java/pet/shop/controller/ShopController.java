package pet.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.ModelAndView;
import lombok.extern.log4j.Log4j;
import pet.shop.fileSetting.path;
import pet.member.vo.MemberVO;
import pet.member.vo.MypagePetVO;
import pet.shop.domain.Category;
import pet.shop.domain.Option;
import pet.shop.domain.Product;
import pet.shop.domain.ProductListResult;
import pet.shop.domain.Review;
import pet.shop.service.FileUploadService;
import pet.shop.service.LikeListService;
import pet.shop.service.ProductService;

@Log4j
@Controller
public class ShopController {
	
	@Resource(name="ProductServiceImpl")
	private ProductService service;
	@Resource(name="FileUploadServiceImpl")
	private FileUploadService fileService;
	
	@Autowired
	private LikeListService likeListService;
	
	//상품 소분류 카테고리
	@GetMapping("/category")
	public ModelAndView category(HttpServletRequest request, HttpSession session,@RequestParam long catgo_code) {
		String catgo = request.getParameter("catgo");
		String keyword = request.getParameter("keyword");
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		//(1) cp
		int cp =1;
		if( cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpStr !=null) {
				cp = (Integer) cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps
		int ps =3;
		if( psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj !=null) {
				ps = (Integer) psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj !=null) {
				int psSession = (Integer) psObj;
				if(psSession !=psParam) {
					cp =1;
					session.setAttribute("ps", ps);
				}
			}
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		ProductListResult listResult = null;
		ModelAndView mv = null;
		
		//(3) ModelAndView
		if(catgo !=null && keyword !=null) {
			listResult = service.getProductListResult(catgo, keyword, cp, ps);
			mv = new ModelAndView("shop/category","listResult",listResult);
			List<Product> li = listResult.getList();
			log.info("list size: "+li.size());
			
			if(listResult.getList().size() ==0) {
				log.info("(#3) listResult 실패");
				if(cp >1) return new ModelAndView("redirect:category?cp="+(cp-1));
				else return new ModelAndView("shop/category","listResult", null);
			}else {
				log.info("성공1");
				return mv;
			}
		}else {
			listResult = service.getProductListResult(cp, ps);
			mv = new ModelAndView("shop/category","listResult",listResult);
			List<Product> li = listResult.getList();
			log.info("list size: "+li.size());
			
			if(listResult.getList().size() ==0) {
				log.info("?");
				if(cp>1) return new ModelAndView("redirect:category?cp="+(cp-1));
				else return new ModelAndView("shop/category","listResult", null);
			}else {
				ArrayList<Product> list = service.listProduct2(catgo_code);
				log.info(" category catgo_code받아짐:"+catgo_code+list);
				ModelAndView mv1 = new ModelAndView("shop/category","category",list);
				log.info("성공2");
				return mv1;
			}
		}
		/*return "/shop/category";*/
	}
	
	//상품 소분류 카테고리
	@RequestMapping("/category2")
	public String category2() {
		log.info("category2로 왔다");
		return "/shop/category2";
	}
	
	//상품 대분류 카테고리
	@GetMapping("/product")
	public ModelAndView product(@RequestParam long catgo_code) {
		List<Category> list = service.listCatgoS(catgo_code);
		ModelAndView mv = new ModelAndView("/shop/product","product",list);
		return mv;
	}
 	
	//상품 상세페이지1
 	@GetMapping("/productDes")
	public ModelAndView productDes(HttpSession session, @RequestParam long catgo_code,
			@RequestParam long review_number, Option option, long product_code, Product product) {
		log.info("##"+review_number+catgo_code+product_code);
		Product list = service.listS(product);
		MypagePetVO mpvo = (MypagePetVO) session.getAttribute("petMypage");
		log.info("mpvo 들어옴: "+mpvo);
		ArrayList<Review> reviewCon = service.listReviewS(review_number);
		ArrayList<Option> optionlist= service.listOption(product_code);
		session.setAttribute("reviewCon", reviewCon);
		session.setAttribute("list", list);
		session.setAttribute("optionlist", optionlist);
		session.setAttribute("mpvo", mpvo);
		log.info("###productDes"+optionlist+reviewCon+list+mpvo);
		session.setAttribute("productDes", list);
		ModelAndView mvv = new ModelAndView("/shop/productDes","productDes", list);
		return mvv;
	}
 	
 	//상품 상세페이지1
 	@PostMapping("/productDes")
 	public String productDes(Review review) {
 		log.info("#왔니? review: "+ review);
 		service.insertReview(review);
 		log.info("###productDes"+review);
		return "redirect:productDes?catgo_code=9&review_number=1&product_code=9";
 	}
 	
 	//상품 상세페이지2
	@RequestMapping("/productDes21")
	public ModelAndView productDes21(HttpSession session, Product product, @RequestParam long catgo_code,@RequestParam long review_number
			, Option option, long product_code) {
		log.info("@@"+review_number+catgo_code+product_code);
		Product list = service.listS(product);
		List<Review> reviewCon = service.listReviewS(review_number);
		ArrayList<Option> optionlist= service.listOption(product_code);
		session.setAttribute("list", list);
		session.setAttribute("reviewCon", reviewCon);
		session.setAttribute("optionlist", optionlist);
		log.info("@@@"+reviewCon+list+optionlist);
		ModelAndView mvvv = new ModelAndView("/shop/productDes21","productDes21",list);
		return mvvv;
	}
	
	//상품등록페이지
	@GetMapping("/register")
	public String register() {
		return "/shop/register";
	}
	
	//상품등록페이지 수정1
	@PostMapping("/category")
	public String upload(MultipartFile uploadfile,Product product,long catgo_code) throws Exception {
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
	        return "shop/category";
	    }
	    if(saveFile.length() !=0) {
	    	String url = fileService.saveStore(file, product);//service로 이동..파일 저장함
	    }
	    return "redirect:category?catgo_code=8";
		}

	@ResponseBody
	@RequestMapping(value="/insertLikeList.do")
	public Long insertLikeList(HttpSession session, long product_code){
		MemberVO vo = (MemberVO) session.getAttribute("login");
		likeListService.insertLikeList(vo.getMember_number(), product_code);
		return product_code;
	}
	
	//찜한 목록 리스트
	@RequestMapping(value="/likeList.do")
	public ModelAndView likeList(HttpSession session){
		Hashtable<String, Object> map = new Hashtable<String, Object>();
		MemberVO vo = (MemberVO) session.getAttribute("login");
		ArrayList<Product> LikeList = likeListService.getLikeList(vo.getMember_number());
		ArrayList<Product> CommendList = likeListService.getCommendList();
		map.put("LikeList",LikeList);
		map.put("CommendList",CommendList);
		ModelAndView mv = new ModelAndView("shop/likelist","map",map);
		return mv;
	}
}
