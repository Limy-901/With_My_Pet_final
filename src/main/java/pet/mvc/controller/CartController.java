package pet.mvc.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pet.mvc.shopdomain.Cart;
import pet.mvc.shopdomain.Product;
import pet.mvc.shopservice.CartService;


@Log4j
@Controller
public class CartController {
	
	
	@Autowired
	private Cart cart;
	@Resource(name="CartServiceImpl")
	private CartService service;
	
	
	//리스트 불러오기
	@GetMapping("/cart")
	public String cart(Cart cart) {
		log.info("cartController 장바구니");
		return "/shop/cart";
	}
	
	@PostMapping("/cart")//전송된 상품 번호를 받는다.
	public @ResponseBody ModelAndView addProductsInCart(@RequestParam("product_code") long product_code, 
			HttpServletRequest request, HttpServletResponse response, Cart cart, Product product) throws Exception{
		log.info("cartController 장바구니 갖고왔다");
		HttpSession session =request.getSession();
		String isAlreadyExisted= service.findCartProducts(cart);//상품 번호가 장바구니 테이블에 있는지 조회한다.
		Product list = (Product) session.getAttribute("productDes");
		session.setAttribute("cart", cart);
		log.info("@@@"+product+cart+list);
		ModelAndView mvvv = new ModelAndView("/shop/cart","productDes",product);
		return mvvv;
		}
	}
