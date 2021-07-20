package com.it.every.email;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mailSendGoogle {
	
	private String base;  
	
	public String MailSend(String email) {
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put( "mail.smtp.ssl.protocols", "TLSv1.2");
       
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);

       int a =(int) Math.floor(Math.random() * 10100);
       System.out.println("랜덤번호"+ a);
        String send= Integer.toString(a);
       System.out.println(email);
        
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("jamestwo37@gmail.com", "(주)에브리대학교"));
            InternetAddress to = new InternetAddress(email, "text/html; charset=8859_1");         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("인증번호가 도착했습니다", "UTF-8");            
            msg.setText(send, "UTF-8");
          
            Transport.send(msg);
            
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
        
        return send;    
    }
}




