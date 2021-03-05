package pet.shop.service;


import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.shop.mapper.CartMapper;
import pet.shop.mapper.ProductMapper;
import pet.shop.domain.Cart;
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
		//
		log.info("listCart 값: "+product_code);
		List<Cart> c = cartMapper.selectCountInCart(product_code);
		if(c !=null) log.info("cart �꼸�븘�떂:" +c);
		return cartMapper.selectCountInCart(product_code);
	}
	@Override
	public void addProductsInCart(Cart cart) throws Exception {//
		cartMapper.insertProductsInCart(cart);
	}
	@Override
	public ArrayList<Pay> selectPay(int member_number) throws Exception {
		log.info("pay 값 들어옴:" +member_number);
		ArrayList<Pay> pay = cartMapper.selectPay(member_number);
		log.info("pay: "+pay);
		return cartMapper.selectPay(member_number);
	}
	@Override
	public void updatePayS(Pay pay) throws Exception {
		log.info("pay 값:" +pay);
		cartMapper.updateOrder(pay);
	}
	@Override
	public Pay selectPayOne(int member_number) throws Exception {
		Pay pay = cartMapper.selectPayOne(member_number);
		System.out.println("#####"+pay);
		return pay;
	}
	
}
