package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import model.Exam;
import model.Expert;
import model.Score;
import model.StudentInfo;

public class ScoreMgmt extends DBControl {

	private ExperMgmt experMgmt = null;
	private StudentMgmt studentMgmt = null;
	private ExamMgmt examMgmt = null;
	
	public ScoreMgmt() throws Exception {
		super();
		// TODO Auto-generated constructor stub
		experMgmt = new ExperMgmt();
		studentMgmt = new StudentMgmt();
		examMgmt = new ExamMgmt();
	}

	public LinkedList<Score> listScores() throws SQLException {
		
		LinkedList<Score> scoresList = new LinkedList<Score>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT ScoreId FROM t_score";
		
		try 
		{
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(selectStatment);
			
			while (rs.next())
			{
				Score score = getScoreById(rs.getInt("ScoreId"));
				
				scoresList.add(score);
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
		
		return scoresList;
		
	}
	
	public LinkedList<Score> queryScores(int studentId) throws SQLException {
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		LinkedList<Score> list = new LinkedList<Score>();
		
		String queryStatement = "select ScoreId from t_score where StudentId = ?";
			
		try{
			con = getConnection();
			prepStmt = con.prepareStatement(queryStatement);
			
			prepStmt.setInt(1, studentId);
			
			rs = prepStmt.executeQuery();
			while(rs.next())
			{
				Score score = getScoreById(rs.getInt("ScoreId"));
				  
		        list.add(score);
			}
		}
		catch(SQLException e) {
			// TODO: handle exception
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
	
	public boolean deleteScore(int scoreId) throws SQLException
	{
		boolean retVal = false;
		
		Connection con = null;
	    PreparedStatement prepStmt = null;
	    String deleteStatement = "delete from t_score where ScoreId = ?";
	    try{
	    	con = getConnection();
	    	prepStmt = con.prepareStatement(deleteStatement);
	    	prepStmt.setInt(1, scoreId);
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
	
	//添加成绩记录，可以认为是将学生分配至考场
	//分配考生到考场，返回插入的score的ScoreId
	public boolean allocateStudentAndExpertToExam(int studentId, int expertId, int examId, String subject) throws SQLException{
        
		boolean retVal = false;
           
		Connection con = null;
		PreparedStatement prepStmt = null;
		PreparedStatement prepStmt2 = null;
		ResultSet rs = null;
		String insertStatement = "INSERT INTO t_score (StudentId,ExpertId,ExamId,TempId,Subject)"
				+ "VALUES(?,?,?,?,?)";
		String selectStatement = "select count(*) from t_score where ExamId = ?";
		
		try
		{
			int count = 0;
			con = getConnection();
			
			prepStmt2 = con.prepareStatement(selectStatement);
			prepStmt2.setInt(1, examId);
			rs = prepStmt2.executeQuery();
			if (rs.next())
			{
				count = rs.getInt(1);
			}
			
			prepStmt = con.prepareStatement(insertStatement);
			prepStmt.setInt(1, studentId);
			prepStmt.setInt(2, expertId);
			prepStmt.setInt(3, examId);
			prepStmt.setInt(4, count+1);
			prepStmt.setString(5, subject);
			
			int result = prepStmt.executeUpdate();
						
			if (result > 0) 
			{
				retVal = true;
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
	
	//上传学生分数
	public boolean addScore(int scoreId, double firstPoint, double finalPoint) throws SQLException {
		
		boolean retVal = false;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		String updateStatement = "UPDATE t_score SET FirstPoint=?, FinalPoint=? WHERE ScoreId=?";
		try
		{
			con = getConnection();
			
			prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setDouble(1, firstPoint);
			prepStmt.setDouble(2, finalPoint);
			prepStmt.setInt(3, scoreId);
			
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
	
	public int getScoreId(String registrationNumber, String category, String subjectName, String location, String roomName) throws SQLException {
		
		int scoreId = -1;
		StudentInfo studentInfo = studentMgmt.getStudentInfoByRegistrationNumber(registrationNumber);
		if (studentInfo == null) return scoreId;		
		int studentId = studentInfo.getStudentId();
		
		int examId = examMgmt.getExamId(category, subjectName, location, roomName);
		
		if (studentId <=0 || examId <= 0) return scoreId;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT ScoreId FROM t_score WHERE StudentId = ? and ExamId = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, studentId);
			prepStmt.setInt(2, examId);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				scoreId = rs.getInt("ScoreId");			
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
		
		return scoreId;
	}
	
	public Score getScoreById(int scoreId) throws SQLException {
		
		Score s = null;
		
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		
		String selectStatment = "SELECT * FROM t_score WHERE ScoreId = ?";
		
		try 
		{
			con = getConnection();
			prepStmt = con.prepareStatement(selectStatment);
			prepStmt.setInt(1, scoreId);
			
			rs = prepStmt.executeQuery();
			
			if (rs.next())
			{
				s = new Score();
				Expert expert = experMgmt.getExpertById(rs.getInt("ExpertId"));
				StudentInfo studentInfo = studentMgmt.getStudentInfoById(rs.getInt("StudentId"));
				Exam exam = examMgmt.getAnExamByExamId(rs.getInt("ExamId"));
				s.setExpert(expert);
				s.setExam(exam);
				s.setStudentInfo(studentInfo);
				s.setScoreId(rs.getInt("ScoreId"));
				s.setTempId(rs.getInt("TempId"));
				s.setSubjectName(rs.getString("Subject"));
				s.setFistPoint(rs.getDouble("FirstPoint"));
				s.setFinalPoint(rs.getDouble("FinalPoint"));
					
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
	
}
