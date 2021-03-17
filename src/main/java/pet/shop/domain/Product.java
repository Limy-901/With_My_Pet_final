package pet.shop.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private long product_code;
	private String product_name;
	private long product_price;
	private String product_content;
	private String product_tag;
	private Date product_date;
	private long product_like;
	private long catgo_code;
	private long review_number;
	private long member_number;
	private String review_subject;
	private String review_message;
	private String review_email;
	private long product_amount;
	private long product_size;
	private String product_image;
	private long product_idx;
	private String product_pic_fname;
	private String product_pic_ofname;
	private long product_pic_fsize;
	
}
