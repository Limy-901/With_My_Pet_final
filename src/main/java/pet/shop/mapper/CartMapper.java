package pet.shop.mapper;



import java.util.ArrayList;
import java.util.List;

import pet.shop.domain.Cart;
import pet.shop.domain.Pay;
import pet.shop.domain.Product_pic;


public interface CartMapper {
	List<Cart> selectCountInCart(long product_code);
	void insertProductsInCart(Cart cart);
	ArrayList<Pay> selectPay(int member_number);
	Pay selectPayOne(int member_number);
	void insertFile(Product_pic product_pic);
	void updateOrder(Pay pay);
}
