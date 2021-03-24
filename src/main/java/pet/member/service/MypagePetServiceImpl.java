package pet.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.member.vo.MemberVO;
import pet.member.vo.MypagePetVO;
import pet.mvc.mapper.mypagePetMapper;

@Log4j
@Service

public class MypagePetServiceImpl implements MypagePetService {
	
	@Inject
	   private mypagePetMapper mapper;


	@Override
	public void petUpdateDo(MypagePetVO vo){
		mapper.petUpdateDo(vo);
	}
	
	@Override
	public MypagePetVO petMypage(int member_number){
		return mapper.petMypage(member_number);
	}

}
