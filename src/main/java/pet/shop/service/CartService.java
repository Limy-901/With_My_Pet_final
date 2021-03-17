package pet.shop.service;

import java.util.ArrayList;
import java.util.List;

import pet.shop.domain.Cart;
import pet.shop.domain.OrderSu;
import pet.shop.domain.Pay;


public interface CartService {
	
	public void addProductsInCart(Cart cart) throws Exception;
	public List<Cart> findCartProducts(long product_code) throws Exception;
	public ArrayList<Pay> selectPay(int member_number) throws Exception;
	public void updatePayS(Pay pay) throws Exception;
	public Pay selectPayOne(int member_number) throws Exception;
	public void insertOrderSu(OrderSu ordersu) throws Exception;
}
