package pet.mvc.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tag {
	private long post_idx;
	private int board_idx;
	private String post_tag;
	
}
