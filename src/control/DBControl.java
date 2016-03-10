package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ConnectionPool;

public class DBControl {
	
	protected static ConnectionPool connectionPool = null;
	
	public DBControl() throws Exception {
		if (connectionPool == null)
		{
			connectionPool = new ConnectionPool("com.mysql.jdbc.Driver", 
					"jdbc:mysql://localhost:3306/11a_db?" + "useUnicode=true&characterEncoding=utf-8", 
					"root", "123321"); 
			connectionPool.createPool();
		}
	}
	
	public ConnectionPool getConnectionPool() {
		return connectionPool;
	}
	
	public Connection getConnection() throws SQLException {
		return connectionPool.getConnection();
	}
	
	public void closePrepStmt(PreparedStatement prepStmt) throws SQLException
	{
		if (prepStmt!=null)
		{	
			prepStmt.close();
			prepStmt = null;
		}
	}
	
	public void closeResultSet(ResultSet rs) throws SQLException {
		if (rs!=null) 
		{
			rs.close();
			rs = null;
		}
	}
	
	public void returnConnection(Connection conn) {
		connectionPool.returnConnection(conn);
	}
}
