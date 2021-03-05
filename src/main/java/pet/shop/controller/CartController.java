package pet.shop.controller;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.log4j.Log4j;
import pet.shop.domain.Cart;
import pet.shop.domain.Pay;
import pet.shop.domain.Product;
import pet.shop.service.CartService;
import pet.shop.service.ProductService;
@Log4j
@Controller
public class CartController {
	
	
	@Autowired
	private Cart cart;
	@Resource(name="CartServiceImpl")
	private CartService service;
	@Resource(name="ProductServiceImpl")
	private ProductService service2;
	
	
	
	//리스트 불러오기
	@GetMapping("/del")
	public String cart(Cart cart,HttpSession session,int idx) throws Exception {
		log.info("cartController 장바구니");
		log.info("##여기"+idx);
		ArrayList<Cart> cartSession = (ArrayList<Cart>)session.getAttribute("cartLists");
		cartSession.remove(idx);
		session.setAttribute("cartLists", cartSession);
		//service.deleteCartS(product_code);
		return "/shop/cart";
	}
	
	@PostMapping("/cart")//전송된 상품 번호를 받는다.
	public ModelAndView addProductsInCart(HttpServletRequest request, Cart cart,
	HttpServletResponse response) throws Exception{
		log.info("cartController 장바구니 갖고왔다");
		log.info("##가져온 카트값"+cart);
		HttpSession session =request.getSession();
		ArrayList<Cart> cartLists = new ArrayList<Cart>();
		//리스트 선언
		if(cart == null) return new ModelAndView("../","viewlists",null);
		//만약에 cart에 값이 널이면 그냥 인덱스로 돌아가라!
		else {
			ArrayList<Cart> cartSession = (ArrayList)session.getAttribute("cartLists");
			//ArrayList타입의 cartSession에 cartLists를 불러오기.
			if(cartSession != null) {
				//만약 cartSession에 값이 있으면
				cartSession.add(cart);
				//세션에 cart라는 ArrayList<Cart>형태의 내용값을 add해줘라.
				log.info("세션카트안에있음"+cartSession);
				session.setAttribute("cartLists", cartSession);
				//그리고 세션에 저장될 수 있도록 cartSession을 setAttribute해줘라.
			}else {
				cartLists.add(cart);
				log.info("세션 새로 만듦"+cartSession);
				session.setAttribute("cartLists", cartLists);
			}
			//list에  product내용을 담아내는 곳
			ArrayList<Product> viewlists = new ArrayList<Product>();
			//그후에 product타입의 Arraylist를 선언해준다음
			for(Cart list : cartLists) {
				//위에서 만든 cartLists의 내용물이 든  cartLists를 for문에 돌려준다.
				long cart_product_code = list.getProduct_code();
				//그 만든 list에 product_code가 long 타입의 cart_product_code와 같다면
				Product product = service2.listS(cart_product_code);
				//위에서 선언한 service2의 listS메소드에 product_code를 넣어 product의 전체 내용물을 불러올 수 있도록 한다.
				viewlists.add(product);
				//그후에 그 내용이 있는 product를 viewlists에 추가해준다.(넣어준다)
			}
			session.setAttribute("viewlists", viewlists);
			//추가된 viewlists를 이제 session에 넣어준다.
			log.info("$$$$viewlists:"+viewlists);
			ModelAndView mvvv = new ModelAndView("/shop/cart","viewlists",viewlists);
			return mvvv;
		}
	}
	
	@GetMapping("/order")
	public String order(@RequestParam int member_number) throws Exception {
		log.info("##오더 get()으로 호출");
		ArrayList<Pay> pay = service.selectPay(member_number);
		return "/shop/order";
	}
	@PostMapping("/order")
	public ModelAndView order(HttpSession session,int member_number) throws Exception {
		log.info("##오더(결제)post()로 왔다.");
		ArrayList<Pay> payUpdate = service.selectPay(member_number);
		session.setAttribute("pay", payUpdate);
		log.info("오더(결제)post() pay: "+payUpdate);
		ModelAndView mv = new ModelAndView("/shop/order","	",payUpdate);
		return mv;
	}
	
	@RequestMapping("/orderSu")
	public ModelAndView orderSu(HttpSession session,Pay pay, HttpServletRequest request, int member_number) throws Exception {
		log.info("##결제완료 화면으로 옴");
		HttpSession session1 =request.getSession();
		ArrayList<Pay> payUpdate = new ArrayList<Pay>();
		ArrayList<Pay> paySession = (ArrayList<Pay>) session1.getAttribute("payUpdate"); 
		payUpdate.add(pay);
		Pay payOne = service.selectPayOne(member_number);
		//service.updatePayS(pay);
		//session.setAttribute("pay",payUpdate);
		log.info("payUpdate:"+paySession);
		ModelAndView mv = new ModelAndView("/shop/orderSu","payOne",payOne);
		return mv;
	}
}