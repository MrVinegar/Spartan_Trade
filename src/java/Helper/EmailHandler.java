package Helper;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @date 2020-3-6 16:41:57
 * @author Yi Qiu
 */
public class EmailHandler {

    Session mailSession;
    Properties props = new Properties();

    public EmailHandler(String _username, String _password, String _host, String _port) {
        this.props.put("username", _username);
        this.props.put("password", _password);
        this.props.put("mail.transport.protocol", "smtp");
        this.props.put("mail.smtp.host", _host);
        this.props.put("mail.smtp.port", _port);
        this.mailSession = Session.getDefaultInstance(this.props);
    }

    public boolean sendMail(String _To, String _subject, String _content) {

        try {
            
            Message Msg = new MimeMessage(this.mailSession);
            Msg.setFrom();
            Msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(_To));
            Msg.setSubject(_subject);
            Msg.setContent(_content, "text/html;charset=UTF-8");

            Transport transport = mailSession.getTransport("smtp");
            transport.connect(props.getProperty("mail.smtp.host"), props
                    .getProperty("username"), props.getProperty("password"));
            transport.sendMessage(Msg, Msg.getAllRecipients());
            transport.close();

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

}
