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
		long post_idx = board.getPost_idx();
		boardMapper.update(board);
		boardMapper.delTag(post_idx);
	}
	


	@Override
	public void remove(long post_idx) {
		boardMapper.delete(post_idx);

	}

	@Override
	public BoardListResult getBoardListResult(int cp, int ps, int board_idx, int countPage, int startPage, int endPage) {
		
		
		long totalCount = boardMapper.selectCount(board_idx);
		log.info("totalCount@@@@@@"+totalCount);
		
		BoardVo boardVo = new BoardVo(null, null, cp, ps, board_idx, -1);
		log.info("countpage@@@@@"+countPage);
		countPage = (int) (totalCount/ps);
		if(totalCount%ps != 0) countPage++;
		log.info("countpage2@@@@@"+countPage);
		List<Board> list = boardMapper.selectPerPage(boardVo);
		
		BoardListResult rl = new BoardListResult(cp, totalCount, ps, list, countPage, startPage, endPage, board_idx, null);
		
		List<List<Tag>> tagsList = new ArrayList<List<Tag>>();
		ArrayList<Tag> tag = null;

		for(Board board : list) {
			//long post_idx = board.getPost_idx();
			tagsList = boardMapper.getTagAll();
			//log.info("@@tag"+tag);
			//tagsList.add(list);
			log.info("@@tglist"+tagsList);
			
		}
		rl.setTagsList(tagsList);		
		log.info("rl@@@@@@@@@"+rl);
	
		return rl;
	}
	
	@Override
	public BoardListResult getBoardListResult(String catgo, String keyword, int cp, int ps, int board_idx, int countPage, int startPage, int endPage) {		
		if(catgo.equals("post_tag")) {
			log.info("태그검색");
			BoardVo boardVo = new BoardVo(catgo, keyword, cp, ps, board_idx, -1);
			long totalCount = boardMapper.selectCountByCatgo(boardVo);
			
			List<Board> list = boardMapper.selectByTag(boardVo);
			BoardListResult rl = new BoardListResult(cp, totalCount, ps, list, countPage, startPage, endPage, board_idx, null);
			
			List<List<Tag>> tagsList = new ArrayList<List<Tag>>();
			ArrayList<Tag> tag = null;

			for(Board board : list) {
				//long post_idx = board.getPost_idx();
				tagsList = boardMapper.getTagAll();
				log.info(tag+"@Dtag");
				//tagsList.add(tag);
				log.info("@@@tl"+tagsList);
				
			}
			rl.setTagsList(tagsList);		
			log.info("rl@@@@@@@@@"+rl);
		
			return rl;
		}
		else {
			
			BoardVo boardVo = new BoardVo(catgo, keyword, cp, ps, board_idx, -1);
			long totalCount = boardMapper.selectCountByCatgo(boardVo);
			List<Board> list = boardMapper.selectByCatgo(boardVo);
			log.info("기타검색");
			BoardListResult rl = new BoardListResult(cp, totalCount, ps, list, countPage, startPage, endPage, board_idx, null);
			
			List<List<Tag>> tagsList = new ArrayList<List<Tag>>();
			ArrayList<Tag> tag = null;

			for(Board board : list) {
				tagsList = boardMapper.getTagAll();
				
			}
			rl.setTagsList(tagsList);		
			log.info("rl@@@@@@@@@"+rl);
		
			return rl;
		}
		
		
	}
	
	
	@Override
	public BoardListResult getBoardListResultPerMember(int cp, int ps, int board_idx, int countPage, int startPage, int endPage, int member_number) {
		long totalCount = boardMapper.selectMemberCount(member_number);
		log.info("totalCount@@@@@@"+totalCount);
		int  mnum = member_number;
		
		log.info(mnum+"###mnum");
		
		
		BoardVo boardVo = new BoardVo(null, null, cp, ps, board_idx, member_number);
		log.info("countpage@@@@@"+countPage);
		countPage = (int) (totalCount/ps);
		if(totalCount%ps != 0) countPage++;
		log.info("countpage2@@@@@"+countPage);
		List<Board> list = boardMapper.selectPerMember(boardVo);
		BoardListResult rl = new BoardListResult(cp, totalCount, ps, list, countPage, startPage, endPage, board_idx, null);
		
		List<List<Tag>> tagsList = new ArrayList<List<Tag>>();
		ArrayList<Tag> tag = null;

		for(Board board : list) {
			long post_idx = board.getPost_idx();
			tag = boardMapper.getTag(post_idx-1);
			log.info("@@@@tag"+tag);
			tagsList.add(tag);
			log.info("@@@@tl"+tagsList);
			
		}
		rl.setTagsList(tagsList);		
		log.info("rl@@@@@@@@@"+rl);
	
		return rl;
	
	}
	
	
	@Override
	public Board getBoard(long post_idx) {	

		Board dto = boardMapper.selectBySeq(post_idx);
		int like = boardMapper.getLikeCount(post_idx);
		ArrayList<BoardCmt> comment = boardMapper.selectCmtBySeq(post_idx);
		ArrayList<Tag> tag = boardMapper.getTag(post_idx);
		dto.setTag(tag);
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



	@Override
	public List<Tag> getTag(long post_idx) {
		return boardMapper.getTag(post_idx);
	}

	@Override
	public void writeTag(Tag post_tag) {

		String tagStr = post_tag.getPost_tag();	
		List<String> list = new ArrayList<String>();
		String[] splitStr = tagStr.split(",");	

		for(int i=0; i<splitStr.length; i++) {
			list.add(splitStr[i]);
			log.info("setPost_tag"+list.get(i));
			post_tag.setPost_tag(list.get(i));
			boardMapper.enterTag(post_tag);
		}	

	}

	@Override
	public void editTag(Tag post_tag) {
		
		String tagStr = post_tag.getPost_tag();	
		log.info("tagStr$$$$"+tagStr);
		List<String> list = new ArrayList<String>();
		String[] splitStr = tagStr.split(",");	
		for(int i=0; i<splitStr.length; i++) {
			list.add(splitStr[i]);
			log.info("setPost_tag"+list.get(i));
			post_tag.setPost_tag(list.get(i));
			boardMapper.editTag(post_tag);
		}
	}








	
}
