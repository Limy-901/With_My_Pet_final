package pet.shop.controller;


import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import pet.shop.domain.Cart;
import pet.shop.domain.OrderSu;
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

	
	//����Ʈ �ҷ�����
	@GetMapping("/del")
	public String cart(Cart cart,HttpSession session,int idx) throws Exception {
		log.info("##����"+idx);
		ArrayList<Cart> cartSession = (ArrayList<Cart>)session.getAttribute("cartLists");
		cartSession.remove(idx);
		session.setAttribute("cartLists", cartSession);
		//service.deleteCartS(product_code);
		return "/shop/cart";
	}
	
	@GetMapping("/cart")
	public String cart() {
		return "/shop/cart";
	}
	
	@PostMapping("/cart")
	public ModelAndView addProductsInCart(HttpServletRequest request, 
			String login,String product_name2,long product_code2,String product_price2,
			String product_content2,String product_image2, long product_amount2, 
			String product_size2,HttpServletResponse response) throws Exception{
			HttpSession session =request.getSession();
			Cart cart = new Cart();
			cart.setProduct_name(product_name2);
			cart.setProduct_code(product_code2);
			cart.setProduct_price(product_price2);
			cart.setProduct_content(product_content2);
			cart.setProduct_image(product_image2);
			cart.setProduct_amount(product_amount2);
			cart.setProduct_size(product_size2);
			log.info("cart: "+cart);
			ArrayList<Cart> cartLists = new ArrayList<Cart>();
			if(cart == null) return new ModelAndView("../","viewlists",null);
			else {
				ArrayList<Cart> cartSession = (ArrayList)session.getAttribute("cartLists");
				if(cartSession != null) {
					cartSession.add(cart);
					session.setAttribute("cartLists", cartSession);
				}else {
					cartLists.add(cart);
					session.setAttribute("cartLists", cartLists);
				}
				ArrayList<Product> viewlists = new ArrayList<Product>();
				for(Cart list : cartLists) {
					long cart_product_code = list.getProduct_code();
					Product product = service2.listS(cart_product_code);
					viewlists.add(product);
				}
				session.setAttribute("viewlists", viewlists);
				log.info("$$viewlists:"+viewlists);
				ModelAndView mvvv = new ModelAndView("/shop/cart","viewlists",viewlists);
				return mvvv;
			}
		}
	
	
	@GetMapping("/order")
	public String order(@RequestParam int member_number) throws Exception {
		log.info("##���� get()���� ȣ��");
		ArrayList<Pay> pay = service.selectPay(member_number);
		return "/shop/order";
	}
	
	@ResponseBody
	@PostMapping("/order")
	public ModelAndView order(HttpSession session, String buyer_name, long buyer_code, String name, 
			String buyer_addr, String buyer_email, long amout
			) throws Exception{
			log.info("buyer_name: "+buyer_name+"name: "+name);
			OrderSu ordersu = new OrderSu();
			ordersu.setProduct_code(buyer_code);
			ordersu.setOrdersu_name(buyer_name);
			ordersu.setOrdersu_addr(buyer_addr);
			ordersu.setOrdersu_email(buyer_email);
			ordersu.setProduct_price(amout);
			ordersu.setOrder_code(buyer_code);
			service.insertOrderSu(ordersu);
			session.setAttribute("ordersu", ordersu);
			log.info("cartController ordersu:"+ordersu);
			ModelAndView mv = new ModelAndView("/shop/order","ordersu",ordersu);
			return mv;
			}
	
	@GetMapping("/orderSu")
	public ModelAndView orderSu(HttpSession session, int member_number) throws Exception{
		ArrayList<Pay> payUpdate = service.selectPay(member_number);
		session.setAttribute("pay", payUpdate);
		log.info("post() pay: "+payUpdate);
		ModelAndView mv = new ModelAndView("/shop/orderSu","pay",payUpdate);
		return mv;		
		}
	}
