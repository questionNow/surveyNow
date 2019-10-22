package user.controller;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;  
 
/**
 * @author viper9
 *
 */
public class SMTPAuthenticator extends Authenticator {
    public SMTPAuthenticator() {
        super();
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "hiwodnd@gmail.com";    // 내 아이디 
 
        String password = "asdf103829";   // 내 비밀번호 
        return new PasswordAuthentication(username, password);
    }
}