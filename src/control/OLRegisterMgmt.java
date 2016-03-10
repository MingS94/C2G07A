package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Random;

import model.Exam;
//import model.Expert;
import model.Room;
import model.Score;
import model.StudentInfo;
import model.StudentInfo.Category;

/**
 * @author ZhangXinqian
 * 网上报名管理类，继承自DBControl类
 */
public class OLRegisterMgmt extends DBControl {
	
	private Random random;
	
	public OLRegisterMgmt() throws Exception {
		super();
		random = new Random();
	}
	
	//获得身份证后六位
	public static String cut6IdCardNumber(String idCardNumber) {
		String tailNumberString = idCardNumber;	
		int len = idCardNumber.length();
		if (len >= 6)
		{
			tailNumberString = idCardNumber.substring(len-6);
		}		
		return tailNumberString;
	}
	
	/**
	 * 验证考生身份，需要输入正确的高考报名号和身份证号。若审核成功，根据报考的考试类别，返回一个随机报名号。
	 * @param examPermitNumber
	 * @param IDCardNumber
	 * @param category
	 * @return 报名号
	 * @throws SQLException
	 */
	public String verifyIdentity(String examPermitNumber/*高考报名号*/, String IDCardNumber/*身份证号码*/, Category category/*报考考试类别*/) throws SQLException {
		
		//身份验证成功，随机生成一个自主招生报名号，格式：考试类别+随机6位数字+身份证号码后6位
		if (examPermitNumber != null && !examPermitNumber.equals("")) //通过查询高考数据库来验证，这里暂时假设考生身份均正确 
		{
			Connection con = null;
			PreparedStatement prepStmt = null;
			ResultSet rs = null;
			
			String selectStatment = "SELECT DISTINCT RegistrationNumber FROM t_student_info WHERE RegistrationNumber=?";
			String registrationNumber = null;//随机生成的报名号
			
			try
			{
				con = getConnection();
				prepStmt = con.prepareStatement(selectStatment);
				prepStmt.setString(1, registrationNumber);
				
				do
				{
					//随机生成报名号
					int num = random.nextInt(900000) + 100000;
					registrationNumber = "";
					switch (category) 
					{
					case Recommended:
						registrationNumber += "A";
						break;
					case Art:
						registrationNumber += "B";
						break;
					case Athlete:
						registrationNumber += "C";
						break;
					case Transfer:
						registrationNumber += "D";
						break;
					case Music:
						registrationNumber += "E";
						break;
					case FineArt:
						registrationNumber += "F";
						break;
					case Broadcasting:
						registrationNumber += "G";
						break;
					default:
						break;
					}
					registrationNumber = registrationNumber + Integer.toString(num) + cut6IdCardNumber(IDCardNumber);
					
					//检测生成的报名号是否和已有的重复
					closeResultSet(rs);
					rs = prepStmt.executeQuery();
					
				} while (rs.next());
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
			
			return registrationNumber;
		}
		
		return null;
	}
	
	/**
	 * 注册报名号
	 * @param registrationNumber
	 * @param password
	 * @param againPwd
	 * @return 注册是否成功
	 * @throws SQLException
	 */
	public boolean register(String registrationNumber/*随机生成的报名号*/, String password, String againPwd) throws SQLException {

		boolean resVal = false;
		
		if (password.equals(againPwd))
		{
			Connection con = null;
			PreparedStatement prepStmt = null;
			String insertStatement = "INSERT INTO t_student_info (RegistrationNumber,Password,State) VALUES(?,?,?)";
			try
			{
				con = getConnection();
				
				prepStmt = con.prepareStatement(insertStatement);
				prepStmt.setString(1, registrationNumber);
				prepStmt.setString(2, password);
				prepStmt.setBoolean(3, false);
				
				int result = prepStmt.executeUpdate();
				if (result > 0) 
				{
					resVal = true;
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
		}
		
		return resVal;
	}
	
	/**
	 * 登录
	 * @param registrationNumber
	 * @param password
	 * @return 登录成功返回学生信息，否则返回null
	 * @throws SQLException
	 */
	public StudentInfo login(String registrationNumber/*随机生成的报名号*/, String password) throws SQLException {
		
		StudentInfo info = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT DISTINCT * FROM t_student_info WHERE RegistrationNumber = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setString(1, registrationNumber);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				String pw = rs.getString("Password");
				if (pw.equals(password)) 
				{
					info = new StudentInfo();
					
					info.setRegistrationNumber(registrationNumber);
					info.setPassword(password);
					
					info.setStudentId(rs.getInt("StudentId"));
					info.setStudentName(rs.getString("StudentName"));
					info.setGender(StudentInfo.getGender(rs.getString("Gender")));
					info.setAge(rs.getInt("Age"));
					info.setIdCardNumber(rs.getString("IdCard"));
					info.setExamPermitNumber(rs.getString("ExamPermitNumber"));
					info.setCategory(StudentInfo.getCategory(rs.getString("Category")));
					info.setPhoneNumber(rs.getString("PhoneNum"));
					info.setProvince(rs.getString("Province"));
					info.setRegion(rs.getString("Region"));
					info.setGraduateSchool(rs.getString("GraduateSchool"));
					info.setAddress(rs.getString("Address"));
					info.setE_mail(rs.getString("Email"));
					info.setState(rs.getBoolean("State"));
					info.setLocation(rs.getString("Location"));
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
		
		return info;
	}
	/**
	 * 注销登录
	 * @return 注销是否成功
	 */
	public boolean logout() {
		/*
		 * 具体操作待定
		 */
		return true;
	}
	
	/**
	 * 报名：确认报名信息
	 * @param info
	 * @return 报名是否成功
	 * @throws SQLException
	 */
	public boolean confirmStudentInfo(StudentInfo info) throws SQLException {
		
		boolean resVal = false;
		if (!info.isState())
		{
			/*
			 * 提交报名操作，保存报名信息后可以修改，但是一旦确认提交后就不能修改了
			 */
			info.setState(true);
			resVal = updateStudentInfo(info);
		}
		
		return resVal;
		
	}
	
	/**
	 * 填写、修改并保存报名信息
	 * @param info
	 * @return 修改是否成功
	 * @throws SQLException
	 */
	public boolean updateStudentInfo(StudentInfo info) throws SQLException {
		
		boolean resVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		
		String updateStatment = "UPDATE t_student_info SET State=?,StudentName=?,Gender=?,Age=?,IdCard=?,ExamPermitNumber=?,Category=?,PhoneNum=?,Province=?,Region=?,GraduateSchool=?,Address=?,Email=?,Location=? WHERE RegistrationNumber=?";
		
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(updateStatment);
			prepStmt.setBoolean(1, info.isState());
			prepStmt.setString(2, info.getStudentName());
			prepStmt.setString(3, StudentInfo.getGenderString(info.getGender()));
			prepStmt.setInt(4, info.getAge());
			prepStmt.setString(5, info.getIdCardNumber());
			prepStmt.setString(6, info.getExamPermitNumber());
			prepStmt.setString(7, StudentInfo.getCategoryString(info.getCategory()));
			prepStmt.setString(8, info.getPhoneNumber());
			prepStmt.setString(9, info.getProvince());
			prepStmt.setString(10, info.getRegion());
			prepStmt.setString(11, info.getGraduateSchool());
			prepStmt.setString(12, info.getAddress());
			prepStmt.setString(13, info.getE_mail());
			prepStmt.setString(14, info.getLocation());
			
			prepStmt.setString(15, info.getRegistrationNumber());
			
			int result = prepStmt.executeUpdate();
			if (result > 0)
			{
				resVal = true;
			}
		}
		catch (SQLException e)
		{
			// TODO: handle exception
			throw e;
		}
		finally
		{
			closePrepStmt(prepStmt);
			returnConnection(con);
		}
		
		return resVal;
		
	}
	
	/**
	 * 修改密码
	 * @param registrationNumber
	 * @param password
	 * @param againPwd
	 * @return 修改密码是否成功
	 * @throws SQLException
	 */
	public boolean changePassword(String registrationNumber, String password, String againPwd) throws SQLException {
		
		boolean resVal = false;
		
		if (password.equals(againPwd))
		{
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
					resVal = true;
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
		}
		
		return resVal;
		
	}
	
	/**
	 * 查看考场和考试
	 * @param info 学生信息
	 * @return 考试列表
	 * @throws SQLException
	 */
	public LinkedList<Exam> checkExam(StudentInfo info) throws SQLException {
		
		LinkedList<Exam> examsList = new LinkedList<Exam>();

		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		PreparedStatement prepStmt2 = null;
		ResultSet rs2 = null;
		PreparedStatement prepStmt3 = null;
		ResultSet rs3 = null;
		
		String selectStatement = "SELECT DISTINCT ExamId FROM t_score WHERE StudentId=?";
		String selectStatement2 = "SELECT * FROM t_exam WHERE ExamId=?";
		String selectStatement3 = "SELECT * FROM t_room_info WHERE RoomId=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setInt(1, info.getStudentId());
			
			rs = prepStmt.executeQuery();
			//一个考生可以对应多场考试
			while (rs.next()) 
			{
				prepStmt2 = con.prepareStatement(selectStatement2);
				prepStmt2.setInt(1, rs.getInt("ExamId"));
				
				rs2 = prepStmt2.executeQuery();
				
				//一场考试（不是一个科目的考试）只对应一个教室
				if (rs2.next())
				{
					prepStmt3 = con.prepareStatement(selectStatement3);
					prepStmt3.setInt(1, rs2.getInt("RoomId"));
					
					rs3 = prepStmt3.executeQuery();
					
					//一个教室id对应一个教室信息
					if (rs3.next())
					{
						Exam examTemp = new Exam();
						examTemp.setExamId(rs2.getInt("ExamId"));
						examTemp.setSubjectName(rs2.getString("Subject"));
						examTemp.setCategory(StudentInfo.getCategory(rs2.getString("Category")));
						examTemp.setDatetime(rs2.getTimestamp("Time"));
						
						Room roomTemp = new Room();
						roomTemp.setRoomId(rs3.getInt("RoomId"));
						roomTemp.setLocation(rs3.getString("Location"));
						roomTemp.setRoomName(rs3.getString("RoomName"));
						roomTemp.setRoomCapacity(rs3.getInt("RoomPermitNum"));
						
						examTemp.setRoom(roomTemp);
						
						examsList.add(examTemp);
						
						closeResultSet(rs3);
						closePrepStmt(prepStmt3);
					}
				}
				closeResultSet(rs2);
				closePrepStmt(prepStmt2);
			}
		}
		catch (SQLException e) {
			// TODO: handle exception
			//自动提交，不需要rollback
			throw e;
		}
		finally
		{
			closeResultSet(rs);
			closeResultSet(rs2);
			closeResultSet(rs3);
			
			closePrepStmt(prepStmt);
			closePrepStmt(prepStmt2);
			closePrepStmt(prepStmt3);
			
			returnConnection(con);
		}
		
		return examsList;
		
	}
	
	/**
	 * 查询成绩
	 * @param info 学生信息
	 * @return 学生成绩列表
	 */
	public LinkedList<Score> checkScore(StudentInfo info) throws SQLException {
		
		LinkedList<Score> scoreList = new LinkedList<Score>();
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
//		PreparedStatement prepStmt2 = null;
//		ResultSet rs2 = null;
		
		String selectStatement = "SELECT * FROM t_score WHERE StudentId=?";
//		String selectStatement2 = "SELECT * FROM t_expert WHERE ExpertId=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setInt(1, info.getStudentId());
			
			rs = prepStmt.executeQuery();
			//一个考生可以对应多场考试的成绩
			while (rs.next()) 
			{
//				prepStmt2 = con.prepareStatement(selectStatement2);
//				prepStmt2.setInt(1, rs.getInt("ExpertId"));
//				
//				rs2 = prepStmt2.executeQuery();
				
				//一个成绩是一个专家打的分，最终还要计算出这门科目的总分
//				if (rs2.next())
//				{
					Score tempScore = new Score();
					tempScore.setStudentInfo(info);
					tempScore.setScoreId(rs.getInt("ScoreId"));
					tempScore.setSubjectName(rs.getString("Subject"));
					tempScore.setFistPoint(rs.getDouble("FirstPoint"));
					tempScore.setFinalPoint(rs.getDouble("FinalPoint"));
					
					tempScore.setExpert(null);
					
					scoreList.add(tempScore);
					
//					Expert tempExpert = new Expert();
					
					
//				}
//				closeResultSet(rs2);
//				closePrepStmt(prepStmt2);
			}
		}
		catch (SQLException e) {
			// TODO: handle exception
			//自动提交，不需要rollback
			throw e;
		}
		finally
		{
			closeResultSet(rs);
//			closeResultSet(rs2);
			
			closePrepStmt(prepStmt);
//			closePrepStmt(prepStmt2);
			
			returnConnection(con);
		}
		
		return scoreList;
		
	}
}
