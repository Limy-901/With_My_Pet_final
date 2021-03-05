package pet.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Register {
	private long product_idx;
	private long product_code;
	private String product_fname;
	private String product_ofname;
	private long product_fsize;
}
