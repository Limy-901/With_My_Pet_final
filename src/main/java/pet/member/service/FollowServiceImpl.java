package pet.member.service;
import java.util.ArrayList;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;
import pet.member.vo.FollowVO;
import pet.mvc.mapper.followMapper;
@Log4j
@Service
public class FollowServiceImpl implements FollowService {
	
	@Inject
	   private followMapper mapper;
	//follow Ãß°¡
	@Override
	public void addfollow(FollowVO vo) throws Exception {
		mapper.addfollow(vo);
	}
	@Override
	public ArrayList<FollowVO> following(int vo) {		
		return mapper.following(vo);
	}
	@Override
	public ArrayList<FollowVO> follower(int vo) {
		return mapper.follower(vo);
	}
	
	@Override
	public ArrayList<FollowVO> deleteFollowing(String vo) {
		return mapper.deleteFollowing(vo);
	}
	
	@Override
	public ArrayList<FollowVO> deleteFollower(String vo) {
		return mapper.deleteFollower(vo);
	}
}