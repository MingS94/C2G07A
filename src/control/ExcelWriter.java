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
     * . * ����һ��Excel�ļ�д�������������ݽ�д�뵽ָ����xls�ļ���
     * . *
     * . * @param xlsFile ָ��Ŀ���ļ�λ�ã�ԭλ���Ѵ���ͬ���ļ���������
     * .
     * @throws Exception 
     */
    public ExcelWriter(File xlsFile) throws Exception {
    	this(xlsFile, null);        
    }
    
/**
 * . * ����һ��Excel�ļ�д�������������ݽ�д�뵽ָ����xls�ļ��У�
 * . * д������ʱ��ָ����ʽ��ʽд��
 * . *
 * . * @param xlsFile ָ��Ŀ���ļ�λ�ã�ԭλ���Ѵ���ͬ���ļ���������
 * . * @param dateFormat ���ڸ�ʽ�����Ϊnull�򰴱������ڸ�ʽ
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
     * д�����ݿ����������������ݵ�ָ��������
     */

    public void writeSheet(File file, HSSFWorkbook book,String name,ResultSet resultSet) throws SQLException {
    
		HSSFSheet sheet = book.createSheet(name); // ����������
		ResultSetMetaData metaData = resultSet.getMetaData(); // ��ȡ���� ResultSet�������е����ͺ�������Ϣ�Ķ���
		int rowNum = 0;
		HSSFRow header = sheet.createRow(rowNum); // д������
		int colCount = metaData.getColumnCount(); // ��ȡ���ݿ���й��м���
		for (int i = 0; i < colCount; i++) { // ѭ���������ݱ�����
			HSSFCell cell = header.createCell(i); // �������ݿ����ݴ�����Ԫ��
			writeCell(cell, metaData.getColumnLabel(i + 1)); // �����ݿ��е�����д�뵽��Ԫ����
		}
		while (resultSet.next()) { // ѭ��������ѯ�����
			rowNum++;
			HSSFRow row = sheet.createRow(rowNum); // ����һ��
			for (int i = 0; i < colCount; i++) {
				HSSFCell cell = row.createCell(i); // �½���Ԫ��
				writeCell(cell, resultSet.getObject(i + 1)); // �������������д�뵽��Ԫ����
			}
		}
		try {
			FileOutputStream fileO = new FileOutputStream(file); // ����FileOutputStream����
			book.write(fileO);
			fileO.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
}
    
    /**
     * д�����ݵ�ָ����Ԫ��
     */
    
    public void writeCell(HSSFCell hssFcell, Object object) {
    	if (object instanceof Date) { // �ж�Ҫд�����ֵ�Ƿ�Ϊ��������
    		Date d = (Date) object;
    		hssFcell.setCellValue(new HSSFRichTextString(dateFormatter.format(d)));// �������ı���ʽд��
    	} else if (object instanceof Boolean) { // �ж�Ҫд�����ֵ�Ƿ�Ϊ��������
    		boolean b = (Boolean) object;
    		hssFcell.setCellValue(b); // ����д������
    	} else if (object instanceof Number) { // �ж�Ҫд��������Ƿ�Ϊ��ֵ����
    		double d = ((Number) object).doubleValue();
    		hssFcell.setCellValue(d);// ����д����
    	} else {
    		String s = (String) object;
    		hssFcell.setCellValue(new HSSFRichTextString(s));
    	}
    }

    public ResultSet getRest(String sql) throws SQLException {
    	Connection conn = getConnection();
    	ResultSet rest = null;
    	// �����ѯ��SQL���
    	Statement statement;
    	try {
    		statement = conn.createStatement(); // ����Statementʵ��
    		rest = statement.executeQuery(sql); // ִ��SQL���       
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return rest;
    }
    
}
