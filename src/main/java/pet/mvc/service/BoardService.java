package pet.mvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import pet.mvc.board.Board;
import pet.mvc.board.BoardCmt;
import pet.mvc.board.BoardLike;
import pet.mvc.board.BoardListResult;
import pet.mvc.board.Tag;


public interface BoardService {
	
	void write(Board board);
	void edit(Board board);
	void remove(long post_idx);
	
	void writeCmt(BoardCmt boardCmt);
	void removeCmt(long comment_idx);
	void updateCmt(BoardCmt boardCmt);
	Board getBoard(long post_idx);
	ArrayList<BoardCmt> selectCmtBySeq(long post_idx);

	

	int updateHitCount(long post_idx);
	

	void updateReply(long post_idx);
	int rewrite(Board board);
	
	
	int insertLike(BoardLike boardLike);
	int getLikeCount(long post_idx);
	int divideLike(BoardLike boardLike);
	void deleteLike(BoardLike boardLike);
	
	int rewirteCmt(BoardCmt boardCmt);
	List<Board> getRecent();

	
	//BoardTag enterTag(BoardTag boardTag);
	List<Tag> getTag(long post_idx);
	void writeTag(Tag post_tag);
	void editTag(Tag post_tag);
	
	
	BoardListResult getBoardListResult(int cp, int ps, int board_idx, int countPage, int startPage, int endPage);
	BoardListResult getBoardListResult(String catgo, String keyword, int cp, int ps, int board_idx, int countPage,
			int startPage, int endPage);
	BoardListResult getBoardListResultPerMember(int cp, int ps, int board_idx, int countPage, int startPage,
			int endPage, int member_number);
	

	







	
}
