package pet.mvc.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVo {
	String catgo;
	String keyword;
	
	//한페이지에 출력될 페이지수 countPage
	private int cp; //page
	private int ps; //countList =20
	private int countPage;
	private int startPage;
	private int endPage;

	private long board_idx; 

	
	
	{
		cp = 1;
		ps = 20;
		countPage = 10;

		startPage = ((cp-1) / countPage) * countPage + 1;
		endPage = startPage + countPage - 1 ;
		
	}

	
	public int getStartRow() {
		return (cp-1) * ps;
		
	}
	public int getEndRow() {
		return cp * ps;
	}
	
	

	

}
