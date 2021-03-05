package pet.mvc.board;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardListResult {
	private int cp;
	private long totalCount;
	private int ps;
	private List<Board> list;
	private long board_idx;
	private long totalPageCount;
	private int countPage;
	private int startPage;
	private int endPage;


	
	public BoardListResult(int cp, long totalCount, int ps, List<Board> list, long board_idx, int countPage, int startPage, int endPage) {
		this.cp = cp;
		this.totalCount = totalCount;
		this.ps = ps;
		this.list = list;
		this.totalPageCount = calTotalPageCount();//페이지수
		this.board_idx = board_idx;
		this.countPage = countPage;
		this.startPage = startPage;
		this.endPage = endPage;

	}
	private long calTotalPageCount() {
		long tpc = totalCount/ps; 
		if(totalCount%ps != 0) tpc++;	
		
		
	
		return tpc;
	}


	
}
