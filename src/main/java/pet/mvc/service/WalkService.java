package pet.mvc.service;

import java.util.ArrayList;

import pet.mvc.walk.Comment;
import pet.mvc.walk.Walk;
import pet.mvc.walk.WalkListResult;

public interface WalkService {
	void insertWalk(Walk dto);
	Walk getWalk(long idx);
	WalkListResult getListS(int cp, int ps, String orderType, String keyword);
	ArrayList<Comment> getWalkCmt(long idx);
	void insertWalkCmt(Comment dto);
	void walkUpdate(Walk dto);
	void walkDelete(long idx);
}
