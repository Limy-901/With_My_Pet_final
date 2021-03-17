package pet.member.controller;

import org.apache.commons.mail.HtmlEmail;

import lombok.extern.log4j.Log4j;
import pet.member.vo.MemberVO;

@Log4j
public class MailUtil {
	 //비밀번호 찾기 이메일발송
	   public void sendEmail(MemberVO vo) throws Exception {
	   	// Mail Server 설정
	   	String charSet = "utf-8";
	   	String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
	   	String hostSMTPid = "lsj432988@naver.com";
	   	String hostSMTPpwd = "dltnwls1219";

	   	// 보내는 사람 EMail, 제목, 내용
	   	String fromEmail = "lsj432988@naver.com";
	   	String fromName = "쑤진";
	   	String subject = "수진이가 보내주는 임시비번";
	   	String msg = "";

	   	subject = "With My pet 임시 비밀번호 입니다.";
   		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
   		msg += "<h3 style='color: blue;'>";
   		msg += vo.getMember_name()+"님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
   		msg += "<p>임시 비밀번호 : ";
   		msg +=  vo.getMember_password() + "</p></div>";
	   	
	   	
	   /*	if(div.equals("getpwSearch")) {
	   		subject = "With My pet 임시 비밀번호 입니다.";
	   		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
	   		msg += "<h3 style='color: blue;'>";
	   		msg += vo.getMember_name()+"님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
	   		msg += "<p>임시 비밀번호 : ";
	   		msg +=  vo.getMember_password() + "</p></div>";
	   	}*/

	   	// 받는 사람 E-Mail 주소
	   	String mail = vo.getMember_email();
	   	
	   	try {
	   		HtmlEmail email = new HtmlEmail();
	   		email.setDebug(true);
	   		email.setCharset(charSet);
	   		email.setTLS(true);
	   		email.setHostName(hostSMTP);
	   		email.setSmtpPort(587); //네이버 이용시 587

	   		email.setAuthentication(hostSMTPid, hostSMTPpwd);
	   		email.setTLS(true);
	   		email.addTo(mail, charSet);
	   		email.setFrom(fromEmail, fromName, charSet);
	   		email.setSubject(subject);
	   		email.setHtmlMsg(msg);
	   		email.send();
	   	} catch (Exception e) {
	   		log.info("메일발송 실패 : " + e);
	   	}
	   }
}
