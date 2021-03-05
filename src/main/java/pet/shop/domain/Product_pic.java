package pet.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product_pic {
	private long product_idx;
	private long product_code;
	private String product_pic_fname;
	private String product_pic_ofname;
	private long product_pic_fsize;
}
