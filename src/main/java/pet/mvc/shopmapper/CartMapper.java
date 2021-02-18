package pet.mvc.shopmapper;



import pet.mvc.shopdomain.Cart;


public interface CartMapper {
	String selectCountInCart(Cart cart);
	void insertProductsInCart(Cart cart);
}
