package control;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.mysql.jdbc.PreparedStatement;

public class ExcelReader extends DBControl {
	
    public ExcelReader() throws Exception {
		super();
		// TODO �Զ����ɵĹ��캯�����
	}

	public void read(String path,String table) {
    try {           
    HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(path)); // ������Excel�������ļ�������          
    HSSFSheet sheet = workbook.getSheet("���ݱ�");  // �����Թ���������á�
    int rows = sheet.getPhysicalNumberOfRows();         //��ȡ��������         
    for (int r = 1; r < rows; r++) {                //ѭ������������
        String value ="";                           //���屣���ȡ���ݵ�String����
        HSSFRow row = sheet.getRow(r);              //��ȡ��Ԫ����ָ�����ж���  
        if (row != null) {
           int  cells = row.getPhysicalNumberOfCells(); //��ȡ��Ԫ����ָ���ж���
            for (short c = 1; c < cells; c++) {      //ѭ��������Ԫ���е���                  
                HSSFCell cell = row.getCell((short) c); //��ȡָ����Ԫ���е���                      
                if (cell != null) {
                    if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {  //�жϵ�Ԫ���ֵ�Ƿ�Ϊ�ַ�������                                
                        value += cell.getStringCellValue()+",";
                    } else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {  //�жϵ�Ԫ���ֵ�Ƿ�Ϊ��������                                
                        value += cell.getNumericCellValue()+",";
                    } else if(cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN){    //�жϵ�Ԫ���ֵ�Ƿ�Ϊ��������                      
                        value += cell.getStringCellValue()+",";
                    }
                }                       
            }                  
        }
        String [] str = value.split(",");           //���ַ������зָ�
        insert(str,table);                    //���������ݿ�������ݷ���
    }   
} catch (Exception e) {
    e.printStackTrace();            
}
    }
	public void insert(String[] str,String table) throws SQLException {
	    Connection con = null;// ���û�ȡ���ݿ����ӷ���
	    java.sql.PreparedStatement prepStmt = null;
	    int n = getColumnCount(table);
	    String sql = "insert into ? values('" + str[0] + "')"; // ���������ݿ�������ݵ�SQL���
	    for(int i=1;i<=n;i++)
	    {
	    	sql.substring(0, sql.length()-1);
	        sql+=",'"+str[i]+"')";
	    }
	    try {
	        con = getConnection();
	        prepStmt = con.prepareStatement(sql);
	        prepStmt.setString(1, table);
	        prepStmt.executeQuery();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    finally
		{
			closePrepStmt(prepStmt);
			returnConnection(con);
		}
	}
	public int getColumnCount(String table) throws SQLException
	{
		Connection conn = getConnection();
	    ResultSet rest = null;
	    // �����ѯ��SQL���
	    String sql = "select * from "+table;
	    Statement statement;
	    try {
	        statement = conn.createStatement(); // ����Statementʵ��
	        rest = statement.executeQuery(sql); // ִ��SQL���       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    ResultSetMetaData metaData = rest.getMetaData();
	    int num = metaData.getColumnCount();
	    return num;
	}
}
