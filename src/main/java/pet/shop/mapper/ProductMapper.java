package pet.shop.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import pet.shop.domain.Cart;
import pet.shop.domain.Category;
import pet.shop.domain.Option;
import pet.shop.domain.Product;
import pet.shop.domain.ProductVo;
import pet.shop.domain.Review;



public interface ProductMapper {
	List<Product> selectPerpage(ProductVo productVo);
	List<Product> selectByCatgo(ProductVo productVo);
	long selectBySeq(long product_code);
	long selectCount();
	long selectCountByCatgo(ProductVo productVo);
	void insert(Product product);
	Product listProduct(long catgo_code);
	List<Category> listCatgo(long catgo_code);
	Review contentReview(long review_number);
	ArrayList<Product> listProduct2(long catgo_code);
	ArrayList<Review> listReview2(long review_number); 
	void insertReview(Review review);
	List<Product> selectCountInCart(long catgo_code);
	ArrayList<Option> listOption(long product_code);
	void insertOption(Option option);
	
	String saveStore(MultipartFile file) throws NumberFormatException;
	boolean writeFile(MultipartFile file, String saveFileName);
	
	Product contentProduct(long catgo_code);
}

