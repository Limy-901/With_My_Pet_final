package pet.mvc.mapper;

import pet.member.vo.MypagePetVO;

public interface mypagePetMapper {
	
	void petUpdateDo(MypagePetVO pet_mypage);
	MypagePetVO petMypage(int member_number);
}
