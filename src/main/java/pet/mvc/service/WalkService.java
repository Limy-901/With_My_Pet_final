package pet.mvc.service;

import pet.mvc.walk.CmtVo;
import pet.mvc.walk.Comment;
import pet.mvc.walk.Walk;
import pet.mvc.walk.WalkListResult;
import pet.mvc.walk.joinVo;

public interface WalkService {
	void insertWalk(Walk dto);
	Walk getWalk(long idx);
	WalkListResult getListS(int cp, int ps, String orderType, String keyword);
	CmtVo getWalkCmt(long idx);
	void insertWalkCmt(Comment dto);
	void walkUpdate(Walk dto);
	void walkDelete(long idx);
	Comment getWalkCmtData(long idx);
	void insertWalkJoin(joinVo vo, long cmtIdx);
	long selectByCmtIdx(long cmtIdx);
	void addHeart(joinVo vo);
	int getWalkLike(long idx);
}
