package com.ocm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kite.ocm.db.DBConnection;
import com.ocm.beans.Moderator_profile;

public class ReviewerUpdateDAO {
	
	public boolean updateReviewerDetails(Moderator_profile mp)
	{
		boolean flag=false;
		Connection con=DBConnection.getConnection();
		PreparedStatement ps;
		try
		{
			ps=con.prepareStatement("update moderator_profile set mod_login_id=?,   password=?,name=?,email=?,mobile=? where mod_login_id='"+mp.getMod_login_id()+"'");
			ps.setString(1,mp.getMod_login_id());
			ps.setString(2,mp.getPasssword());
			ps.setString(3,mp.getName());
			ps.setString(4,mp.getEmail());
			ps.setString(5,mp.getMobile());
			int i=ps.executeUpdate();
			if(i==1)
			{
				flag=true;
			}
			ps.close();
			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return flag;
	}

}
