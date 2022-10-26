package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dao {
	Connection con;
	PreparedStatement stmt;
	ResultSet rs;
	
	private final String URL="jdbc:mysql://localhost:3306/cadproduto";
	private final String USER = "root";
	private final String PASS = "luccas123";
	
	protected void open() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(URL, USER, PASS);
	}
	
	protected void close() throws Exception {
		con.close();
	}

}
