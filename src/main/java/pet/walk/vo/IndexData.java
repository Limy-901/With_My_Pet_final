package pet.walk.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IndexData {
	private long totalwalks;
	private long totaljoins;
	private long notjoin;
	private long todayPuppy;
}
