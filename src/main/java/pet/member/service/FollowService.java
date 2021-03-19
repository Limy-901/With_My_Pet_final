package pet.member.service;
import java.util.ArrayList;
import pet.member.vo.FollowVO;
public interface FollowService {
   //ÆÈ·Î¿ì Ãß°¡
   public void addfollow(FollowVO vo) throws Exception;
   //ÆÈ·ÎÀ× select
   public ArrayList<FollowVO> following(int vo);
   //ÆÈ·Î¿ö select
   public ArrayList<FollowVO> follower(int vo);
 //ÆÈ·ÎÀ× delete
   public ArrayList<FollowVO> deleteFollowing(String vo);
 //ÆÈ·Î¿ö delete
   public ArrayList<FollowVO> deleteFollower(String vo);
}















