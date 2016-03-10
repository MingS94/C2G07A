package test;

import java.sql.Connection;
import java.sql.SQLException;

import model.ConnectionPool;

public class TestDBConnction {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		ConnectionPool connPool = new ConnectionPool(
				"com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/11a_db?" 
				+ "useUnicode=true&characterEncoding=utf-8",
				"root", "123456");

		try {
			connPool.createPool();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		try {
			Connection conn = connPool.getConnection();
		} catch (SQLException ex1) {
			ex1.printStackTrace();
		}
	}

}
