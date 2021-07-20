package com.it.every.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
	
	PasswordAuthentication pa;
	
	public MailAuth() {
		String mail_id = "jamestwo37@gmail.com";
		String mail_pw = "wkddudgns46@";
		
		pa = new PasswordAuthentication(mail_id, mail_pw);
		
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
