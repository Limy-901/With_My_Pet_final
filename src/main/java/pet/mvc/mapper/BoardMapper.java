package pet.mvc.mapper;

import java.util.ArrayList;
import java.util.List;

import pet.mvc.board.Board;
import pet.mvc.board.BoardCmt;
import pet.mvc.board.BoardVo;

public interface BoardMapper {
	List<Board> selectPerPage(BoardVo boardVo);
	List<Board> selectByCatgo(BoardVo boardVo);
	Board selectBySeq(long post_idx);
	long selectCount();
	long selectCountByCatgo(BoardVo boardVo);
	void insert(Board board);
	void delete(long post_idx);
	void update(Board board);
	String selectPostTime(long post_idx);
	
	
	void updateCount(long post_idx);
	

	BoardCmt selectCmtData(long post_idx);
	ArrayList<BoardCmt> selectCmtBySeq(long post_idx);
	void insertCmt(BoardCmt boardCmt);
	int deleteCmt(long comment_idx);
	void updateCmt(BoardCmt boardCmt);
	
	
	void insertReply(Board board);

	void updateOrder(Board parent);
	Board selectReplyElement(long post_idx);
	int rewriteBoard(Board board);
	int reRewriteBoard(Board board);
	
	
}
