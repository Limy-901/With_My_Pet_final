package pet.mvc.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.mvc.mapper.BoardMapper;
import pet.member.vo.MemberVO;
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
	public BoardListResult getBoardListResult(int cp, int ps, int board_idx, int countPage, int startPage, int endPage) {
		long totalCount = boardMapper.selectCount(board_idx);
		log.info("totalCount@@@@@@"+totalCount);
		
		BoardVo boardVo = new BoardVo(null, null, cp, ps, board_idx);
		log.info("countpage@@@@@"+countPage);
		countPage = (int) (totalCount/ps);
		if(totalCount%ps != 0) countPage++;
		log.info("countpage2@@@@@"+countPage);
		List<Board> list = boardMapper.selectPerPage(boardVo);
		BoardListResult rl = new BoardListResult(cp, totalCount, ps, list, board_idx, countPage, startPage, endPage);
		log.info("rl@@@@@@@@@"+rl);

		
		return rl;
	}
	
	@Override
	public BoardListResult getBoardListResult(String catgo, String keyword, int cp, int ps, int board_idx, int countPage, int startPage, int endPage) {
		
		BoardVo boardVo = new BoardVo(catgo, keyword, cp, ps, board_idx);
		long totalCount = boardMapper.selectCountByCatgo(boardVo);
		List<Board> list = boardMapper.selectByCatgo(boardVo);
		
		return new BoardListResult(cp, totalCount, ps, list, board_idx, countPage, startPage, endPage);
	}
	
	@Override
	public Board getBoard(long post_idx) {	

		Board dto = boardMapper.selectBySeq(post_idx);
		int like = boardMapper.getLikeCount(post_idx);
		ArrayList<BoardCmt> comment = boardMapper.selectCmtBySeq(post_idx);
		dto.setComment(comment);	
		dto.setLike(like);
		log.info("@@@@@@@@@@@@@@@@@2dto"+dto);
		return dto;

	}

	
	@Override
	public int updateHitCount(long post_idx) {
		return boardMapper.updateHitCount(post_idx);
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
	



	//답글관련
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
	public int insertLike(BoardLike boardLike) {
		int like = boardMapper.insertLike(boardLike);
		 return like;
	}

	@Override
	public int getLikeCount(long post_idx) {
		return boardMapper.getLikeCount(post_idx);
	}
	
	@Override
	public int divideLike(BoardLike boardLike) {
		return boardMapper.divideLike(boardLike);
	}

	@Override
	public void deleteLike(BoardLike boardLike) {
		boardMapper.deleteLike(boardLike);
		
	}

	@Override
	public int rewirteCmt(BoardCmt boardCmt) {
		return boardMapper.rewriteCmt(boardCmt);
		
	}

	@Override
	public List<Board> getRecent() {
		return boardMapper.getRecent();
				
	}






	
}
