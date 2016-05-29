package com.kkbank.util.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.kkbank.domain.User;



public class EmailUtils {
	private static final String FROM = "20131003471@gdufs.edu.cn";  
	  
    /** 
     * After successfully registration, send email to activate the account
     * @param user 未激活的用户 
     */  
    
    public static boolean sendAccountActivateEmail(User user) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("Activate your account.");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));  
            message.setContent("This e-mail is to confirm your security e-mail address, please click the link below to activate your account:<br/>"
            		+"<a href='" + GenerateLinkUtils.generateActivateLink(user)+"'>Click to activate your account</a>","text/html;charset=utf-8");  
            
            // Send e-mail 
            Transport.send(message);  
            return true;
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;
        }  
    }  
    
    /** 
     * The e-mail for resetting password 
     */  
    public static boolean sendResetPasswordEmail(User user) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
        	//build e-mail
            message.setSubject("Find your password back");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));  
            message.setContent("If you want to reset your password, please click the link below to reset your password:<br/>"
            		+ "	<a href='" + GenerateLinkUtils.generateResetPwdLink(user) +"'>Click to set new password.</a>","text/html;charset=utf-8");
            
            // Send e-mail
            System.out.println("Set successfully");
            System.out.println(message);
            Transport.send(message);
            System.out.println("send successfully");
            return true;
            
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;
        }  
    }  
    
    /*public static boolean sendAccountEmail(User user, String acNo) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("注册账号");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));  
            message.setContent("你已经在Starbank注册成功，您的账号是:<div align=\"center\">"+ acNo + "</div>", "text/html;charset=utf-8");  
            // 发送邮件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;
        }  
        return true;
    }  */
    
    public static Session getSession() {  
        Properties props = new Properties();  
        props.setProperty("mail.transport.protocol", "smtp");  
        props.setProperty("mail.smtp.host", "gdufs.edu.cn");  
        props.setProperty("mail.smtp.port", "25");  
        props.setProperty("mail.smtp.auth", "true");  
        Session session = Session.getInstance(props, new Authenticator() {  
            @Override  
            protected PasswordAuthentication getPasswordAuthentication() {  
                String password = "195726";  
                //InputStream is = EmailUtils.class.getResourceAsStream("password.dat");  
                //byte[] b = new byte[1024];  
               // {  
                  //  int len = is.read(b);  
                  //  password = new String(b,0,len);  
                //} catch (IOException e) {  
              //      e.printStackTrace();  
               // }  
                return new PasswordAuthentication(FROM, password);  
            }            
        });  
        return session;  
    }

}
