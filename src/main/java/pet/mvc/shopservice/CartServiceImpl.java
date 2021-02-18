package pet.mvc.shopservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.mvc.shopdomain.Cart;
import pet.mvc.shopdomain.Product;
import pet.mvc.shopmapper.CartMapper;
import pet.mvc.shopmapper.ProductMapper;


@Log4j
@Service("CartServiceImpl")
public class CartServiceImpl implements CartService {

	
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private ProductMapper productMapper;
	@Override
	public String findCartProducts(Cart cart) throws Exception {
		//테이블에 추가하기 전에 동일한 상품 번호의 개수를 조회
		return cartMapper.selectCountInCart(cart);
	}
	@Override
	public void addProductsInCart(Cart cart) throws Exception {//장바구니에 추가한다.
		cart.setCart_code(1L);
		cart.setMember_number(3);
		cart.setProduct_code(3);
		cartMapper.insertProductsInCart(cart);
	}
}
