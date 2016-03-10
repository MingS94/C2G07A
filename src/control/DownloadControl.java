package control;

import java.awt.PageAttributes.MediaType;
import java.io.File;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

@Path("/Download")
public class DownloadControl extends DBControl {

	public DownloadControl() throws Exception {
		super();
		// TODO 自动生成的构造函数存根
	}
	
	@GET
	@Produces(javax.ws.rs.core.MediaType.APPLICATION_JSON)
	
	public static void main(String[] args) throws Exception{
		
		File file = new File("x://temp.xls");
		ExcelWriter e = new ExcelWriter(file);
		HSSFWorkbook book = new HSSFWorkbook();
	    ResultSet r = e.getRest("select * from t_student_info");
	    e.writeSheet(file,book,"专家考试", r);
	    ResultSet r1 = e.getRest("select * from t_score");
	    e.writeSheet(file, book,"学生考试", r1);
	    
	}   
}