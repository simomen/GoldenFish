package classes;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class envoiAlert {

	
	public static void envoi(String email,String msg ){
		try {
			
			final String username = "youss.dev@gmail.com";
			final String password = "youssefbouchari2";

			Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
		
			Session session = Session.getInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					});
			
			

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse("youss.dev@gmail.com"));
				message.setSubject("Mail Client \n");
				message.setText(msg  +" du client  "+email);
	
				Transport.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
			}
	}
}
