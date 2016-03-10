package model;

import java.sql.Timestamp;
import model.StudentInfo.Category;

/**
 * 
 * @author ZhangXinqian
 * 考试信息类，代表一场考试（并非一门科目）
 */
public class Exam {

	private int examId;
	private String subjectName;
	private Category category;
	private java.sql.Timestamp datetime;
	private Room room;
	
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}	
	
}

