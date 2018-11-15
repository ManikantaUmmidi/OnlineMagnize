package com.ocm.dao;

import java.sql.Connection;
import java.sql.Statement;

import com.kite.ocm.db.DBConnection;

public class ArticleUpdateDAO {
	
	public boolean articleDelete(int aid)
	{
		boolean flag=false;
		Connection con=DBConnection.getConnection();
		try
		{
		 Statement s=con.createStatement();
		   s=con.createStatement();
	       int a=s.executeUpdate("delete from articles_status where article_id="+aid+"");
	       int rs=s.executeUpdate("delete from articles where article_id="+aid+"");

		   if(a==1 && rs==1)
			{  
			   flag=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean updateArticle(String art,int artid)
	{
		boolean flag=false;
		Connection con=DBConnection.getConnection();
		try
		{
		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();
		con.setAutoCommit (false);
		int i=stmt.executeUpdate("update articles set article='"+art+"' where article_id='"+artid+"'");
		int j=stmt1.executeUpdate("update articles_status set date_of_post=sysdate,status='submitted' where article_id='"+artid+"'");

	  if(i==1 && j==1)
		{
		  flag=true;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
}
