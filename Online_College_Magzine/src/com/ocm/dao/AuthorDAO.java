package com.ocm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;
import com.kite.ocm.db.DBConnection;
import com.kite.ocm.db.DBUtilities;
import com.ocm.beans.Articles;

public class AuthorDAO {
	
	
	public String getAuthorEmail(String authorid)
	{
		
		String email=null;
		
		
		Connection con=DBConnection.getConnection();
		
		Statement st=null;
		
		try
		{
			st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select email from MEMBER_PROFILE where MEM_LOGIN_ID='"+authorid+"'");
			
			if(rs.next())
			{
			email=rs.getString(1);	
			}
			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return email;
	}
	
	
	
	
	public boolean storeArticle(Articles a) throws ParseException
	{
		boolean flag=false;
		Date d1=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		Date d2=new SimpleDateFormat("dd-MM-yyyy").parse(sdf.format(d1));
		Connection conn=DBConnection.getConnection();
		
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		
		try
		{
			
			
			ps=conn.prepareStatement("insert into articles values(?,?,?,?,?,?)");
			
			ps.setInt(1, a.getArticle_id());
			ps.setString(2, a.getCategory());
			ps.setString(3, a.getTag());
			ps.setString(4, a.getArticle());
			
			ps.setString(5, a.getPoster_id());
			ps.setString(6, a.getStatus());
			
			int res=ps.executeUpdate();
			ps1=conn.prepareStatement("insert into articles_status values(?,?,?,?,?,?,?)");
			ps1.setInt(1, a.getArticle_id());
			java.sql.Date d=new java.sql.Date(d2.getTime());
			ps1.setDate(2,d);
			ps1.setInt(3, '0');
			ps1.setInt(4,'0');
			ps1.setString(5, "rejected");
			ps1.setString(6, " ");
			ps1.setString(7, " ");
			
			int res1=ps1.executeUpdate();
			
			
			if(res==1 && res1==1)
			{
				flag=true;
			}
		}
		catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return flag;
	}

}
