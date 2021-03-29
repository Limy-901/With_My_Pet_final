package pet.mvc.mapper;

import java.util.ArrayList;
import pet.walk.vo.IndexData;
import pet.walk.vo.Walk;

public interface IndexMapper {
	ArrayList<Walk> getWalkList();
	IndexData getWalkData();
	Walk getRecentWalk(long member_number);
	ArrayList<Long> getJoinMemberNumber(long walk_idx);
}
