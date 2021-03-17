package pet.shop.service;


import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.shop.mapper.CartMapper;
import pet.shop.mapper.ProductMapper;
import pet.shop.domain.Cart;
import pet.shop.domain.OrderSu;
import pet.shop.domain.Pay;


@Log4j
@Service("CartServiceImpl")
public class CartServiceImpl implements CartService {

	
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private Cart cart;
	@Override
	public List<Cart> findCartProducts(long product_code) throws Exception {
		//테이블에 추가하기 전에 동일한 상품 번호의 개수를 조회
		log.info("listCart 잘나옴: "+product_code);
		List<Cart> c = cartMapper.selectCountInCart(product_code);
		if(c !=null) log.info("cart 널아님:" +c);
		return cartMapper.selectCountInCart(product_code);
	}
	@Override
	public void addProductsInCart(Cart cart) throws Exception {//장바구니에 추가한다.
		cartMapper.insertProductsInCart(cart);
	}
	@Override
	public ArrayList<Pay> selectPay(int member_number) throws Exception {
		log.info("pay 잘나옴:" +member_number);
		ArrayList<Pay> pay = cartMapper.selectPay(member_number);
		log.info("pay값: "+pay);
		return cartMapper.selectPay(member_number);
	}
	@Override
	public void updatePayS(Pay pay) throws Exception {
		log.info("pay 잘나옴:" +pay);
		cartMapper.updateOrder(pay);
	}
	@Override
	public Pay selectPayOne(int member_number) throws Exception {
		Pay pay = cartMapper.selectPayOne(member_number);
		System.out.println("##"+pay);
		return pay;
	}
	@Override
	public void insertOrderSu(OrderSu ordersu) throws Exception {
		log.info("@@service ordersu값: "+ordersu);
		cartMapper.insertOrderSu(ordersu);
		
	}
	
}
