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
 * ���ϱ��������࣬�̳���DBControl��
 */
public class OLRegisterMgmt extends DBControl {
	
	private Random random;
	
	public OLRegisterMgmt() throws Exception {
		super();
		random = new Random();
	}
	
	//������֤����λ
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
	 * ��֤������ݣ���Ҫ������ȷ�ĸ߿������ź����֤�š�����˳ɹ������ݱ����Ŀ�����𣬷���һ����������š�
	 * @param examPermitNumber
	 * @param IDCardNumber
	 * @param category
	 * @return ������
	 * @throws SQLException
	 */
	public String verifyIdentity(String examPermitNumber/*�߿�������*/, String IDCardNumber/*���֤����*/, Category category/*�����������*/) throws SQLException {
		
		//�����֤�ɹ����������һ���������������ţ���ʽ���������+���6λ����+���֤�����6λ
		if (examPermitNumber != null && !examPermitNumber.equals("")) //ͨ����ѯ�߿����ݿ�����֤��������ʱ���迼����ݾ���ȷ 
		{
			Connection con = null;
			PreparedStatement prepStmt = null;
			ResultSet rs = null;
			
			String selectStatment = "SELECT DISTINCT RegistrationNumber FROM t_student_info WHERE RegistrationNumber=?";
			String registrationNumber = null;//������ɵı�����
			
			try
			{
				con = getConnection();
				prepStmt = con.prepareStatement(selectStatment);
				prepStmt.setString(1, registrationNumber);
				
				do
				{
					//������ɱ�����
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
					
					//������ɵı������Ƿ�����е��ظ�
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
	 * ע�ᱨ����
	 * @param registrationNumber
	 * @param password
	 * @param againPwd
	 * @return ע���Ƿ�ɹ�
	 * @throws SQLException
	 */
	public boolean register(String registrationNumber/*������ɵı�����*/, String password, String againPwd) throws SQLException {

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
				//�Զ��ύ������Ҫrollback
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
	 * ��¼
	 * @param registrationNumber
	 * @param password
	 * @return ��¼�ɹ�����ѧ����Ϣ�����򷵻�null
	 * @throws SQLException
	 */
	public StudentInfo login(String registrationNumber/*������ɵı�����*/, String password) throws SQLException {
		
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
	 * ע����¼
	 * @return ע���Ƿ�ɹ�
	 */
	public boolean logout() {
		/*
		 * �����������
		 */
		return true;
	}
	
	/**
	 * ������ȷ�ϱ�����Ϣ
	 * @param info
	 * @return �����Ƿ�ɹ�
	 * @throws SQLException
	 */
	public boolean confirmStudentInfo(StudentInfo info) throws SQLException {
		
		boolean resVal = false;
		if (!info.isState())
		{
			/*
			 * �ύ�������������汨����Ϣ������޸ģ�����һ��ȷ���ύ��Ͳ����޸���
			 */
			info.setState(true);
			resVal = updateStudentInfo(info);
		}
		
		return resVal;
		
	}
	
	/**
	 * ��д���޸Ĳ����汨����Ϣ
	 * @param info
	 * @return �޸��Ƿ�ɹ�
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
	 * �޸�����
	 * @param registrationNumber
	 * @param password
	 * @param againPwd
	 * @return �޸������Ƿ�ɹ�
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
				//�Զ��ύ������Ҫrollback
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
	 * �鿴�����Ϳ���
	 * @param info ѧ����Ϣ
	 * @return �����б�
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
			//һ���������Զ�Ӧ�ೡ����
			while (rs.next()) 
			{
				prepStmt2 = con.prepareStatement(selectStatement2);
				prepStmt2.setInt(1, rs.getInt("ExamId"));
				
				rs2 = prepStmt2.executeQuery();
				
				//һ�����ԣ�����һ����Ŀ�Ŀ��ԣ�ֻ��Ӧһ������
				if (rs2.next())
				{
					prepStmt3 = con.prepareStatement(selectStatement3);
					prepStmt3.setInt(1, rs2.getInt("RoomId"));
					
					rs3 = prepStmt3.executeQuery();
					
					//һ������id��Ӧһ��������Ϣ
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
			//�Զ��ύ������Ҫrollback
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
	 * ��ѯ�ɼ�
	 * @param info ѧ����Ϣ
	 * @return ѧ���ɼ��б�
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
			//һ���������Զ�Ӧ�ೡ���Եĳɼ�
			while (rs.next()) 
			{
//				prepStmt2 = con.prepareStatement(selectStatement2);
//				prepStmt2.setInt(1, rs.getInt("ExpertId"));
//				
//				rs2 = prepStmt2.executeQuery();
				
				//һ���ɼ���һ��ר�Ҵ�ķ֣����ջ�Ҫ��������ſ�Ŀ���ܷ�
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
			//�Զ��ύ������Ҫrollback
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
