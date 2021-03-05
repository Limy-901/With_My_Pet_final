package pet.member.service;

import pet.member.vo.MemberVO;
import pet.member.vo.MypagePetVO;


public interface MypagePetService {

   
   //pet정보 수정
   public void petUpdateDo(MypagePetVO vo) throws Exception;
   
   //pet정보 select
   public MypagePetVO petMypage(int member_number);
   
  
}