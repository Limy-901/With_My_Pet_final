package pet.mvc.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.mvc.mapper.BoardMapper;

import pet.mvc.board.*;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	

	@Override
	public void write(Board board) {
		boardMapper.insert(board);

	}

	@Override
	public void edit(Board board) {
		boardMapper.update(board);

	}

	@Override
	public void remove(long post_idx) {
		boardMapper.delete(post_idx);

	}

	@Override
	public BoardListResult getBoardListResult(int cp, int ps, long board_idx, int countPage, int startPage, int endPage) {
		long totalCount = boardMapper.selectCount();
		BoardVo boardVo = new BoardVo(null, null, cp, ps, countPage, startPage, endPage, board_idx);
	//	if(startPage>1) startPage + 10;
		List<Board> list = boardMapper.selectPerPage(boardVo);
		
		return new BoardListResult(cp, totalCount, ps, list, board_idx, countPage, startPage, endPage);
	}
	
	@Override
	public BoardListResult getBoardListResult(String catgo, String keyword, int cp, int ps, long board_idx, int countPage, int startPage, int endPage) {
		BoardVo boardVo = new BoardVo(catgo, keyword, cp, ps, countPage, startPage, endPage, board_idx);
		long totalCount = boardMapper.selectCountByCatgo(boardVo);
		List<Board> list = boardMapper.selectByCatgo(boardVo);
		
		return new BoardListResult(cp, totalCount, ps, list, board_idx, countPage, startPage, endPage);
	}
	
	@Override
	public Board getBoard(long post_idx) {
		Board dto = boardMapper.selectBySeq(post_idx);
		ArrayList<BoardCmt> comment = boardMapper.selectCmtBySeq(post_idx);
		dto.setComment(comment);
		return dto;

	}
	


	
	@Override
	public void plusHitCount(long post_idx) {
		boardMapper.updateCount(post_idx);
	}
	
	
	
	
	
	//댓글 관련 service
	@Override
	public void writeCmt(BoardCmt boardCmt) {
		boardMapper.insertCmt(boardCmt);	
	}

	@Override
	public void removeCmt(long comment_idx){
		boardMapper.deleteCmt(comment_idx);
	}

	@Override
	public void updateCmt(BoardCmt boardCmt) {
	
	   boardMapper.updateCmt(boardCmt);
	}

	@Override
	public ArrayList<BoardCmt> selectCmtBySeq(long post_idx) {
		ArrayList<BoardCmt> dto = boardMapper.selectCmtBySeq(post_idx);
		return dto;
		
	}




	@Override
	public void updateReply(long post_idx) {
		Board parent = boardMapper.selectReplyElement(post_idx);
		Board board = boardMapper.selectBySeq(post_idx);
		boardMapper.updateOrder(parent);
		
	}
	
	@Override
	public int rewrite(Board board) {
		Board parent = boardMapper.selectReplyElement(board.getPost_idx());
		
		boardMapper.updateOrder(parent);		
		
		board.setPost_order(parent.getPost_order()+1);
			
		board.setPost_no(parent.getPost_no());
		board.setPost_depth(parent.getPost_depth()+1);
		return boardMapper.rewriteBoard(board);
		
	}

	@Override
	public int reRewrite(Board board) {
		Board parent = boardMapper.selectReplyElement(board.getPost_idx());
		boardMapper.updateOrder(parent);
		board.setPost_no(parent.getPost_no());
		board.setPost_depth(parent.getPost_depth()+1);
		return boardMapper.reRewriteBoard(board);
	}





	/*
	 * @Override public BoardCmt selectCmtData(long comment_idx) { BoardCmt dto =
	 * boardMapper.selectCmtData(comment_idx); return dto; }
	 */







	
}
