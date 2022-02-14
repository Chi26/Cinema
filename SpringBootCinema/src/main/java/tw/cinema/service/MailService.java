package tw.cinema.service;

import javax.mail.internet.MimeMessage;

import org.apache.naming.factory.SendMailFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import tw.cinema.model.Members;

@Service
public class MailService {

	private JavaMailSender javaMailSender;
//	private SimpleMailMessage simpleMailMessage;

	@Autowired
	public MailService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

//	@Autowired
//	public MailService(SimpleMailMessage simpleMailMessage) {
//		this.simpleMailMessage = simpleMailMessage;
//	}

	// 註冊信件
	public void SendRegistrationMail(Members members) throws MailException {

		// 寄信者
		String from = "EEIT3502@gmail.com";
		// 收信者
		String to = members.getEmail();
		// 信件標題
		String subject = "超級影城註冊信";

		try {
			// 使用MimeMessage傳送HTML格式的mail
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			// true->支持HTML和附件 第三個參數->設定編碼
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			messageHelper.setFrom(from);
			messageHelper.setTo(to);
			messageHelper.setSubject(subject);
			messageHelper.setText(
					"<html><body style='background: linear-gradient(45deg, #49a09d, #5f2c82)'><BR><div align='center'><h2>歡迎"
							+ members.getName() + "成為超級影城會員</h2>"
							+ "<h4>您可以點選以下連結前往超級影城</h4><br><a href='http://localhost:8080/Home' style='color: #f2f2f2'>超級影城</a></div></body>",
					true);

//			ClassPathResource image = new ClassPathResource("images/body.JPG");
//			messageHelper.addInline("imageid", image);

			javaMailSender.send(mimeMessage);

		} catch (Exception e) {
			System.out.println("sending  registretion email went wrong!");
			e.printStackTrace();
		}

	}

	// 忘記密碼->修改密碼信件
	public void SendForgotMail(Members members) throws MailException {

		// 寄信者
		String from = "EEIT3502@gmail.com";
		// 收信者
		String to = members.getEmail();
		// 信件標題
		String subject = "超級影城密碼修改信";

		try {
			// 使用MimeMessage傳送HTML格式的mail
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			// true->支持HTML和附件 第三個參數->設定編碼
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			String emailText = "http://localhost:8080/onClickEmail.controller?username=" + members.getUsername();
			messageHelper.setFrom(from);
			messageHelper.setTo(to);
			messageHelper.setSubject(subject);
			messageHelper.setText("<html>" + "<body style='background: linear-gradient(45deg, #49a09d, #5f2c82)'>" + "<BR>" + "<div align='center'>" + "<h2>修改密碼</h2>"
					+ "<h4>請點選以下連結前往密碼修改頁面</h4><br>" + "<a href='" + emailText + "' style='color: #f2f2f2'>連結</a>" + "</div>"
					+ "</body></html>", true);
			javaMailSender.send(mimeMessage);

		} catch (Exception e) {
			System.out.println("sending changePwd email went wrong!");
			e.printStackTrace();
		}

	}

}


