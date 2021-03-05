package pet.shop.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pay {
	private long pay_number;
	private long order_code;
	private Date pay_date;
	private long pay_totalpay;
	private String pay_method;
	private String pay_bank;
	private String pay_address;
	private String pay_status;
	private int member_number;
	private String member_email;
	private String member_pw;
	private String member_name;
	private String member_address;
	private Date member_date;
}
