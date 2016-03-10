package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminControl extends DBControl {

	public AdminControl() throws Exception {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 管理员登录验证
	 * @param adminName
	 * @param passowrd
	 * @return
	 * @throws SQLException 
	 */
	public boolean adminLogin(String adminName, String password) throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_administrator WHERE AdminAccount = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setString(1, adminName);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				String pwd = rs.getString("Password");
				if (pwd.equals(password)) 
				{
					retVal = true;
				}
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
		
		return retVal;
	}
	
	/**
	 * 网上报名系统登录开关
	 * @param state
	 * @return
	 * @throws SQLException 
	 */
	public boolean setLoginState(boolean state) throws SQLException {

		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String updateStatement = "UPDATE t_config SET loginButton=? WHERE Id=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setBoolean(1, state);
			prepStmt.setInt(2, 1);
			
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
	
	/**
	 * 网上报名系统注册开关
	 * @param state
	 * @return
	 * @throws SQLException 
	 */
	public boolean setRegistState(boolean state) throws SQLException {

		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String updateStatement = "UPDATE t_config SET registerButton=? WHERE Id=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setBoolean(1, state);
			prepStmt.setInt(2, 1);
			
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
	
	public boolean getLoginState() throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT loginButton FROM t_config WHERE Id = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, 1);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				retVal = rs.getBoolean("loginButton");
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
		
		return retVal;
		
	}
	
	public boolean getRegistState() throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT registerButton FROM t_config WHERE Id = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, 1);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				retVal = rs.getBoolean("registerButton");
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
		
		return retVal;
		
	}
	
	public static boolean getStateBoolean(String state) {
		
		if (state != null && state.equals("开")) return true;
		else return false;
		
	}
}
