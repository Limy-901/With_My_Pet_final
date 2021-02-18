package pet.mvc.shopservice;

import java.util.ArrayList;
import java.util.List;

import pet.mvc.shopdomain.Cart;
import pet.mvc.shopdomain.Category;
import pet.mvc.shopdomain.Product;
import pet.mvc.shopdomain.ProductListResult;
import pet.mvc.shopdomain.Review;

public interface ProductService {
	ProductListResult getProductListResult(int cp, int ps) throws Exception;
	ProductListResult getProductListResult(String catgo, String keyword, int cp, int ps) throws Exception;
	Product listS(long catgo_code) throws Exception;
	void insertS(Product product) throws Exception;
	List<Category> listCatgoS(long catgo_code) throws Exception;
	Review contentReviewS(long review_number) throws Exception;
	ArrayList<Review> listReviewS(long review_number) throws Exception;
	void insertReview(Review review) throws Exception;
	
}
