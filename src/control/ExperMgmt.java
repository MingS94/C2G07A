package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import model.Expert;

public class ExperMgmt extends DBControl {
	
	public ExperMgmt() throws Exception {
		super();
	}

	/**
	 * 查询专家
	 * @param expertName
	 * @param certificateId
	 * @param majorIn
	 * @return
	 * @throws SQLException
	 */
	public LinkedList<Expert> queryExpertsInfo(String expertName, String certificateId, String majorIn) throws SQLException {
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		LinkedList<Expert> list = new LinkedList<Expert>();
		
		String queryStatement = "select * from t_expert where " +
				"ExpertName like ? and CertificateId like ? and MajorIn like ?";
			
		try{
			con = getConnection();
			prepStmt = con.prepareStatement(queryStatement);
			
			if (expertName != null) prepStmt.setString(1, expertName);
			else prepStmt.setString(1, "%");
			if (certificateId != null) prepStmt.setString(2, certificateId);
			else prepStmt.setString(2, "%");
			if (majorIn != null) prepStmt.setString(3, majorIn);
			else prepStmt.setString(3, "%");
			
			rs = prepStmt.executeQuery();
			while(rs.next())
			{
				Expert expert = new Expert();
				
				expert.setExpertID(rs.getInt("ExpertId"));
				expert.setExpertName(rs.getString("ExpertName"));
				expert.setCertificateID(rs.getString("CertificateId"));
				expert.setMajorIn(rs.getString("MajorIn"));
				expert.setMobilePhone(rs.getString("MobilePhone"));
				expert.setEmail(rs.getString("Email"));
				expert.setAddress(rs.getString("Address"));
				expert.setUsername(rs.getString("UserName"));
				expert.setPassword(rs.getString("Password"));
		        
		        list.add(expert);
			}
		}
		catch(SQLException e) {
			// TODO: handle exception
			//自动提交，不需要rollback
			throw e;
		}
		finally
		{
			closeResultSet(rs);
			closePrepStmt(prepStmt);	
			returnConnection(con);
		}
		return list;
	}
	
	public boolean deleteExpert(int expertId) throws SQLException
	{
		boolean retVal = false;
		
		Connection con = null;
	    PreparedStatement prepStmt = null;
	    String deleteStatement = "delete from t_expert where ExpertId = ?";
	    try{
	    	con = getConnection();
	    	prepStmt = con.prepareStatement(deleteStatement);
	    	prepStmt.setInt(1, expertId);
	    	int result = prepStmt.executeUpdate();
			if (result > 0) 
			{
				retVal = true;
			}
	    }
	    catch (SQLException e) {
			// TODO: handle exception
			//自动提交，不需要rollback
			throw e;
		}
	    finally
		{
			closePrepStmt(prepStmt);
			returnConnection(con);
		}
	    
	    return retVal;
	}
	
	public boolean insertExpert(Expert expert) throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String insertStatement = "INSERT INTO t_expert (ExpertName,CertificateId,MajorIn,MobilePhone,Email,Address,UserName,Password)" +
				" VALUES(?,?,?,?,?,?,?,?)";
		
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(insertStatement);
			prepStmt.setString(1, expert.getExpertName());
			prepStmt.setString(2, expert.getCertificateID());
			prepStmt.setString(3, expert.getMajorIn());
			prepStmt.setString(4, expert.getMobilePhone());
			prepStmt.setString(5, expert.getEmail());
			prepStmt.setString(6, expert.getAddress());
			prepStmt.setString(7, expert.getUsername());
			prepStmt.setString(8, expert.getPassword());
			int result = prepStmt.executeUpdate();
		
			if (result > 0) 
			{
				retVal = true;
			}
		}
		catch (SQLException e) {
			// TODO: handle exception
			//自动提交，不需要rollback
			throw e;
		}
		finally
		{
			closePrepStmt(prepStmt);
			returnConnection(con);
		}
		
		return retVal;
	}
	
	public int getExpertIdByName(String expertName) throws SQLException {
		
		int expertId = -1;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT ExpertId FROM t_expert WHERE ExpertName = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setString(1, expertName);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				expertId = rs.getInt("ExpertId");
			}
		}
		catch (SQLException e) 
		{
			// TODO: handle exception
			throw e;
		}
		finally
		{
			closeResultSet(rs);
			closePrepStmt(prepStmt);
			returnConnection(con);
		}
		
		return expertId;
			
	}
	
	public Expert getExpertById(int expertId) throws SQLException {
		Expert expert = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_expert WHERE ExpertId = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, expertId);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				expert = new Expert();
				
				expert.setExpertID(rs.getInt("ExpertId"));
				expert.setExpertName(rs.getString("ExpertName"));
				expert.setCertificateID(rs.getString("CertificateId"));
				expert.setMajorIn(rs.getString("MajorIn"));
				expert.setMobilePhone(rs.getString("MobilePhone"));
				expert.setAddress(rs.getString("Address"));
				expert.setEmail(rs.getString("Email"));
				expert.setUsername(rs.getString("UserName"));
				expert.setPassword(rs.getString("Password"));
					
			}
		}
		catch (SQLException e) 
		{
			// TODO: handle exception
			throw e;
		}
		finally
		{
			closeResultSet(rs);
			closePrepStmt(prepStmt);
			returnConnection(con);
		}
		
		return expert;
	}
	
	
}
