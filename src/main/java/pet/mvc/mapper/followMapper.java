package pet.mvc.mapper;
import java.util.ArrayList;
import pet.member.vo.FollowVO;
public interface followMapper {
	void addfollow(FollowVO follow);
	ArrayList<FollowVO> following(int follow);
	ArrayList<FollowVO> follower(int follow);
	ArrayList<FollowVO> deleteFollowing(String follow);
	ArrayList<FollowVO> deleteFollower(String follow);
}