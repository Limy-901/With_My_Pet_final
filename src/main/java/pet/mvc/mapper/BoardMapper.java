package pet.mvc.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import pet.mvc.board.Board;
import pet.mvc.board.BoardCmt;
import pet.mvc.board.BoardLike;
import pet.mvc.board.Tag;
import pet.mvc.board.BoardVo;

public interface BoardMapper {
	List<Board> selectPerPage(BoardVo boardVo);
	List<Board> selectByCatgo(BoardVo boardVo);
	List<Board> selectPerMember(BoardVo boardVo);
	List<Board> selectByTag(BoardVo boardVo);
	
	Board selectBySeq(long post_idx);
	long selectCount(long board_iㅡㅛㅔdx);
	long selectMemberCount(int member_number);
	int selectCountByCatgo(BoardVo boardVo);
	void insert(Board board);
	void delete(long post_idx);
	void update(Board board);
	String selectPostTime(long post_idx);
	
	
	
	int updateHitCount(long post_idx);
	

	BoardCmt selectCmtData(long post_idx);
	ArrayList<BoardCmt> selectCmtBySeq(long post_idx);
	void insertCmt(BoardCmt boardCmt);
	int deleteCmt(long comment_idx);
	void updateCmt(BoardCmt boardCmt);
	
	
	void insertReply(Board board);

	void updateOrder(Board parent);
	Board selectReplyElement(long post_idx);
	int rewriteBoard(Board board);
	
	
	int insertLike(BoardLike boardLike);
	int getLikeCount(long post_idx);
	void deleteLike(BoardLike boardLike);
	
	int divideLike(BoardLike boardLike);

	List<Board> getRecent();
	int rewriteCmt(BoardCmt boardCmt);
	
	ArrayList<Tag> getTag(long post_idx);
	
	void enterTag(Tag tag);

	void delTag(long post_idx);
	void editTag(Tag tag);
	List<List<Tag>> getTagAll();
}
	