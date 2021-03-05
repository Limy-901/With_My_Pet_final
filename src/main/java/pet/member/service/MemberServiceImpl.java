package pet.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.member.vo.MemberVO;
import pet.mvc.mapper.memberMapper;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
   
   @Inject
   private memberMapper mapper;

   //회원가입
   @Override
   public void join(MemberVO vo) throws Exception {
	   mapper.join(vo);
   }
   
   //이메일 중복체크
   @Override
   public int mailChk(MemberVO vo) throws Exception {
      int result = mapper.mailChk(vo);
      return result;
   }
   
   //로그인
   @Override
   public MemberVO login(MemberVO lvo) {
      return mapper.login(lvo);
   }
   
   //마이페이지 본인정보 확인
   @Override
   public MemberVO mypage(MemberVO lvo) {
      return mapper.mypage(lvo);
   }
   
   //회원정보 수정(아님)
   @Override
   public void memberUpdateDo(MemberVO vo) throws Exception {
	   mapper.memberUpdateDo(vo);
   }

   //�븘�씠�뵒 李얘린
   @Override
   public MemberVO emailFind(MemberVO vo) throws Exception {
      return  mapper.emailFind(vo);
   }

   //�뙣�뒪�썙�뱶 李얘린
   @Override
   public MemberVO pwFind(MemberVO pvo) {
      return mapper.pwFind(pvo);
   }

   @Override
   public void pwModify(MemberVO vo) throws Exception {
	   mapper.pwModify(vo);
   }
   
   //회원정보 전체 수정
   @Override
   public void memberModify(MemberVO vo) {
	   mapper.memberModify(vo);
   }
   

}