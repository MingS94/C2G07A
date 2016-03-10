package model;

/**
 * 
 * @author ZhangXinqian
 * 考生考试成绩类，保存了考试信息、学生信息和打分专家信息
 */
public class Score {

	private int scoreId;
	private int tempId;
	private String subjectName;
	private StudentInfo studentInfo;
	private Exam exam;
	private double fistPoint;
	private double finalPoint;
	private Expert expert;
	
	public Score() {
		
	}

	public int getScoreId() {
		return scoreId;
	}

	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	public double getFistPoint() {
		return fistPoint;
	}

	public void setFistPoint(double fistPoint) {
		this.fistPoint = fistPoint;
	}

	public double getFinalPoint() {
		return finalPoint;
	}

	public void setFinalPoint(double finalPoint) {
		this.finalPoint = finalPoint;
	}

	public Expert getExpert() {
		return expert;
	}

	public void setExpert(Expert expert) {
		this.expert = expert;
	}

	public int getTempId() {
		return tempId;
	}

	public void setTempId(int tempId) {
		this.tempId = tempId;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	
	
}
