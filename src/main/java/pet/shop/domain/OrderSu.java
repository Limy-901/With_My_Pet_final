package pet.shop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderSu {
	private long product_code;
	private String ordersu_name;
	private String ordersu_addr;
	private String ordersu_email;
	private String product_name;
	private long product_price;
	
}
