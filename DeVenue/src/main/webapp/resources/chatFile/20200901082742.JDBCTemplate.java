package common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class JDBCTemplate {
	// 싱글톤 방식이니 다 static 메소드로 만들자!
	// Connection 만들어 반환하는 메소드
	public static Connection getConnection() {
		Connection conn = null;
		
		Properties prop = new Properties();
		try {
			
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "testjdbc"
			String password = "testjdbc"
			
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;	
	}

	// 각종 close메소드
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 트랜잭션(commit, rollback)메소드(Connection 객체가 제공하는 메소드로 처리함)
	// (매개변수로 Connection 객체가 필요한 메소드들)
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
