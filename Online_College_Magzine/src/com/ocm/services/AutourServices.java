package com.ocm.services;

import java.text.ParseException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.ocm.beans.Articles;
import com.ocm.dao.AuthorDAO;
import com.ocm.emails.EmailSender;

public class AutourServices {
	
	
	public boolean postArticle(Articles a) throws AddressException, MessagingException
	{
		
		AuthorDAO dao=new AuthorDAO();
		
		boolean status = false;
		try {
			status = dao.storeArticle(a);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(status==true)
		{
			
			

			   String subject ="Your Arcticle :   "+a.getTag()+" is Posted";
			   
			 String footerText="Aparna M<br> ";

			   String messageText ="Hello"+a.getPoster_id()+" Your  Article ->"+a.getTag()+" is Posted"+"<br> Please allow us for some time to review your post and accept<br>"+footerText;
			   
		  String to = dao.getAuthorEmail(a.getPoster_id());
			   
			   EmailSender.sendMail(to, messageText, subject);
		}
		
		
		return status;
	}

}
