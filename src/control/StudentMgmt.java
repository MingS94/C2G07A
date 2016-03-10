package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import model.StudentInfo;
import model.StudentInfo.Category;

public class StudentMgmt extends DBControl {
	public StudentMgmt() throws Exception {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/*
	 * 查询学生信息
	 */
	public LinkedList<StudentInfo> queryStudentInfo(String registrationNumber, 
			String studentName, String idCard, Category category, String province, 
			String region, String graduateSchool, Boolean state) throws SQLException {
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		LinkedList<StudentInfo> list = new LinkedList<StudentInfo>();
		
		String queryStatement = null;
		
		if (state != null)
		{
			queryStatement = "select * from t_student_info where " +
				"RegistrationNumber like ? and StudentName like ? and IdCard like ? and Category like ? " +
				"and Province like ? and Region like ? and GraduateSchool like ? and State = ?"; 
		}
		else
		{
			queryStatement = "select * from t_student_info where " +
					"RegistrationNumber like ? and StudentName like ? and IdCard like ? and Category like ? " +
					"and Province like ? and Region like ? and GraduateSchool like ?"; 
		}
			
		try{
			con = getConnection();
			prepStmt = con.prepareStatement(queryStatement);
			
			if (registrationNumber != null) prepStmt.setString(1, registrationNumber);
			else prepStmt.setString(1, "%");
			if (studentName != null) prepStmt.setString(2, studentName);
			else prepStmt.setString(2, "%");
			if (idCard != null) prepStmt.setString(3, idCard);
			else prepStmt.setString(3, "%");
			if (category != null) prepStmt.setString(4, StudentInfo.getCategoryString(category));
			else prepStmt.setString(4, "%");
			if (province != null) prepStmt.setString(5, province);
			else prepStmt.setString(5, "%");
			if (region != null) prepStmt.setString(6, region);
			else prepStmt.setString(6, "%");
			if (graduateSchool != null) prepStmt.setString(7, graduateSchool);
			else prepStmt.setString(7, "%");
			
			if (state != null) prepStmt.setBoolean(8, state);
			
			rs = prepStmt.executeQuery();
			while(rs.next())
			{
				StudentInfo s = new StudentInfo();
				
				s.setStudentId(rs.getInt("StudentId"));
				s.setState(rs.getBoolean("state"));
				s.setStudentName(rs.getString("StudentName"));
				s.setGender(StudentInfo.getGender(rs.getString("Gender")));
				s.setIdCardNumber(rs.getString("IdCard"));
				s.setAge(rs.getInt("Age"));
				s.setRegistrationNumber(rs.getString("RegistrationNumber"));
				s.setExamPermitNumber(rs.getString("ExamPermitNumber"));
				s.setCategory(StudentInfo.getCategory(rs.getString("Category")));
				s.setProvince(rs.getString("Province"));
				s.setRegion(rs.getString("Region"));
		        s.setGraduateSchool(rs.getString("GraduateSchool"));
		        s.setAddress(rs.getString("Address"));
		        s.setE_mail(rs.getString("Email"));
		        s.setPhoneNumber(rs.getString("PhoneNum"));
		        s.setPassword(rs.getString("Password"));
		        s.setLocation(rs.getString("Location"));
		        
		        list.add(s);
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
	
	public boolean deleteStudentInfo(String RegistrationNumber) throws SQLException
	{
		boolean retVal = false;
		
		Connection con = null;
	    PreparedStatement prepStmt = null;
	    String deleteStatement = "delete from t_student_info where RegistrationNumber = ?";
	    try{
	    	con = getConnection();
	    	prepStmt = con.prepareStatement(deleteStatement);
	    	prepStmt.setString(1, RegistrationNumber);
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
	
	public int insertStudentInfo(StudentInfo s) throws SQLException{
        int retVal = 0;
		Connection con = null;
		PreparedStatement prepStmt = null;
		PreparedStatement prepStmt2 = null;
		ResultSet rs = null;
		String insertStatement = "INSERT INTO t_student_info (IdCard,StudentName,PhoneNum"
				+ ",Category,Gender,Age,ExamPermitNumber,RegistrationNumber,"
				+ "Password,State,Email,Address,Province,Region,GraduateSchool,Location) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String selectStatement = "SELECT StudentId FROM t_Student_info WHERE RegistrationNumber=?";
		
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(insertStatement);
			prepStmt.setString(1, s.getIdCardNumber());
			prepStmt.setString(2, s.getStudentName());
			prepStmt.setString(3, s.getPhoneNumber());
			prepStmt.setString(4, StudentInfo.getCategoryString(s.getCategory()));
			prepStmt.setString(5, StudentInfo.getGenderString(s.getGender()));
			prepStmt.setInt(6, s.getAge());
			prepStmt.setString(7, s.getExamPermitNumber());
			prepStmt.setString(8, s.getRegistrationNumber());
			prepStmt.setString(9, s.getPassword());
			prepStmt.setBoolean(10, s.isState());
			prepStmt.setString(11, s.getE_mail());
			prepStmt.setString(12, s.getAddress());
			prepStmt.setString(13, s.getProvince());
			prepStmt.setString(14, s.getRegion());
			prepStmt.setString(15, s.getGraduateSchool());
			prepStmt.setString(16, s.getLocation());
			int result = prepStmt.executeUpdate();
			
			prepStmt2 = con.prepareStatement(selectStatement);
			prepStmt2.setString(1, s.getRegistrationNumber());			
			rs = prepStmt2.executeQuery();
						
			if (result > 0 && rs.next()) 
			{
				retVal = rs.getInt("StudentId");
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
			closePrepStmt(prepStmt2);
			returnConnection(con);
		}
		
		return retVal;
		
	}
	
	public StudentInfo getStudentInfoById(int studentId) throws SQLException {
		
		StudentInfo s = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_student_info WHERE StudentId = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, studentId);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				s = new StudentInfo();
				
				s.setStudentId(rs.getInt("StudentId"));
				s.setState(rs.getBoolean("state"));
				s.setStudentName(rs.getString("StudentName"));
				s.setGender(StudentInfo.getGender(rs.getString("Gender")));
				s.setIdCardNumber(rs.getString("IdCard"));
				s.setAge(rs.getInt("Age"));
				s.setRegistrationNumber(rs.getString("RegistrationNumber"));
				s.setExamPermitNumber(rs.getString("ExamPermitNumber"));
				s.setCategory(StudentInfo.getCategory(rs.getString("Category")));
				s.setProvince(rs.getString("Province"));
				s.setRegion(rs.getString("Region"));
		        s.setGraduateSchool(rs.getString("GraduateSchool"));
		        s.setAddress(rs.getString("Address"));
		        s.setE_mail(rs.getString("Email"));
		        s.setPhoneNumber(rs.getString("PhoneNum"));
		        s.setPassword(rs.getString("Password"));
		        s.setLocation(rs.getString("Location"));
					
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
		
		return s;
	}
	
	public StudentInfo getStudentInfoByRegistrationNumber(String registrationNumber) throws SQLException {
		
		StudentInfo s = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_student_info WHERE RegistrationNumber = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setString(1, registrationNumber);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				s = new StudentInfo();
				
				s.setStudentId(rs.getInt("StudentId"));
				s.setState(rs.getBoolean("state"));
				s.setStudentName(rs.getString("StudentName"));
				s.setGender(StudentInfo.getGender(rs.getString("Gender")));
				s.setIdCardNumber(rs.getString("IdCard"));
				s.setAge(rs.getInt("Age"));
				s.setRegistrationNumber(rs.getString("RegistrationNumber"));
				s.setExamPermitNumber(rs.getString("ExamPermitNumber"));
				s.setCategory(StudentInfo.getCategory(rs.getString("Category")));
				s.setProvince(rs.getString("Province"));
				s.setRegion(rs.getString("Region"));
		        s.setGraduateSchool(rs.getString("GraduateSchool"));
		        s.setAddress(rs.getString("Address"));
		        s.setE_mail(rs.getString("Email"));
		        s.setPhoneNumber(rs.getString("PhoneNum"));
		        s.setPassword(rs.getString("Password"));
		        s.setLocation(rs.getString("Location"));
					
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
		
		return s;
	}
	
	public boolean updatePassword(String registrationNumber, String password) throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String updateStatement = "UPDATE t_student_info SET Password=? WHERE RegistrationNumber=?";
		try
		{
			con = getConnection();		
			prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setString(1, password);
			prepStmt.setString(2, registrationNumber);
			
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
}
