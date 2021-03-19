package pet.member.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.member.controller.MailUtil;
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
   public int mailChk(String email) throws Exception {
      int result = mapper.mailChk(email);
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
   
 //follow 마이페이지 정보 확인
   @Override
   public MemberVO followmypage(int lvo) {
      return mapper.followmypage(lvo);
   }
   
   //회원정보 수정(아님)
   @Override
   public void memberUpdateDo(MemberVO vo) throws Exception {
	   mapper.memberUpdateDo(vo);
   }

   //이메일 찾기
   @Override
   public MemberVO getEmailSearch(String address, String name) throws Exception {
      return  mapper.emailFind(address, name);
   }
   
   //비밀번호 찾기 이메일발송
   @Override
   public void sendEmail(MemberVO vo) throws Exception  {
	   
   }

   //이메일로 비밀번호찾기
   @Override
   public String getpwSearch(String email) throws Exception {
	   BCryptPasswordEncoder pwencoder = new BCryptPasswordEncoder();
	   
	   log.info("바보아니면 찍혀라"+email);
	   MemberVO vo = new MemberVO();
	   vo.setMember_email(email);
	   
   	int result = mapper.mailChk(email);

   	// 가입된 아이디가 없으면
   	if(result == 0) {
   		log.info("등록되지 않은 아이디입니다.");
   		return null;
   	}else {
   		// 임시 비밀번호 생성
   		String pw = "";
   		for (int i = 0; i < 12; i++) {
   			pw += (char) ((Math.random() * 26) + 97);
   		}
   		log.info("암호 안걸린 임시비번 찍어본다"+pw);
   		vo.setMember_password(pw);
   		
   		//메일 전송
   		MailUtil mail = new MailUtil();
   		mail.sendEmail(vo);
   		
   		String secPwd = pwencoder.encode(vo.getMember_password());
        //  암호화된 비밀번호를 VO에 SET한다.
        vo.setMember_password(secPwd);
        //log.info("암호걸린 임시비번 찍어본다"+secPwd);
   		// 비밀번호 변경
   		mapper.updatePw(vo);
   		// 비밀번호 변경 메일 발송
   		//sendEmail(vo, "getpwSearch");

   		log.info("이메일로 임시 비밀번호를 발송하였습니다.");
   			return pw;
   	}
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
   
   // 로그인 로그 남기기 
	@Override
	public void loginLog(long member_number) {
		mapper.loginLog(member_number);
	}

	// 로그인 로그 생성
	@Override
	public void makeLoginLog(long member_number, String member_name) {
		mapper.makeLoginLog(member_number, member_name);
	}
   

}