package pet.mvc.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import pet.mvc.walk.Comment;
import pet.mvc.walk.Walk;
import pet.mvc.walk.WalkListVo;

public interface WalkMapper {
	void insertWalk(Walk dto);
	ArrayList<Walk> getList(WalkListVo vo);
	Walk getWalk(long idx);
	Long totalWalk(@Param("orderType")String orderType, @Param("keyword")String keyword);
	ArrayList<Comment> getWalkCmt(long idx);
	void insertWalkCmt(Comment dto);
	void walkUpdate(Walk dto);
	void walkDelete(long idx);
}
