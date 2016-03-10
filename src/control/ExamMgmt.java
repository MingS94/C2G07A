package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import model.Exam;
import model.Room;
import model.StudentInfo;

/**
 * 
 * @author ZhangXinqian
 * ��̨�������Թ�����������
 */
public class ExamMgmt extends DBControl {

	public ExamMgmt() throws Exception {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * ����һ�������һ������
	 * @param room
	 * @return �ɹ����뷵�ؽ��ҵ�RoomId�����򷵻�0
	 * @throws SQLException
	 */
	public int insertAnRoom(Room room) throws SQLException {
		
		int retVal = 0;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		PreparedStatement prepStmt2 = null;
		ResultSet rs = null;
		String insertStatement = "INSERT INTO t_room_info (Location,RoomName,RoomPermitNum) VALUES(?,?,?)";
		String selectStatementString = "SELECT RoomId FROM t_room_info WHERE RoomName = ?";
		
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(insertStatement);
			prepStmt.setString(1, room.getLocation());
			prepStmt.setString(2, room.getRoomName());
			prepStmt.setInt(3, room.getRoomCapacity());
			int result = prepStmt.executeUpdate();
			
			prepStmt2 = con.prepareStatement(selectStatementString);
			prepStmt2.setString(1, room.getRoomName());
			rs = prepStmt2.executeQuery();
			
			if (result > 0 && rs.next()) 
			{
				retVal = rs.getInt("RoomId");
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
			closePrepStmt(prepStmt);
			closePrepStmt(prepStmt2);
			returnConnection(con);
		}
		
		return retVal;
	}
	
	/**
	 * �޸Ľ�����Ϣ
	 * @param room
	 * @return
	 * @throws SQLException
	 */
	public boolean updateAnRoom(Room room) throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String updateStatement = "UPDATE t_room_info SET Location=?, RoomPermitNum=?, RoomName=? WHERE RoomId=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setString(1, room.getLocation());
			prepStmt.setInt(2, room.getRoomCapacity());
			prepStmt.setString(3, room.getRoomName());
			prepStmt.setInt(4, room.getRoomId());
			
			int result = prepStmt.executeUpdate();
			if (result > 0) 
			{
				retVal = true;
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
		
		return retVal;
		
	}
	
	/**
	 * ɾ��һ�����ң�ͬʱɾ�����ҹ����Ŀ���
	 * @param room
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteAnRoom(Room room) throws SQLException{
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String deleteStatement = "DELETE t_room_info,t_exam FROM " +
				"t_room_info LEFT JOIN t_exam ON t_room_info.RoomId=t_exam.RoomId " +
				"WHERE t_room_info.RoomId=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(deleteStatement);
			prepStmt.setInt(1, room.getRoomId());
			
			int result = prepStmt.executeUpdate();
			if (result > 0) 
			{
				retVal = true;
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
		
		return retVal;
		
	}
	
	/**
	 * ��ȡ������Ϣ�б�
	 * @return ������Ϣ�б�
	 */
	public LinkedList<Room> getRooms() throws SQLException {
		
		LinkedList<Room> roomsList = new LinkedList<Room>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_room_info";
		
		try 
		{
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectStatment);
			
			while (rs.next())
			{
				Room room = new Room();
				
				room.setRoomId(rs.getInt("RoomId"));
				room.setLocation(rs.getString("Location"));
				room.setRoomName(rs.getString("RoomName"));
				room.setRoomCapacity(rs.getInt("RoomPermitNum"));	
				
				roomsList.add(room);
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
			returnConnection(con);
		}
		
		return roomsList;
		
	}
	
	/**
	 * ͨ�����ҵ����ֺͿ���õ�������Ϣ
	 * @param roomName
	 * @param location
	 * @return
	 * @throws SQLException 
	 */
	public Room getAnRoom(String roomName, String location) throws SQLException {
		
		Room room = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_room_info WHERE RoomName = ? AND Location = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setString(1, roomName);
			prepStmt.setString(2, location);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				room = new Room();
				
				room.setRoomId(rs.getInt("RoomId"));
				room.setLocation(rs.getString("Location"));
				room.setRoomName(rs.getString("RoomName"));
				room.setRoomCapacity(rs.getInt("RoomPermitNum"));	
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
		
		return room;
		
	}
	
	/**
	 * ͨ�����ҵ����ֵõ�������Ϣ
	 * @param RoomName
	 * @return �����Ҵ��ڷ��ؽ�����Ϣ�����򷵻�null
	 * @throws SQLException
	 */
	public Room getAnRoomByName(String roomName) throws SQLException {
		
		Room room = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_room_info WHERE RoomName = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setString(1, roomName);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				room = new Room();
				
				room.setRoomId(rs.getInt("RoomId"));
				room.setLocation(rs.getString("Location"));
				room.setRoomName(rs.getString("RoomName"));
				room.setRoomCapacity(rs.getInt("RoomPermitNum"));	
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
		
		return room;
	}
	
	public Room getAnRoomById(int roomId) throws SQLException {
		
		Room room = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_room_info WHERE RoomId = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, roomId);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				room = new Room();
				
				room.setRoomId(rs.getInt("RoomId"));
				room.setLocation(rs.getString("Location"));
				room.setRoomName(rs.getString("RoomName"));
				room.setRoomCapacity(rs.getInt("RoomPermitNum"));	
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
		
		return room;
	}
	
	/**
	 * ��δ���ÿ����Ŀ������ÿ�����Ϊ֮�󽫿�����Ϣ�������ݿ���׼��
	 * @param exam
	 * @param roomName
	 * @return
	 * @throws SQLException 
	 */
	public boolean allocateExamToRoom(Exam exam, String roomName) throws SQLException {
		
		boolean retVal = false;
		Room room = getAnRoomByName(roomName);
		
		if (room != null)
		{
			exam.setRoom(room);
			retVal = true;
		}
		
		return retVal;
	}
	
	/**
	 * ����һ������
	 * @param exam
	 * @return �ɹ������exam��examId�ţ����򷵻�0
	 * @throws SQLException 
	 */
	public int insertAnExam(Exam exam) throws SQLException {
		
		int retVal = 0;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		PreparedStatement prepStmt2 = null;
		ResultSet rs = null;
		
		String insertStatement = "INSERT INTO t_exam (Subject,Category,Time,RoomId) VALUES(?,?,?,?)";
		String selectStatement = "SELECT ExamId FROM t_exam WHERE Subject=? AND Category=? AND Time=? AND RoomId=?";
		
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(insertStatement);
			prepStmt.setString(1, exam.getSubjectName());
			prepStmt.setString(2, StudentInfo.getCategoryString(exam.getCategory()));
			prepStmt.setTimestamp(3, exam.getDatetime());
			prepStmt.setInt(4, exam.getRoom().getRoomId());
			int result = prepStmt.executeUpdate();
			
			prepStmt2 = con.prepareStatement(selectStatement);
			prepStmt2.setString(1, exam.getSubjectName());
			prepStmt2.setString(2, StudentInfo.getCategoryString(exam.getCategory()));
			prepStmt2.setTimestamp(3, exam.getDatetime());
			prepStmt2.setInt(4, exam.getRoom().getRoomId());
			rs = prepStmt2.executeQuery();
			
			
			if (result > 0 && rs.next()) 
			{
				retVal = rs.getInt("ExamId");
			}
		}
		catch (SQLException e) 
		{
			// TODO: handle exception
			//�Զ��ύ������Ҫrollback
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
	
	/**
	 * ɾ��һ������
	 * @param exam
	 * @return ɾ���Ƿ�ɹ�
	 * @throws SQLException 
	 */
	public boolean deleteAnExam(Exam exam) throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String deleteStatement = "DELETE FROM t_exam WHERE ExamId=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(deleteStatement);
			prepStmt.setInt(1, exam.getExamId());
			
			int result = prepStmt.executeUpdate();
			if (result > 0) 
			{
				retVal = true;
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
		
		return retVal;
		
	}
	
	/**
	 * �޸�һ������
	 * @param exam
	 * @return �޸��Ƿ�ɹ�
	 * @throws SQLException 
	 */
	public boolean updateAnExam(Exam exam) throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String updateStatement = "UPDATE t_exam SET RoomId=?, Subject=?, Category=?, Time=? WHERE ExamId=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setInt(1, exam.getRoom().getRoomId());
			prepStmt.setString(2, exam.getSubjectName());
			prepStmt.setString(3, StudentInfo.getCategoryString(exam.getCategory()));
			prepStmt.setTimestamp(4, exam.getDatetime());
			prepStmt.setInt(5, exam.getExamId());
			
			int result = prepStmt.executeUpdate();
			if (result > 0) 
			{
				retVal = true;
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
		
		return retVal;
		
	}
	
	/**
	 * �г����п�������
	 * @return �����б�
	 * @throws SQLException 
	 */
	public LinkedList<Exam> listExams() throws SQLException {
		
		LinkedList<Exam> examsList = new LinkedList<Exam>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_exam";
		
		try 
		{
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectStatment);
			
			while (rs.next())
			{
				Exam exam = new Exam();
				exam.setExamId(rs.getInt("ExamId"));
				exam.setSubjectName(rs.getString("Subject"));
				exam.setCategory(StudentInfo.getCategory(rs.getString("Category")));
				exam.setDatetime(rs.getTimestamp("Time"));
				
				Room room = getAnRoomById(rs.getInt("RoomId"));
				exam.setRoom(room);	
				
				examsList.add(exam);
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
			returnConnection(con);
		}
		
		return examsList;
		
	}
	
	public int getExamId(String category, String subjectName, String location, String roomName) throws SQLException {
		
		int examId = -1;
		int roomId = -1;
		Room room = getAnRoom(roomName, location);
		if (room != null) roomId = room.getRoomId();
		if (roomId <= 0) return examId;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT ExamId FROM t_exam WHERE Category=? and Subject=? and RoomId=?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setString(1, category);
			prepStmt.setString(2, subjectName);
			prepStmt.setInt(3, roomId);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				examId = rs.getInt("ExamId");
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
		
		return examId;
		
	}
	
	public Exam getAnExamByExamId(int examId) throws SQLException {
		
		Exam exam = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		PreparedStatement prepStmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		String selectStatment = "SELECT * FROM t_exam WHERE ExamId = ?";
		String selectStatement2 = "SELECT * FROM t_room_info WHERE RoomId=?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, examId);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{			
				prepStmt2 = con.prepareStatement(selectStatement2);
				prepStmt2.setInt(1, rs.getInt("RoomId"));
				
				rs2 = prepStmt2.executeQuery();
				
				if (rs2.next())
				{
					exam = new Exam();
					
					exam.setExamId(rs.getInt("ExamId"));
					exam.setSubjectName(rs.getString("Subject"));
					exam.setCategory(StudentInfo.getCategory(rs.getString("Category")));
					exam.setDatetime(rs.getTimestamp("Time"));
					
					Room room = new Room();
					room.setRoomId(rs2.getInt("RoomId"));
					room.setLocation(rs2.getString("Location"));
					room.setRoomName(rs2.getString("RoomName"));
					room.setRoomCapacity(rs2.getInt("RoomPermitNum"));
					
					exam.setRoom(room);	
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
			closeResultSet(rs2);
			closePrepStmt(prepStmt);
			closePrepStmt(prepStmt2);
			returnConnection(con);
		}
		
		return exam;
	}
	
}
