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
		// TODO 自动生成的构造函数存根
	}

	public void read(String path,String table) {
    try {           
    HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(path)); // 创建对Excel工作簿文件的引用          
    HSSFSheet sheet = workbook.getSheet("数据表");  // 创建对工作表的引用。
    int rows = sheet.getPhysicalNumberOfRows();         //获取表格的行数         
    for (int r = 1; r < rows; r++) {                //循环遍历表格的行
        String value ="";                           //定义保存读取内容的String对象
        HSSFRow row = sheet.getRow(r);              //获取单元格中指定的行对象  
        if (row != null) {
           int  cells = row.getPhysicalNumberOfCells(); //获取单元格中指定列对象
            for (short c = 1; c < cells; c++) {      //循环遍历单元格中的列                  
                HSSFCell cell = row.getCell((short) c); //获取指定单元格中的列                      
                if (cell != null) {
                    if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {  //判断单元格的值是否为字符串类型                                
                        value += cell.getStringCellValue()+",";
                    } else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {  //判断单元格的值是否为数字类型                                
                        value += cell.getNumericCellValue()+",";
                    } else if(cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN){    //判断单元格的值是否为布尔类型                      
                        value += cell.getStringCellValue()+",";
                    }
                }                       
            }                  
        }
        String [] str = value.split(",");           //将字符串进行分割
        insert(str,table);                    //调用向数据库插入数据方法
    }   
} catch (Exception e) {
    e.printStackTrace();            
}
    }
	public void insert(String[] str,String table) throws SQLException {
	    Connection con = null;// 调用获取数据库连接方法
	    java.sql.PreparedStatement prepStmt = null;
	    int n = getColumnCount(table);
	    String sql = "insert into ? values('" + str[0] + "')"; // 定义向数据库插入数据的SQL语句
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
	    // 定义查询的SQL语句
	    String sql = "select * from "+table;
	    Statement statement;
	    try {
	        statement = conn.createStatement(); // 创建Statement实例
	        rest = statement.executeQuery(sql); // 执行SQL语句       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    ResultSetMetaData metaData = rest.getMetaData();
	    int num = metaData.getColumnCount();
	    return num;
	}
}
