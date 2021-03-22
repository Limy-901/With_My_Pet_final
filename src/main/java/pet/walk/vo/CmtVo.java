package pet.walk.vo;

import java.util.ArrayList;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CmtVo {
	private ArrayList<Comment> normal;
	private ArrayList<Comment> join;
	private ArrayList<String> normalUrls;
	private ArrayList<String> joinUrls;
	private int joinCount;
	private int applyCount;
	
	public CmtVo(ArrayList<Comment> normal, ArrayList<Comment> join, ArrayList<String> normalUrls, ArrayList<String> joinUrls, int joinCount, int applyCount) {
		this.normal = normal;
		this.join = join;
		this.joinCount = joinCount;
		this.applyCount = applyCount;
	}
}
