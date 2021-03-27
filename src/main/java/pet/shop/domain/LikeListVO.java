package pet.shop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pet.mvc.mapper.LikeListMapper;

@AllArgsConstructor
@NoArgsConstructor
@Data
public abstract class LikeListVO implements LikeListMapper {
	
	private long member_number;
	private long product_code;
	

	public Long getmember_number() {

		return member_number;

	}

	public void setproduct_code(long product_code) {

		this.product_code = product_code;

	}

}
