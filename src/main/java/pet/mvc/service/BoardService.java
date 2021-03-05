package pet.mvc.service;

import java.util.ArrayList;
import java.util.List;

import pet.mvc.board.Board;
import pet.mvc.board.BoardCmt;
import pet.mvc.board.BoardListResult;


public interface BoardService {
	
	void write(Board board);
	void edit(Board board);
	void remove(long post_idx);
	BoardListResult getBoardListResult(String catgo, String keyword, int cp, int ps, long board_idx, int countPage,
			int startPage, int endPage);
	BoardListResult getBoardListResult(int cp, int ps, long board_idx, int countPage, int startPage, int endPage);

	
	void plusHitCount(long post_idx);
	
	//BoardCmt getCmtList(long post_idx);
	void writeCmt(BoardCmt boardCmt);
	void removeCmt(long comment_idx);
	void updateCmt(BoardCmt boardCmt);
	Board getBoard(long post_idx);
	ArrayList<BoardCmt> selectCmtBySeq(long post_idx);
	//BoardCmt selectCmtData(long comment_idx);
	
	


	void updateReply(long post_idx);
	int rewrite(Board board);
	int reRewrite(Board board);
	


	
	
	//BoardCmt saveReply(BoardCmt boardCmt);






	
}
