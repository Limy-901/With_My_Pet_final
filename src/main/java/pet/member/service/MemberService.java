package pet.member.service;

import pet.member.vo.MemberVO;


public interface MemberService {

   //회원 가입
   public void join(MemberVO vo) throws Exception;
   
   //이메일 중복체크
   public int mailChk(String email) throws Exception;
   
   //로그인
   public MemberVO login(MemberVO lvo);
   
   //마이페이지 본인정보 확인
   public MemberVO mypage(MemberVO lvo);
   
   //회원정보 수정(아님)
   public void memberUpdateDo(MemberVO vo) throws Exception;
   
   //이메일 찾기
   public MemberVO getEmailSearch(String address, String name) throws Exception;
   
   //이메일발송
   public void sendEmail(MemberVO vo) throws Exception;

   //비밀번호찾기
   public String getpwSearch(String email) throws Exception;
   
   //패스워드 수정
   public void pwModify(MemberVO vo) throws Exception;
   
   // 회원정보 전체 수정
   public void memberModify(MemberVO vo) throws Exception;
   
}