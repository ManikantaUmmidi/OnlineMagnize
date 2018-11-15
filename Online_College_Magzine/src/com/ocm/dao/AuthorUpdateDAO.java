package com.ocm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kite.ocm.db.DBConnection;
import com.ocm.beans.Member_profile;

public class AuthorUpdateDAO {

	public boolean updateProfile(Member_profile a)
	{
		boolean flag=false;
		Connection con=DBConnection.getConnection();
		PreparedStatement ps=null;
		try
		{
			ps=con.prepareStatement("update member_profile set password=?,name=?,email=?,mobile=?,address=? where mem_login_id='"+a.getMem_login_id()+"'");
			ps.setString(1, a.getPasssword());
			ps.setString(2, a.getName());
			ps.setString(3, a.getEmail());
			ps.setString(4, a.getMobile());
			ps.setString(5, a.getAddress());
			int res=ps.executeUpdate();
			if(res==1)
			{
				flag=true;
			}
			con.close();
			ps.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		
		
		return flag;
	}

}
