package pet.admin.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderStatus {
	private String member_name;
	private String product_name;
	private long pay_totalpay;
	private Date pay_date;
	private String pay_address;
	private String pay_method;
	private String pay_day;
}
