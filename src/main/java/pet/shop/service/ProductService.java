package pet.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import pet.shop.domain.Cart;
import pet.shop.domain.Category;
import pet.shop.domain.Option;
import pet.shop.domain.Product;
import pet.shop.domain.ProductListResult;
import pet.shop.domain.Review;

public interface ProductService {
	ProductListResult getProductListResult(int cp, int ps);
	ProductListResult getProductListResult(String catgo, String keyword, int cp, int ps);
	Product listS(long catgo_code);
	void insertS(Product product);
	List<Category> listCatgoS(long catgo_code);
	Review contentReviewS(long review_number);
	ArrayList<Product> listProduct2(long catgo_code);
	ArrayList<Review> listReviewS(long review_number);
	void insertReview(Review review);
	ArrayList<Option> listOption(long product_code);
	void insertOption(Option option);

	Product contentProductS(long catgo_code);
	
}
