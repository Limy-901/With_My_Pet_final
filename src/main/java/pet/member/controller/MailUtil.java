package pet.member.controller;
import org.apache.commons.mail.HtmlEmail;
import lombok.extern.log4j.Log4j;
import pet.member.vo.MemberVO;
@Log4j
public class MailUtil {
	   public void sendEmail(MemberVO vo) throws Exception {
	   	String charSet = "utf-8";
	   	String hostSMTP = "smtp.naver.com";
	   	String hostSMTPid = "lsj432988@naver.com";
	   	String hostSMTPpwd = "dltnwls1219@";
	   	String fromEmail = "lsj432988@naver.com";
	   	String fromName = "관리자";
	   	String subject = "With My Pet에서 보내주는 임시 비밀번호";
	   	String msg = "";
	   	subject = "With My pet 입시 비밀번호";
   		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
   		msg += "<h3 style='color: blue;'>";
   		msg += "회원님의 임시 비밀번호 입니다.</h3>";
   		msg += "<p>임시 비밀번호는  : ";
   		msg +=  vo.getMember_password() + "</p></div>";
	   	
	   	String mail = vo.getMember_email();
	   	
	   	try {
	   		HtmlEmail email = new HtmlEmail();
	   		email.setDebug(true);
	   		email.setCharset(charSet);
	   		email.setTLS(true);
	   		email.setHostName(hostSMTP);
	   		email.setSmtpPort(587);
	   		email.setAuthentication(hostSMTPid, hostSMTPpwd);
	   		email.setTLS(true);
	   		email.addTo(mail, charSet);
	   		email.setFrom(fromEmail, fromName, charSet);
	   		email.setSubject(subject);
	   		email.setHtmlMsg(msg);
	   		email.send();
	   	} catch (Exception e) {
	   		log.info("이메일 전송 실패: " + e);
	   	}
	   }
}