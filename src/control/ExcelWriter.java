package control;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelWriter extends DBControl {

	private File xlsFile = null;
    private String dateFormat = null;
    
    private HSSFWorkbook workbook = null;
    private SimpleDateFormat dateFormatter = null;
    
    /**
     * . * 创建一个Excel文件写入器，所有数据将写入到指定的xls文件中
     * . *
     * . * @param xlsFile 指定目标文件位置，原位置已存在同名文件将被覆盖
     * .
     * @throws Exception 
     */
    public ExcelWriter(File xlsFile) throws Exception {
    	this(xlsFile, null);        
    }
    
/**
 * . * 创建一个Excel文件写入器，所有数据将写入到指定的xls文件中；
 * . * 写入日期时以指定格式形式写入
 * . *
 * . * @param xlsFile 指定目标文件位置，原位置已存在同名文件将被覆盖
 * . * @param dateFormat 日期格式，如果为null则按本地日期格式
 * .
 * @throws Exception 
 */
    public ExcelWriter(File xlsFile, String dateFormat) throws Exception {
    	this.xlsFile = xlsFile;
    	workbook = new HSSFWorkbook();
    	try {
    		FileOutputStream fileoUut = new FileOutputStream(xlsFile);
    		workbook.write(fileoUut);
    		fileoUut.close();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
}
    
    /**
     * 写入数据库结果集的列名及数据到指定工作薄
     */

    public void writeSheet(File file, HSSFWorkbook book,String name,ResultSet resultSet) throws SQLException {
    
		HSSFSheet sheet = book.createSheet(name); // 创建工作表
		ResultSetMetaData metaData = resultSet.getMetaData(); // 获取关于 ResultSet对象中列的类型和属性信息的对象。
		int rowNum = 0;
		HSSFRow header = sheet.createRow(rowNum); // 写入列名
		int colCount = metaData.getColumnCount(); // 获取数据库表中共有几列
		for (int i = 0; i < colCount; i++) { // 循环遍历数据表列名
			HSSFCell cell = header.createCell(i); // 根据数据库内容创建单元格
			writeCell(cell, metaData.getColumnLabel(i + 1)); // 将数据库中的内容写入到单元格内
		}
		while (resultSet.next()) { // 循环遍历查询结果集
			rowNum++;
			HSSFRow row = sheet.createRow(rowNum); // 创建一行
			for (int i = 0; i < colCount; i++) {
				HSSFCell cell = row.createCell(i); // 新建单元格
				writeCell(cell, resultSet.getObject(i + 1)); // 将结果集中内容写入到单元格中
			}
		}
		try {
			FileOutputStream fileO = new FileOutputStream(file); // 创建FileOutputStream对象
			book.write(fileO);
			fileO.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
}
    
    /**
     * 写入数据到指定单元格
     */
    
    public void writeCell(HSSFCell hssFcell, Object object) {
    	if (object instanceof Date) { // 判断要写入的数值是否为日期类型
    		Date d = (Date) object;
    		hssFcell.setCellValue(new HSSFRichTextString(dateFormatter.format(d)));// 日期以文本形式写入
    	} else if (object instanceof Boolean) { // 判断要写入的数值是否为布尔类型
    		boolean b = (Boolean) object;
    		hssFcell.setCellValue(b); // 向表格写入数据
    	} else if (object instanceof Number) { // 判断要写入的数据是否为数值类型
    		double d = ((Number) object).doubleValue();
    		hssFcell.setCellValue(d);// 向表格写数据
    	} else {
    		String s = (String) object;
    		hssFcell.setCellValue(new HSSFRichTextString(s));
    	}
    }

    public ResultSet getRest(String sql) throws SQLException {
    	Connection conn = getConnection();
    	ResultSet rest = null;
    	// 定义查询的SQL语句
    	Statement statement;
    	try {
    		statement = conn.createStatement(); // 创建Statement实例
    		rest = statement.executeQuery(sql); // 执行SQL语句       
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return rest;
    }
    
}
