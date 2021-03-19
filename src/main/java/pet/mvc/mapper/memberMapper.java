package pet.mvc.mapper;

import org.apache.ibatis.annotations.Param;

import pet.member.vo.MemberVO;

public interface memberMapper {
	void join(MemberVO member);
	int mailChk(String email);
	MemberVO login(MemberVO member);
	MemberVO mypage(MemberVO member);
	MemberVO followmypage(int member);
	void memberUpdateDo(MemberVO member);
	MemberVO emailFind(@Param("member_address")String member_address, @Param("member_name")String member_name);
	MemberVO pwFind(String email);
	void updatePw(MemberVO member);
	MemberVO pwModify(MemberVO member);
	void memberModify(MemberVO member);
	void loginLog(long member_number);
	void makeLoginLog(@Param("member_number")long member_number, @Param("member_name")String member_name);
}
