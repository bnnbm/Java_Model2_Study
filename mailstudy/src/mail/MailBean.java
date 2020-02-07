package mail;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
public class MailBean {
	private String sendid;
	private String sendpw;
	private String recipient;
	private String title;
	private String contents;
	private String mtype;
	private String err_msg;
	public boolean sendMail() {
		Properties prop = new Properties();
		//smtp 서버 주소 설정
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true"); //인증받은 메일만 가능
		prop.put("mail.smtp.debug", "true");
		prop.put("mail.smtp.user", "sendid"); //네이버 아이디
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.fallback", "false");
		//인증객체
		MyAuthenticator auth = new MyAuthenticator(sendid, sendpw);
		//메일 전송을 위한 연결 객체
		Session session = Session.getInstance(prop,auth);
		//msg : 메일 객체
		MimeMessage msg = new MimeMessage(session);
		try {
			//보낸 메일 설정
			msg.setFrom(new InternetAddress(sendid));
			//받는 메일 설정
			InternetAddress[] address = { new InternetAddress(recipient) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(title);
			msg.setSentDate(new Date());
			msg.setText(contents);
			InternetAddress from = new InternetAddress(sendid);
			msg.setFrom(from);
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart body = new MimeBodyPart();
			body.setContent(contents,mtype);
			multipart.addBodyPart(body);
			msg.setContent(multipart);
			Transport.send(msg);
		} catch (MessagingException me) {
			System.out.println(me.getMessage());
			me.printStackTrace();
			return false;
		}
		return true;
	}
	public final class MyAuthenticator extends Authenticator {
		private String id;
		private String pw;
		public MyAuthenticator(String id, String pw) {
			this.id = id; //네이버 아이디
			this.pw = pw; //네이버 비밀번호
		}
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(id, pw);
		}
	}
	//setter,getter 메서드들
	public String getSendid() {
		return sendid;
	}
	public void setSendid(String sendid) {
		this.sendid = sendid;
	}
	public String getSendpw() {
		return sendpw;
	}
	public void setSendpw(String sendpw) {
		this.sendpw = sendpw;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getErr_msg() {
		return err_msg;
	}
	public void setErr_msg(String err_msg) {
		this.err_msg = err_msg;
	}
	
	
}
