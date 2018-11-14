package warmcoding.jdbc;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class warmConnect {
	private static String driverClass = null;
	private static String url = null;
	private static String user = null;
	private static String password = null;
	protected Connection conn = null;
	protected PreparedStatement ps = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
		
	public Connection getConnection()  throws Exception {
		InputStream in = getClass().getClassLoader().getResourceAsStream("database.properties");
		Properties properties = new Properties();
		properties.load(in);
		driverClass = properties.getProperty("jdbc.driver_class");
		url = properties.getProperty("jdbc.connection.url");
		user = properties.getProperty("jdbc.connection.username");
		password = properties.getProperty("jdbc.connection.password");
		
		Driver driver = (Driver) Class.forName(driverClass).newInstance();
		Properties info = new Properties();
		info.put("user",user);
		info.put("password", password);
		conn = driver.connect(url, info);
		
		return conn;
	}
	
	public int executeUpdate(String sql, Object[] params) throws Exception {
		int updateRows = 0;
		
		try {
			ps=getConnection().prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			updateRows=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateRows;
	}
	
	public ResultSet executeSQL(String sql,Object[] params) throws Exception {
		try {
			ps = getConnection().prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			rs=ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean closeResource() {
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
	
	public static void main(String[] args) throws Exception {
		warmConnect connect = new warmConnect();
		System.out.println(connect.getConnection());
	}
}
