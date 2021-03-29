package pet.mvc.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import pet.shop.domain.Product;

public interface LikelistMapper {
	
	void insertLikeList(@Param("member_number") long member_number, 
						@Param("product_code") long product_code);
	ArrayList<Long> getLikeList(long member_number);
	Product getProduct(long product_code);
	ArrayList<Product> getCommendList();
}
