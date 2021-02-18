package pet.mvc.shopdomain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Component("Cart")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private long cart_code;
	private long product_code;
	private long member_number;
	private long cart_qty;
	private String cart_date;
}
