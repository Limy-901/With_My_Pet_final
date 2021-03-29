package pet.mvc.service;

import java.util.ArrayList;
import pet.walk.vo.IndexData;
import pet.walk.vo.Walk;

public interface IndexService {
	ArrayList<Walk> getWalkList();
	IndexData getWalkData();
	Walk getRecentWalk(long member_number);
	long getJoinMemberNumber(long walk_idx, long member_number);
}
