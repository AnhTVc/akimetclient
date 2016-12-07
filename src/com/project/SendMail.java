package com.project;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

	private static String USER_NAME = "akimeet.com@gmail.com"; // GMail user
																// name (just
																// the part
																// before
																// "@gmail.com")
	private static String PASSWORD = "123456a@A"; // GMail password
	private static String RECIPIENT = "tranvietanh.hust@gmail.com";

	public static void main(String[] args) {
		String from = USER_NAME;
		String pass = PASSWORD;
		String[] to = { RECIPIENT }; // list of recipient email addresses
		String subject = "Akimeet - Giải pháp lấp đầy bàn trống vào những khung giờ thấp điểm dành cho nhà hàng";
		String body = "Welcome to JavaMail!<div style=\"font-size:26px\">Dear user</div>";

		sendFromGMail(from, pass, to, subject, body);
	}

	private static void sendFromGMail(String from, String pass, String[] to,
			String subject, String body) {
		Properties props = System.getProperties();
		String host = "smtp.gmail.com";
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.password", pass);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props);
		MimeMessage message = new MimeMessage(session);

		try {
			message.setFrom(new InternetAddress(from));
			InternetAddress[] toAddress = new InternetAddress[to.length];

			// To get the array of addresses
			for (int i = 0; i < to.length; i++) {
				toAddress[i] = new InternetAddress(to[i]);
			}

			for (int i = 0; i < toAddress.length; i++) {
				message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			}

			message.setSubject(subject);
			message.setContent(
					"<p>Xin ch&agrave;o nh&agrave; h&agrave;ng,</p>"
							+ "<div>Cảm ơn bạn đ&atilde; quan t&acirc;m đến dịch vụ của AkiMeet.</div><br>"
							+ "<div><span style=\"font-size: large;\"><strong>Vấn đề của nh&agrave; h&agrave;ng</strong></span></div>"
							+ "</div>"
							+ "<div>"
							+ "<blockquote>- Vẫn tốn chi ph&iacute; ở những khung giờ thấp điếm.</blockquote>"
							+ "<blockquote>- L&agrave;m sao quảng c&aacute;o sản phẩm đến với thực kh&aacute;ch.</blockquote>"
							+ "<blockquote>- L&agrave;m sao để chăm s&oacute;c kh&aacute;ch h&agrave;ng cũ, tiếp cận kh&aacute;ch h&agrave;ng mới.</blockquote>"
							+ "<blockquote>- L&agrave;m sao để kh&aacute;ch h&agrave;ng quay lại.</blockquote>"
							+ "</div>"
							+ "<div><span style=\"font-size: large;\"><strong>Vấn đề của kh&aacute;ch h&agrave;ng</strong></span></div>"
							+ "<blockquote>- Ăn m&oacute;n g&igrave;?</blockquote>"
							+ "<blockquote>- Ăn ở đ&acirc;u?</blockquote>"
							+ "<blockquote>- Ăn chỗ n&agrave;o ngon?</blockquote>"
							+ "<blockquote>- Ăn chỗ n&agrave;o rẻ?</blockquote>"
							+ "<blockquote>"
							+ "<div>- Ăn v&agrave;o khung giờ n&agrave;o hợp l&yacute;.</div>"
							+ "<div>&nbsp;</div>"
							+ "</blockquote>"
							+ "<p><span style=\"font-size: large;\"><strong>AkiMeet l&agrave;m việc như thế n&agrave;o?</strong></span></p>"
							+ "<blockquote>- Mang ưu đ&atilde;i giờ thấp điếm của nh&agrave; h&agrave;ng đến thực kh&aacute;ch.</blockquote>"
							+ "<blockquote>- Marketing cho nh&agrave; h&agrave;ng tr&ecirc;n c&aacute;c k&ecirc;nh th&ocirc;ng tin: google plus, facebook v&agrave; c&aacute;c web site\" m&agrave; người d&ugrave;ng t&igrave;m kiếm.</blockquote>"
							+ "<blockquote>- Tiếp thị trực tiếp với kh&aacute;ch h&agrave;ng về ưu đ&atilde;i của nh&agrave; h&agrave;ng.</blockquote>"
							+ "<blockquote>- Web site ch&iacute;nh:&nbsp;<a href=\"http://www.akimeet.com/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=vi&amp;q=http://www.akimeet.com/&amp;source=gmail&amp;ust=1476109070054000&amp;usg=AFQjCNGMN0rf2FmWBuMfRqAR91CC2TK-ew\">http://www.akimeet.com/</a><wbr />&nbsp;</blockquote>"
							+ "<blockquote>- Th&ocirc;ng tin d&agrave;nh cho nh&agrave; h&agrave;ng:&nbsp;<a href=\"http://www.akimeet.com/business\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=vi&amp;q=http://www.akimeet.com/business&amp;source=gmail&amp;ust=1476109070055000&amp;usg=AFQjCNG47X7vlY3cuGRzA0Jn9bKp0SVM2g\">http://www.akimeet.com/<wbr />business</a></blockquote>"
							+ "<div></div>"
							+ "<div><strong><span style=\"font-size: large;\">L&agrave;m việc với AkiMeet như thế n&agrave;o?</span></strong></div>"
							+ "<div>"
							+ "<blockquote>- Đăng k&yacute; t&agrave;i khoản d&agrave;nh cho nh&agrave; h&agrave;ng tại site:&nbsp;<a href=\"http://www.akimeet.com/business\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=vi&amp;q=http://www.akimeet.com/business&amp;source=gmail&amp;ust=1476109070055000&amp;usg=AFQjCNG47X7vlY3cuGRzA0Jn9bKp0SVM2g\">http://www.akimeet.com/<wbr />business</a></blockquote>"
							+ "<blockquote>- Li&ecirc;n hệ th&ocirc;ng b&aacute;o với ch&uacute;ng t&ocirc;i active t&agrave;i khoản của bản để kh&ocirc;ng mất thời gian chờ đợi.</blockquote>"
							+ "<blockquote>- V&agrave;o trang quản trị nh&agrave; h&agrave;ng (sau khi đ&atilde; được active) cung cấp th&ocirc;ng tin v&agrave; lập lịch ưu đ&atilde;i.</blockquote>"
							+ "<blockquote>- AkiMeet marketing cho nh&agrave; h&agrave;ng của bạn.</blockquote>"
							+ "<blockquote>"
							+ "<div>- AkiMeet sẽ triển khai thử nghiệm miễn ph&iacute; cho bạn trong khoảng thời gian 30 ng&agrave;y. Nếu l&agrave;m việc hiệu quả, AkiMeet sẽ b&agrave;n bạc về tri ph&iacute; với bạn.</div>"
							+ "<div>&nbsp;</div>"
							+ "</blockquote>"
							+ "<strong><span style=\"font-size: large;\">Li&ecirc;n hệ với AkiMeet</span></strong></div>"
							+ "<div>"
							+ "<blockquote>- Email:&nbsp;<a href=\"mailto:akimeet.com@gmail.com\" target=\"_blank\">akimeet.com@gmail.com</a></blockquote>"
							+ "<blockquote>- SDT hỗ trợ: Mr. Anh 01677826011</blockquote>"
							+ "</div>"
							+ "<div>Nếu bạn chưa hiểu về AkiMeet hay muốn bắt đầu l&agrave;m việc với ch&uacute;ng t&ocirc;i, đừng ngần ngại<span style=\"font-size: large;\"><strong>&nbsp;h&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i</strong></span></div>"
							+ "<div>&nbsp;</div>"
							+ "<div>Tr&acirc;n trọng.</div>",
					"text/html; charset=UTF-8");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (AddressException ae) {
			ae.printStackTrace();
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	}

}
