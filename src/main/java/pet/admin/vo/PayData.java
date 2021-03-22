package pet.admin.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayData {
	private long member_number;
	private String member_name;
	private String product_name;
	private String member_address;
	private long pcount;
	private String pay_method;
	private Date login_date;
	private String login;
}
